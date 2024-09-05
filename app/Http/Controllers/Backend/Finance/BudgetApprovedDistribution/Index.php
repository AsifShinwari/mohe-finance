<?php

namespace App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BudgetPlan;
use App\Models\BudgetApprovedDistribution;
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

class Index extends Controller
{
    public function index(Request $request,$budget_plan_id){

        $code_org_4 = CodeOrg::get_code_4()->get(); //get sub-organization code 4
        $code_project_6 = CodeProject::get_list(null,true)->get(); //get project code 6
        $code_program_3 = CodeProgram::get_code_3()->get(); //get program code 3
        $code_fund_4 = CodeFund::get_code_4()->get(); //get fund code 4
        $code_location_2 = CodeLocations::get_code_2()->get(); //get provinces code 4
        $code_category_1 = CodeCategory::get(); //get Category code 1
        $code_objects_2 = CodeObject::get_code_2()->get(); //get Object 2 code 1
        $budget_approveds = BudgetApproved::where('budget_plan_id',$budget_plan_id)->get();//approved budget details

        $budget_plan = BudgetPlan::where('id',$budget_plan_id)->first();
        $b20 = BudgetApprovedDistribution::where('budget_plan_id',$budget_plan_id)->get();

        return view('backend.finance.budget-approved-distribution.index',
        compact('budget_plan','b20','code_org_4',
        'code_project_6','code_program_3',
        'code_fund_4','code_location_2',
        'code_category_1','code_objects_2','budget_approveds'));
    }

    public function store(Request $request){
       if($request->edit_id==0){ //create new row
            $request->validate([
                'code_cate_1'=>'required',
                'code_fund_4'=>'required',
                'code_loaction'=>'required',
                'code_object_2'=>'required',
                'code_org_4'=>'required',
                'code_program_3'=>'required',
                'code_project_6'=>'required',
                'budget_plan_id'=>'required',
                'month'=>'required',
                'amount'=>'required',
            ]);

           if($this->get_month($request->month)=='invalid'){
             return response()->json(['result'=>403,'msg'=>'Validation failed!']);
           }

           $exist = BudgetApprovedDistribution::where('code_cate_1',$request->code_cate_1)
           ->where('code_fund_4',$request->code_fund_4)
           ->where('code_loaction',$request->code_loaction)
           ->where('code_object_2',$request->code_object_2)
           ->where('code_org_4',$request->code_org_4)
           ->where('code_program_3',$request->code_program_3)
           ->where('code_project_6',$request->code_project_6)
           ->where('budget_plan_id',$request->budget_plan_id)
           ->where($this->get_month($request->month),'!=',0)
           ->first();

            if($exist){
                return response()->json(['result'=>403,'msg'=>'A record with same details already exists!']);
            }

            $old_exist = BudgetApprovedDistribution::where('code_cate_1',$request->code_cate_1)
           ->where('code_fund_4',$request->code_fund_4)
           ->where('code_loaction',$request->code_loaction)
           ->where('code_object_2',$request->code_object_2)
           ->where('code_org_4',$request->code_org_4)
           ->where('code_program_3',$request->code_program_3)
           ->where('code_project_6',$request->code_project_6)
           ->where('budget_plan_id',$request->budget_plan_id)
           ->first();

           if($old_exist){
                BudgetApprovedDistribution::where('id',$old_exist->id)->update([
                    $this->get_month($request->month)=>$request->amount,
                    'user_id'=>auth()->user()->id,
                ]);
                $recentInsertedId = $old_exist->id;
           }else{
                $recentInsertedId = BudgetApprovedDistribution::insertGetId([
                    'code_cate_1'=>$request->code_cate_1,
                    'code_fund_4'=>$request->code_fund_4,
                    'code_loaction'=>$request->code_loaction,
                    'code_object_2'=>$request->code_object_2,
                    'code_org_4'=>$request->code_org_4,
                    'code_program_3'=>$request->code_program_3,
                    'code_project_6'=>$request->code_project_6,
                    $this->get_month($request->month)=>$request->amount,
                    'budget_plan_id'=>$request->budget_plan_id,
                    'user_id'=>auth()->user()->id,
                ]);
           }

        }else{ //update row
            BudgetApprovedDistribution::where('id',$request->edit_id)->update([
                $this->get_month($request->month)=>$request->amount,
                'user_id'=>auth()->user()->id,
            ]);
        }

        $b20 = BudgetApprovedDistribution::where('budget_plan_id',$request->budget_plan_id)->get();
        $budget_approveds = BudgetApproved::where('budget_plan_id',$request->budget_plan_id)->get();//approved budget details
        $budget_plan = BudgetPlan::where('id',$request->budget_plan_id)->first();
        $html_major_codes = view('backend.finance.budget-approved-distribution.calculate_major_codes',[
            'budget_approveds'=>$budget_approveds,
            'budget_plan'=>$budget_plan,
        ])->render();

        $html2 = view('backend.finance.budget-approved-distribution.table_body',['b20'=>$b20])->render();
        
        return response()->json(['result'=>200,'html'=>$html2,'html_major_codes'=>$html_major_codes]);
    }

    public function get_month($month){
        switch ($month) {
            case 'Hamal':
                return 'm_1';
                break;
            case 'Sawar':
                return 'm_2';
                break;
            case 'Jawza':
                return 'm_3';
                break;
            case 'Saratan':
                return 'm_4';
                break;
            case 'Asad':
                return 'm_5';
                break;
            case 'Sunbula':
                return 'm_6';
                break;
            case 'Mezan':
                return 'm_7';
                break;
            case 'Aqrab':
                return 'm_8';
                break;
            case 'Qaous':
                return 'm_9';
                break;
            case 'Jadi':
                return 'm_10';
                break;
            case 'Dalwa':
                return 'm_11';
                break;
            case 'Hoot':
                return 'm_12';
                break;
            default:
                return 'invalid';
                break;
        }
    }

    public static function calculate_code_remaining($budget_plan_id,$code_object_2){

        $b20 = BudgetApprovedDistribution::where('budget_plan_id',$budget_plan_id)
        ->where('code_object_2',$code_object_2)
        ->select(DB::raw('sum((m_1+m_2+m_3+m_4+m_5+m_6+m_7+m_8+m_9+m_10+m_11+m_12)) as total'))
        ->first();

        if($b20){
            return $b20->total;
        }else{
            return 0;
        }
        
    }

    public function delete(Request $request){
        $is_deleted = BudgetApprovedDistribution::where('id',$request->id)->delete();

        if($is_deleted){

            $b20 = BudgetApprovedDistribution::where('budget_plan_id',$request->budget_plan_id)->get();
            $budget_approveds = BudgetApproved::where('budget_plan_id',$request->budget_plan_id)->get();//approved budget details
            $budget_plan = BudgetPlan::where('id',$request->budget_plan_id)->first();
            $html_major_codes = view('backend.finance.budget-approved-distribution.calculate_major_codes',[
                'budget_approveds'=>$budget_approveds,
                'budget_plan'=>$budget_plan,
            ])->render();
            $html2 = view('backend.finance.budget-approved-distribution.table_body',['b20'=>$b20])->render();
        
            return response()->json(['result'=>200,'html'=>$html2,'html_major_codes'=>$html_major_codes,'msg'=>'Record deleted successfully!']);
        }else{
            return response()->json(['result'=>403,'msg'=>'Failed to delete record!']);
        }
    }

    public function edit(Request $request){

        $data = BudgetApprovedDistribution::where('id',$request->id)->first();
        $month = $request->month;
        $month_col = $this->get_month($request->month);

        $b10_coding_block = $this->get_b10_code_amount_result($data->budget_plan_id,$data->code_fund_4,$data->code_loaction,$data->code_object_2,$data->code_program_3,$data->code_project_6);

        if($data){
            return response()->json(['result'=>200,'data'=>$data,'amount'=>$data->$month_col,'month'=>$month,'b10_codeing_block_html'=>$b10_coding_block['html']]);
        }else{
            return response()->json(['result'=>403,'msg'=>'Failed to load record!']);
        }
    }

    public function get_month_amount(Request $request){

        $data = BudgetApprovedDistribution::where('id',$request->id)->first();

        if($data){
            
            $amount = 0;
            $month = $this->get_month($request->month);

            if($month!='invalid'){
                $amount = $data->$month;
            }

            return response()->json(['result'=>200,'amount'=>$amount]);
        }else{
            return response()->json(['result'=>403,'msg'=>'Invalid month selected!']);
        }
    }

    public function print(Request $request){
        $budget_plan = BudgetPlan::where('id',$request->budget_plan_id)->first();
        $b20 = BudgetApprovedDistribution::where('budget_plan_id',$request->budget_plan_id)->get();
        return view('backend.finance.budget-approved-distribution.print_b20',compact('b20','budget_plan'));
    }

    public function get_b10_code_amount(Request $req){

        $b10_block_amount = BudgetApprovedDistributionB10::get_b10_form()
        ->where('budget_plan_id',$req->budget_plan_id)
        ->where('code_fund_4',$req->code_fund_4)
        ->where('code_loaction',$req->code_loaction)
        ->where('code_object_2',$req->code_object_2)
        ->where('code_program_3',$req->code_program_3)
        ->where('code_project_6',$req->code_project_6)
        ->first();

        $result = $this->get_b10_code_amount_result($req->budget_plan_id,$req->code_fund_4,$req->code_loaction,$req->code_object_2,$req->code_program_3,$req->code_project_6);

        return response()->json($result);
    }

    public function get_b10_code_amount_result($budget_plan_id,$code_fund_4,$code_loaction,$code_object_2,$code_program_3,$code_project_6){

        $b10_block_amount = BudgetApprovedDistributionB10::get_b10_form()
        ->where('budget_plan_id',$budget_plan_id)
        ->where('code_fund_4',$code_fund_4)
        ->where('code_loaction',$code_loaction)
        ->where('code_object_2',$code_object_2)
        ->where('code_program_3',$code_program_3)
        ->where('code_project_6',$code_project_6)
        ->first();

        $b20_block_amount = BudgetApprovedDistribution::where('budget_plan_id',$budget_plan_id)
        ->where('code_fund_4',$code_fund_4)
        ->where('code_loaction',$code_loaction)
        ->where('code_object_2',$code_object_2)
        ->where('code_program_3',$code_program_3)
        ->where('code_project_6',$code_project_6)
        ->select(DB::raw('sum(m_1+m_2+m_3+m_4+m_5+m_6+m_7+m_8+m_9+m_10+m_11+m_12) as total'))
        ->first();

        $total_spent = 0;
        if($b20_block_amount){
            $total_spent = $b20_block_amount->total;
            if($total_spent==null){
                $total_spent = 0;
            }
        }

        if($b10_block_amount){

            $codeing_block = $b10_block_amount->code_org_3.'-'.$b10_block_amount->code_project_6.'-'.
            $b10_block_amount->code_program_3.'-'.$b10_block_amount->code_fund_4.'-'.$b10_block_amount->code_loaction.'-'
            .\Settings::trans($b10_block_amount->en_prov_name,$b10_block_amount->pa_prov_name,$b10_block_amount->da_prov_name);

            $html = '<div title="B10 Form Coding Block (Org(4), Project Code(5), Program Code(3), Fund Code(4), Province (1))">
              <span class="px-1 bg-light text-success" title="'.($b10_block_amount->amount-$total_spent).'">
                <span class="text-danger" id="code-spent">'.($total_spent).'</span>
                / <span id="code-amount">'.($b10_block_amount->amount).'</span>
              </span>
              <span class="border-left px-1 bg-secondary text-right">'.$codeing_block.'</span>
            </div>';

            return [
                'result'=>200,
                'codeing_block'=>$codeing_block,
                'amount'=>$b10_block_amount->amount,
                'spent'=>$total_spent,
                'html'=>$html,
            ];
        }

        return [
            'result'=>403,
            'codeing_block'=>'',
            'amount'=>0,
            'spent'=>0,
            'html'=>'',
        ];
    }
}