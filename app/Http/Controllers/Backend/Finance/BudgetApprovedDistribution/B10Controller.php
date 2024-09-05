<?php

namespace App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BudgetPlan;
use App\Models\BudgetApprovedDistributionB10;
use App\Models\CodeOrg;
use App\Models\CodeProject;
use App\Models\CodeProgram;
use App\Models\CodeFund;
use App\Models\CodeLocations;
use App\Models\CodeCategory;
use App\Models\CodeObject;
use App\Models\BudgetApproved;
use DB;

class B10Controller extends Controller
{
    public function index(Request $request,$budget_plan_id){

        $code_org_3 = CodeOrg::get_code_3()->get(); //get sub-organization code 3
        $code_project_6 = CodeProject::get_list(null,true)->get(); //get project code 6
        $code_program_3 = CodeProgram::get_code_3()->get(); //get program code 3
        $code_fund_4 = CodeFund::get_code_4()->get(); //get fund code 4
        $code_location_2 = CodeLocations::get_code_2()->get(); //get provinces code 4
        // $code_category_1 = CodeCategory::get(); //get Category code 1
        $code_objects_2 = CodeObject::get_code_2()->get(); //get Object 2 code 1
        $budget_approveds = BudgetApproved::where('budget_plan_id',$budget_plan_id)->get();//approved budget details

        $budget_plan = BudgetPlan::where('id',$budget_plan_id)->first();
        $b10 = BudgetApprovedDistributionB10::get_b10_form()
        ->where('budget_plan_id',$budget_plan_id)->get();

        return view('backend.finance.budget-approved-distribution-b10.index',
        compact('budget_plan','b10','code_org_3',
        'code_project_6','code_program_3',
        'code_fund_4','code_location_2',
        'code_objects_2','budget_approveds'));
    }

    public static function get_major_amount($budget_plan_id,$code_org_3,$code_project_6,$code_program_3,$code_fund_4,$code_loaction,$code_object_2){
        $major_code_amount = BudgetApprovedDistributionB10::where('budget_plan_id',$budget_plan_id)
        ->where('code_org_3',$code_org_3)
        ->where('code_project_6',$code_project_6)
        ->where('code_program_3',$code_program_3)
        ->where('code_fund_4',$code_fund_4)
        ->where('code_loaction',$code_loaction)
        ->where('code_object_2',$code_object_2)
        ->first();

        if($major_code_amount){
            return $major_code_amount->amount;
        }else{
            return 0;
        }
    }

    public static function get_major_total_amount($budget_plan_id,$major_code){
        $record = BudgetApprovedDistributionB10::where('budget_plan_id',$budget_plan_id)
        ->where('code_object_2',$major_code)
        ->groupBy('code_object_2')
        ->select(DB::raw('sum(amount) as total'))
        ->first();
        if($record){
            return $record->total;
        }else{
            return 0;
        }
    }

    public function store(Request $request){
        if($request->edit_id==0){ //create new row
             $request->validate([
                 'code_fund_4'=>'required',
                 'code_loaction'=>'required',
                 'code_object_2'=>'required',
                 'code_org_3'=>'required',
                 'code_program_3'=>'required',
                 'code_project_6'=>'required',
                 'budget_plan_id'=>'required',
                 'amount'=>'required',
             ]);
 
            $exist = BudgetApprovedDistributionB10::where('code_fund_4',$request->code_fund_4)
            ->where('code_loaction',$request->code_loaction)
            ->where('code_object_2',$request->code_object_2)
            ->where('code_org_3',$request->code_org_3)
            ->where('code_program_3',$request->code_program_3)
            ->where('code_project_6',$request->code_project_6)
            ->where('budget_plan_id',$request->budget_plan_id)
            ->first();
 
             if($exist){
                 return response()->json(['result'=>403,'msg'=>'A record with same details already exists!']);
             }
 
             $old_exist = BudgetApprovedDistributionB10::where('code_fund_4',$request->code_fund_4)
            ->where('code_loaction',$request->code_loaction)
            ->where('code_object_2',$request->code_object_2)
            ->where('code_org_3',$request->code_org_3)
            ->where('code_program_3',$request->code_program_3)
            ->where('code_project_6',$request->code_project_6)
            ->where('budget_plan_id',$request->budget_plan_id)
            ->first();
 
            if($old_exist){
                 BudgetApprovedDistributionB10::where('id',$old_exist->id)->update([
                     'amount'=>$request->amount,
                     'user_id'=>auth()->user()->id,
                 ]);
                 $recentInsertedId = $old_exist->id;
            }else{
                 $recentInsertedId = BudgetApprovedDistributionB10::insertGetId([
                     'code_fund_4'=>$request->code_fund_4,
                     'code_loaction'=>$request->code_loaction,
                     'code_object_2'=>$request->code_object_2,
                     'code_org_3'=>$request->code_org_3,
                     'code_program_3'=>$request->code_program_3,
                     'code_project_6'=>$request->code_project_6,
                     'amount'=>$request->amount,
                     'budget_plan_id'=>$request->budget_plan_id,
                     'user_id'=>auth()->user()->id,
                 ]);
            }
 
         }else{ //update row
             BudgetApprovedDistributionB10::where('id',$request->edit_id)->update([
                 'amount'=>$request->amount,
                 'user_id'=>auth()->user()->id,
             ]);
         }
 
        $b10 = BudgetApprovedDistributionB10::get_b10_form()->where('budget_plan_id',$request->budget_plan_id)->get();
         $budget_approveds = BudgetApproved::where('budget_plan_id',$request->budget_plan_id)->get();//approved budget details
         $budget_plan = BudgetPlan::where('id',$request->budget_plan_id)->first();
        $code_objects_2 = CodeObject::get_code_2()->get(); //get Object 2 code 1
         $html_major_codes = view('backend.finance.budget-approved-distribution-b10.calculate_major_codes',[
             'budget_approveds'=>$budget_approveds,
             'budget_plan'=>$budget_plan,
         ])->render();
 
         $html2 = view('backend.finance.budget-approved-distribution-b10.table_body',['b10'=>$b10,'code_objects_2'=>$code_objects_2])->render();
         
         return response()->json(['result'=>200,'html'=>$html2,'html_major_codes'=>$html_major_codes]);
     }

     public static function calculate_code_total($budget_plan_id,$code_object_2){

        $b10 = BudgetApprovedDistributionB10::where('budget_plan_id',$budget_plan_id)
        ->where('code_object_2',$code_object_2)
        ->select(DB::raw('sum(amount) as total'))
        ->first();

        if($b10){
            return $b10->total;
        }else{
            return 0;
        }
        
    }

    public function edit(Request $request){
        
        $groupRow = BudgetApprovedDistributionB10::where('id',$request->id)->first();

        $data = BudgetApprovedDistributionB10::where('budget_plan_id',$groupRow->budget_plan_id)
        ->where('code_object_2',$request->major_code)
        ->where('code_org_3',$groupRow->code_org_3)
        ->where('code_project_6',$groupRow->code_project_6)
        ->where('code_program_3',$groupRow->code_program_3)
        ->where('code_fund_4',$groupRow->code_fund_4)
        ->where('code_loaction',$groupRow->code_loaction)
        ->first();



        if($data){
            return response()->json(['result'=>200,'data'=>$data]);
        }else{
            BudgetApprovedDistributionB10::insert([
                'budget_plan_id'=>$groupRow->budget_plan_id,
                'code_object_2'=>$request->major_code,
                'code_org_3'=>$groupRow->code_org_3,
                'code_project_6'=>$groupRow->code_project_6,
                'code_program_3'=>$groupRow->code_program_3,
                'code_fund_4'=>$groupRow->code_fund_4,
                'code_loaction'=>$groupRow->code_loaction,
                'user_id'=>auth()->user()->id,
            ]);

            $data = BudgetApprovedDistributionB10::where('budget_plan_id',$groupRow->budget_plan_id)
            ->where('code_object_2',$request->major_code)
            ->where('code_org_3',$groupRow->code_org_3)
            ->where('code_project_6',$groupRow->code_project_6)
            ->where('code_program_3',$groupRow->code_program_3)
            ->where('code_fund_4',$groupRow->code_fund_4)
            ->where('code_loaction',$groupRow->code_loaction)
            ->first();

            return response()->json(['result'=>200,'data'=>$data]);
            // return response()->json(['result'=>403,'msg'=>'Failed to load record!']);
        }
    }

    public function delete(Request $request){

        $is_exist = BudgetApprovedDistributionB10::where('id',$request->id)->delete();

        if($is_exist){
            $b10 = BudgetApprovedDistributionB10::get_b10_form()->where('budget_plan_id',$request->budget_plan_id)->get();
            $budget_approveds = BudgetApproved::where('budget_plan_id',$request->budget_plan_id)->get();//approved budget details
            $budget_plan = BudgetPlan::where('id',$request->budget_plan_id)->first();
            $code_objects_2 = CodeObject::get_code_2()->get(); //get Object 2 code 1
            $html_major_codes = view('backend.finance.budget-approved-distribution-b10.calculate_major_codes',[
                'budget_approveds'=>$budget_approveds,
                'budget_plan'=>$budget_plan,
            ])->render();
            
            $html2 = view('backend.finance.budget-approved-distribution-b10.table_body',['b10'=>$b10,'code_objects_2'=>$code_objects_2])->render();
            return response()->json(['result'=>200,'html'=>$html2,'html_major_codes'=>$html_major_codes,'msg'=>'Record deleted successfully!']);

        }else{
            return response()->json(['result'=>403,'msg'=>'Failed to delete record!']);
        }
    }

    public function print(Request $req){

        $code_project_6 = $req->code_project_6;
        $code_program_3 = $req->code_program_3;
        $code_fund_4 = $req->code_fund_4;
        $code_loaction = $req->code_loaction;
        $code_object_2 = $req->code_object_2;
        
        $b10 = BudgetApprovedDistributionB10::get_b10_form()
        ->where('budget_plan_id',$req->budget_plan_id)
        ->when($code_project_6,function($qry) use ($code_project_6){
            $qry->where('code_project_6',$code_project_6);
        })
        ->when($code_program_3,function($qry) use ($code_program_3){
            $qry->where('code_program_3',$code_program_3);
        })
        ->when($code_fund_4,function($qry) use ($code_fund_4){
            $qry->where('code_fund_4',$code_fund_4);
        })
        ->when($code_loaction,function($qry) use ($code_loaction){
            $qry->where('code_loaction',$code_loaction);
        })
        ->when($code_object_2,function($qry) use ($code_object_2){
            $qry->where('code_object_2',$code_object_2)
            ->where('amount','!=',0);
        })->get();

        $budget_plan = BudgetPlan::where('id',$req->budget_plan_id)->first();
        $code_objects_2 = CodeObject::get_code_2()->get(); //get Object 2 code 1

        // budget_plan_id=1&code_project_6=&code_program_3=&code_fund_4=&code_loaction=&code_object_2=

        return view('backend.finance.budget-approved-distribution-b10.print.index',compact('b10','budget_plan','code_objects_2','code_object_2'));
    }

    public function print_get_info(Request $req){
        $budget_plan = BudgetPlan::where('id',$req->budget_plan_id)->first();
        return response()->json($budget_plan);
    }

    public function save_get_info(Request $req){

        BudgetPlan::where('id',$req->budget_plan_id)->update([
            'b10_afmis_reg_no'=>$req->b10_afmis_reg_no,
            'b10_finance_drctr'=>$req->b10_finance_drctr,
            'b10_gnrl_bgt_mgr'=>$req->b10_gnrl_bgt_mgr,
            'b10_gnrl_drctr'=>$req->b10_gnrl_drctr,
            'b20_afmis_no'=>$req->b20_afmis_no,
            'b20_beu_no'=>$req->b20_beu_no,
            'b20_form_no'=>$req->b20_form_no,
            'b20_needs_in_letters'=>$req->b20_needs_in_letters,
            'b20_prescription_gnrl_drctr'=>$req->b20_prescription_gnrl_drctr,
            'b20_sending_date'=>$req->b20_sending_date,
            'b20_sending_no'=>$req->b20_sending_no,
        ]);

        $budget_plan = BudgetPlan::where('id',$req->budget_plan_id)->first();
        
        return response()->json($budget_plan);
    }

}
