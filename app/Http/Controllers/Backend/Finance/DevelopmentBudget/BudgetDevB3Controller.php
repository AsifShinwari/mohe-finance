<?php

namespace App\Http\Controllers\Backend\Finance\DevelopmentBudget;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BudgetPlan;
use App\Models\BudgetDevB3;
use App\Models\BudgetDevApproved;
use App\Models\CodeOrg;
use App\Models\CodeProject;
use App\Models\CodeProgram;
use App\Models\CodeFund;
use App\Models\CodeLocations;
use App\Models\CodeCategory;
use App\Models\CodeObject; 
use DB;

class BudgetDevB3Controller extends Controller
{
    public function index(Request $req,$plan_id){

        $fcode_project_6 = $req->code_project_6;
        $fcode_program_3 = $req->code_program_3;
        $fcode_fund_4 = $req->code_fund_4;
        $fcode_loaction = $req->code_loaction;
        $fcode_object_2 = $req->code_object_2;
        $fbudget_plan_id = $plan_id;

        $budget_plan = BudgetPlan::where('id',$plan_id)->first();

        $code_org_3 = CodeOrg::get_code_3()->get(); //get sub-organization code 3
        $code_project_6 = CodeProject::get_list(null,true)->get(); //get project code 6 
        $code_program_3 = CodeProgram::get_code_3()->get(); //get program code 3
        $code_fund_4 = CodeFund::get_code_4()->get(); //get fund code 4
        $code_location_2 = CodeLocations::get_code_2()->get(); //get provinces code 4
        $code_objects_2 = CodeObject::get_code_2()->get(); //get Object 2 code 1
        
        $b3 = BudgetDevB3::get_list()->where('budget_dev_approveds.budget_plan_id',$plan_id)
        ->when($fcode_project_6,function($qry) use($fcode_project_6){
            $qry->where('code_project_6',$fcode_project_6);
        })
        ->when($fcode_program_3,function($qry) use($fcode_program_3){
            $qry->where('code_program_3',$fcode_program_3);
        })
        ->when($fcode_fund_4,function($qry) use($fcode_fund_4){
            $qry->where('code_fund_4',$fcode_fund_4);
        })
        ->when($fcode_loaction,function($qry) use($fcode_loaction){
            $qry->where('code_province_2',$fcode_loaction);
        })
        ->when($fcode_object_2,function($qry) use($fcode_object_2){
            $qry->where('code_object_2',$fcode_object_2)
            ->where('amount','!=',0); 
        })
        ->groupBy('budget_dev_b3.budget_dev_approveds_id','budget_dev_b3.code_province_2')
        ->orderBy('budget_dev_b3.code_province_2','asc')
        ->paginate(10);

        $is_finalized = $this->is_finalized($plan_id);

        return view('backend.finance.development_budget.b3.index.index',
        compact('budget_plan',
        'b3',
        'code_org_3',
        'code_project_6',
        'code_program_3',
        'code_fund_4',
        'code_location_2',
        'code_objects_2','is_finalized'));
    }

    public function is_finalized($budget_plan_id){
        $exist = BudgetDevB3::get_list()->where('budget_dev_approveds.budget_plan_id',$budget_plan_id)
        ->first();

        if($exist){
            return $exist->is_finalized;
        }

        return false;
    }

    public function create(Request $req,$plan_id){

        $code_org_3 = CodeOrg::get_code_3()->get(); //get sub-organization code 3
        $code_project_6 = CodeProject::get_list(null,true)->get(); //get project code 6 // reload only development
        $code_program_3 = CodeProgram::get_code_3()->get(); //get program code 3
        $code_fund_4 = CodeFund::get_code_4()->get(); //get fund code 4
        $code_location_2 = CodeLocations::get_code_2()->get(); //get provinces code 4
        $code_objects_2 = CodeObject::get_code_2()->get(); //get Object 2 code 1

        $budget_approveds = BudgetDevApproved::where('budget_plan_id',$plan_id)->get();//approved budget details

        $budget_plan = BudgetPlan::where('id',$plan_id)->first();

        return view('backend.finance.development_budget.b3.create.create',compact('budget_plan','code_org_3','code_project_6','code_program_3','code_fund_4','code_location_2','code_objects_2','budget_approveds'));
    }

    public function store(Request $req){
        if($req->ajax()){
            $validated_data = $req->validate([
                'code_org_3' =>'required',
                'budget_dev_approveds_id' =>'required',
                'code_program_3' =>'required',
                'code_fund_4' =>'required',
                'code_province_2' =>'required',
                'code_object_2' =>'required',
                'amount' =>'required'
            ]);

            $budget_approved = BudgetDevApproved::where('id',$req->budget_dev_approveds_id)->first(); 
            $budget_approveds = BudgetDevApproved::where('budget_plan_id',$budget_approved->budget_plan_id)->get(); 

            $validated_data['user_id'] = auth()->user()->id;
            $validated_data['code_project_6'] = $budget_approved->code;

            $spent = self::calculate_code_total($budget_approved->budget_plan_id,$budget_approved->code);

            if(($spent+$req->amount) > $budget_approved->budget_amount){
                return response()->json([
                    'result'=>500,
                   'msg'=>'Amount exceeds approved budget amount.'
                ]);
            }

            $is_saved = BudgetDevB3::create($validated_data);

            if($is_saved){
                
                $projects = view('backend.finance.development_budget.b3.create.calculate_major_codes',[
                    'budget_approveds'=>$budget_approveds
                ])->render();

                return response()->json([
                    'result'=>200,
                    'projects'=>$projects
                ]);
            }else{
                return response()->json([
                    'result'=>500,
                   'msg'=>'Failed to save data.'
                ]);
            }
        }
    }

    public function print(Request $req){
    
        $fcode_project_6 = $req->code_project_6;
        $fcode_program_3 = $req->code_program_3;
        $fcode_fund_4 = $req->code_fund_4;
        $fcode_loaction = $req->code_loaction;
        $fcode_object_2 = $req->code_object_2;
        $fbudget_plan_id = $req->budget_plan_id;
        $code_objects_2 = CodeObject::get_code_2()->get(); //get Object 2 code 1

        $b3 = BudgetDevB3::get_list()->where('budget_plan_id',$fbudget_plan_id)
        ->when($fcode_project_6,function($qry) use($fcode_project_6){
            $qry->where('code_project_6',$fcode_project_6);
        })
        ->when($fcode_program_3,function($qry) use($fcode_program_3){
            $qry->where('code_program_3',$fcode_program_3);
        })
        ->when($fcode_fund_4,function($qry) use($fcode_fund_4){
            $qry->where('code_fund_4',$fcode_fund_4);
        })
        ->when($fcode_loaction,function($qry) use($fcode_loaction){
            $qry->where('code_province_2',$fcode_loaction);
        })
        ->when($fcode_object_2,function($qry) use($fcode_object_2){
            $qry->where('code_object_2',$fcode_object_2)
            ->where('amount','!=',0);
        })
        ->get();

        $budget_plan = BudgetPlan::where('id',$fbudget_plan_id)->first();

        return view('backend.finance.development_budget.b3.print.print',
        compact('budget_plan','b3','code_objects_2'));
    }

    public static function calculate_code_total($budget_dev_approveds_id){

        $b3 = BudgetDevB3::join('budget_dev_approveds','budget_dev_b3.budget_dev_approveds_id','budget_dev_approveds.id')
        ->where('budget_dev_approveds_id',$budget_dev_approveds_id)
        ->select(DB::raw('sum(amount) as total'))
        ->first();
        if($b3){
            return $b3->total;
        }else{
            return 0;
        }
        
    }

    public static function get_major_amount($budget_plan_id,$code_org_3,$code_project_6,$code_program_3,$code_fund_4,$code_loaction,$major_code){
        
        $b3 = BudgetDevB3::get_list()
        ->where('budget_plan_id',$budget_plan_id)
        ->where('code_org_3',$code_org_3)
        ->where('code_project_6',$code_project_6)
        ->where('code_program_3',$code_program_3)
        ->where('code_fund_4',$code_fund_4)
        ->where('code_province_2',$code_loaction)
        ->where('code_object_2',$major_code)
        ->first();

        if($b3){
            return $b3->amount;
        }else{
            return 0;
        }
    }

    public function finalized($budget_plan_id){

        $exist = BudgetDevB3::get_list()
        ->where('budget_dev_approveds.budget_plan_id',$budget_plan_id)->first();
        $is_finalized = false;
        if($exist){
            BudgetDevB3::get_list()
            ->where('budget_dev_approveds.budget_plan_id',$budget_plan_id)
            ->update([
                'budget_dev_b3.is_finalized'=>!$exist->is_finalized,
            ]);
            
            session()->flash('success','Status Changed Successfully');

            return redirect()->route('finance.budget.dev.plan.b3.index',$budget_plan_id);
        }else{
            session()->flash('error','Status is not Changed');
            return redirect()->route('finance.budget.dev.plan.b20.index',$budget_plan_id);
        }
    }

    public function delete(Request $req){
        try {
            BudgetDevB3::where('id',$req->id)->delete();
            return response()->json([
                'result'=>200,
                'msg'=>'Successfully deleted!'
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'result'=>500,
                'msg'=>'Not Deleted!'
            ]);
        }
    }
}
