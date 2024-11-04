<?php

namespace App\Http\Controllers\Backend\Finance\DevelopmentBudget;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BudgetPlan;
use App\Models\BudgetDevB20;
use App\Models\BudgetDevB3;
use App\Models\BudgetApprovedDistributionB10;
use App\Models\CodeOrg;
use App\Models\CodeProject;
use App\Models\CodeProgram;
use App\Models\CodeFund;
use App\Models\CodeLocations;
use App\Models\CodeCategory;
use App\Models\CodeObject;
use App\Models\BudgetDevApproved;
use DB;

class B20 extends Controller{

    //modified
    public function index(Request $request,$budget_plan_id){

        $code_org_4 = CodeOrg::get_code_4()->get(); //get sub-organization code 4
        $code_project_6 = CodeProject::get_list(null,true)->get(); //get project code 6
        $code_program_3 = CodeProgram::get_code_3()->get(); //get program code 3
        $code_fund_4 = CodeFund::get_code_4()->get(); //get fund code 4
        $code_location_2 = CodeLocations::get_code_2()->get(); //get provinces code 4
        $code_category_1 = CodeCategory::get(); //get Category code 1
        $code_objects_2 = CodeObject::get_code_2()->get(); //get Object 2 code 1
        $budget_approveds = BudgetDevApproved::where('budget_plan_id',$budget_plan_id)->get();//approved budget details

        $budget_plan = BudgetPlan::where('id',$budget_plan_id)->first();
        $is_finalized = $this->is_finalized($budget_plan_id);
        
        $b20 = BudgetDevB20::get_list()->where('budget_plan_id',$budget_plan_id)->get();
        return view('backend.finance.development_budget.b20.index',
        compact('budget_plan','b20','code_org_4',
        'code_project_6','code_program_3',
        'code_fund_4','code_location_2',
        'code_category_1','code_objects_2','budget_approveds','is_finalized'));
    }

    public function is_finalized($budget_plan_id){
        $exist = BudgetDevB20::get_list()->where('budget_plan_id',$budget_plan_id)
        ->first();

        if($exist){
            return $exist->is_finalized;
        }

        return false;
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
                'budget_dev_b3_id'=>'required',
                'budget_plan_id'=>'required',
                'month'=>'required',
                'amount'=>'required',
            ]);

           if($this->get_month($request->month)=='invalid'){
             return response()->json(['result'=>403,'msg'=>'Validation failed!']);
           }

           $exist = BudgetDevB20::where('code_cate_1',$request->code_cate_1)
           ->where('code_fund_4',$request->code_fund_4)
           ->where('code_province_2',$request->code_loaction)
           ->where('code_object_2',$request->code_object_2)
           ->where('code_org_5',$request->code_org_4)
           ->where('code_program_3',$request->code_program_3)
           ->where('code_project_6',$request->code_project_6)
           ->where('budget_dev_b3_id',$request->budget_dev_b3_id)
           ->where($this->get_month($request->month),'!=',0)
           ->first();

            if($exist){
                return response()->json(['result'=>403,'msg'=>'A record with same details already exists!']);
            }

            $old_exist = BudgetDevB20::where('code_cate_1',$request->code_cate_1)
           ->where('code_fund_4',$request->code_fund_4)
           ->where('code_province_2',$request->code_loaction)
           ->where('code_object_2',$request->code_object_2)
           ->where('code_org_5',$request->code_org_4)
           ->where('code_program_3',$request->code_program_3)
           ->where('code_project_6',$request->code_project_6)
           ->where('budget_dev_b3_id',$request->budget_dev_b3_id)
           ->first();

           if($old_exist){
            BudgetDevB20::where('id',$old_exist->id)->update([
                    $this->get_month($request->month)=>$request->amount,
                    'user_id'=>auth()->user()->id,
                ]);
                $recentInsertedId = $old_exist->id;
           }else{
                $recentInsertedId = BudgetDevB20::insertGetId([
                    'code_cate_1'=>$request->code_cate_1,
                    'code_fund_4'=>$request->code_fund_4,
                    'code_province_2'=>$request->code_loaction,
                    'code_object_2'=>$request->code_object_2,
                    'code_org_5'=>$request->code_org_4,
                    'code_program_3'=>$request->code_program_3,
                    'code_project_6'=>$request->code_project_6,
                    $this->get_month($request->month)=>$request->amount,
                    'budget_dev_b3_id'=>$request->budget_dev_b3_id,
                    'user_id'=>auth()->user()->id,
                ]);
           }

        }else{ //update row
            BudgetDevB20::where('id',$request->edit_id)->update([
                $this->get_month($request->edit_month)=>$request->amount,
                'user_id'=>auth()->user()->id,
            ]);
        }

        $b20 = BudgetDevB20::get_list()->where('budget_plan_id',$request->budget_plan_id)->get();
        $budget_approveds = BudgetDevApproved::where('budget_plan_id',$request->budget_plan_id)->get();//approved budget details
        $budget_plan = BudgetPlan::where('id',$request->budget_plan_id)->first();
        $html_major_codes = view('backend.finance.development_budget.b20.calculate_major_codes',[
            'budget_approveds'=>$budget_approveds,
            'budget_plan'=>$budget_plan,
        ])->render();

        $html2 = view('backend.finance.development_budget.b20.table_body',['b20'=>$b20])->render();
        
        return response()->json(['result'=>200,'html'=>$html2,'html_major_codes'=>$html_major_codes]);
    }

    public function filter(Request $request){
            $code_project_6 = $request->f_code_project_6;
            $code_program_3 = $request->f_code_program_3;
            $code_fund_4 = $request->f_code_fund_4;
            $code_loaction = $request->f_code_loaction;
            $code_object_2 = $request->f_code_object_2;
            $budget_plan_id = $request->budget_plan_id;
            
            $budget_plan = BudgetPlan::where('id',$request->budget_plan_id)->first();
            $b20 = BudgetDevB20::get_list()
            ->where('budget_plan_id',$request->budget_plan_id)
            ->when($code_project_6,function($qry) use($code_project_6){
                $qry->where('budget_dev_b20.code_project_6',$code_project_6);
            })
            ->when($code_program_3,function($qry) use($code_program_3){
                $qry->where('budget_dev_b20.code_program_3',$code_program_3);
            })
            ->when($code_fund_4,function($qry) use($code_fund_4){
                $qry->where('budget_dev_b20.code_fund_4',$code_fund_4);
            })
            ->when($code_loaction,function($qry) use($code_loaction){
                $qry->where('budget_dev_b20.code_province_2',$code_loaction);
            })
            ->when($code_object_2,function($qry) use($code_object_2){
                $qry->where('budget_dev_b20.code_object_2',$code_object_2);
            })->get();
            
          $html2 = view('backend.finance.development_budget.b20.table_body',[
            'b20'=>$b20  
          ])->render();
        
         return response()->json(['result'=>200,'html'=>$html2]);
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
            $html_major_codes = view('backend.finance.development_budget.b20.calculate_major_codes',[
                'budget_approveds'=>$budget_approveds,
                'budget_plan'=>$budget_plan,
            ])->render();
            $html2 = view('backend.finance.development_budget.b20.table_body',['b20'=>$b20])->render();
        
            return response()->json(['result'=>200,'html'=>$html2,'html_major_codes'=>$html_major_codes,'msg'=>'Record deleted successfully!']);
        }else{
            return response()->json(['result'=>403,'msg'=>'Failed to delete record!']);
        }
    }

    public function edit(Request $request){

        $data = BudgetDevB20::get_list()->where('budget_dev_b20.id',$request->id)->first();
        $month = $request->month;
        $month_col = $this->get_month($request->month);

        $b10_coding_block = $this->get_b3_code_amount_result($data->budget_plan_id,$data->code_fund_4,$data->code_province_2,$data->code_object_2,$data->code_program_3,$data->code_project_6);

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
        
        $budget_plan_id = $request->budget_plan_id;
        $code_project_6 = $request->code_project_6;
        $code_program_3 = $request->code_program_3;
        $code_fund_4 = $request->code_fund_4;
        $code_loaction = $request->code_loaction;
        $code_object_2 = $request->code_object_2;

        $budget_plan = BudgetPlan::where('id',$request->budget_plan_id)->first();
        $b20 = BudgetDevB20::get_list()
        ->where('budget_plan_id',$request->budget_plan_id)
        ->when($code_project_6,function($qry) use($code_project_6){
            $qry->where('code_project_6',$code_project_6);
        })
        ->when($code_program_3,function($qry) use($code_program_3){
            $qry->where('code_program_3',$code_program_3);
        })
        ->when($code_fund_4,function($qry) use($code_fund_4){
            $qry->where('code_fund_4',$code_fund_4);
        })
        ->when($code_loaction,function($qry) use($code_loaction){
            $qry->where('code_province_2',$code_loaction);
        })
        ->when($code_object_2,function($qry) use($code_object_2){
            $qry->where('code_object_2',$code_object_2);
        })
        ->get();

        return view('backend.finance.development_budget.b20.print_b20',compact('b20','budget_plan'));
    }

    //modified
    public function get_b3_code_amount(Request $req){
       
        $result = $this->get_b3_code_amount_result($req->budget_plan_id,$req->code_fund_4,$req->code_loaction,$req->code_object_2,$req->code_program_3,$req->code_project_6);

        return response()->json($result);
    }
    
    //modified
    public function get_b3_code_amount_result($budget_plan_id,$code_fund_4,$code_loaction,$code_object_2,$code_program_3,$code_project_6){

        $b10_block_amount = BudgetDevB3::get_list()
        ->where('budget_dev_approveds.budget_plan_id',$budget_plan_id)
        ->where('budget_dev_b3.code_fund_4',$code_fund_4)
        ->where('budget_dev_b3.code_province_2',$code_loaction)
        ->where('budget_dev_b3.code_object_2',$code_object_2)
        ->where('budget_dev_b3.code_program_3',$code_program_3)
        ->where('budget_dev_b3.code_project_6',$code_project_6)
        ->first();

        $b20_block_amount = BudgetDevB20::get_list()->where('budget_plan_id',$budget_plan_id)
        ->where('budget_dev_b20.code_fund_4',$code_fund_4)
        ->where('budget_dev_b20.code_province_2',$code_loaction)
        ->where('budget_dev_b20.code_object_2',$code_object_2)
        ->where('budget_dev_b20.code_program_3',$code_program_3)
        ->where('budget_dev_b20.code_project_6',$code_project_6)
        ->select(DB::raw('(m_1+m_2+m_3+m_4+m_5+m_6+m_7+m_8+m_9+m_10+m_11+m_12) as total'))
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

            $html = '<div class="border" title="B10 Form Coding Block (Org(4), Project Code(5), Program Code(3), Fund Code(4), Province (1))">
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
                'budget_dev_b3_id'=>$b10_block_amount->id,
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


    public function print_get_info(Request $req){
        $budget_plan = BudgetPlan::where('id',$req->budget_plan_id)->first();
        return response()->json($budget_plan);
    }

    public function save_get_info(Request $req){

        BudgetPlan::where('id',$req->budget_plan_id)->update([
            'dev_b3_afmis_reg_no'=>$req->b10_afmis_reg_no,
            'dev_b3_finance_drctr'=>$req->b10_finance_drctr,
            'dev_b3_gnrl_bgt_mgr'=>$req->b10_gnrl_bgt_mgr,
            'dev_b3_gnrl_drctr'=>$req->b10_gnrl_drctr,
            'dev_b20_afmis_no'=>$req->b20_afmis_no,
            'dev_b20_beu_no'=>$req->b20_beu_no,
            'dev_b20_form_no'=>$req->b20_form_no,
            'dev_b20_needs_in_letters'=>$req->b20_needs_in_letters,
            'dev_b20_prescription_gnrl_drctr'=>$req->b20_prescription_gnrl_drctr,
            'dev_b20_sending_date'=>$req->b20_sending_date,
            'dev_b20_sending_no'=>$req->b20_sending_no,
        ]);

        $budget_plan = BudgetPlan::where('id',$req->budget_plan_id)->first();
        
        return response()->json($budget_plan);
    }

    public function finalized($budget_plan_id){

        $exist = BudgetDevB20::get_list()->where('budget_plan_id',$budget_plan_id)->first();
        $is_finalized = false;
        if($exist){
            BudgetDevB20::get_list()->where('budget_plan_id',$budget_plan_id)
            ->update([
                'budget_dev_b20.is_finalized'=>!$exist->is_finalized,
            ]);
            
            session()->flash('success','Status Changed Successfully');

            return redirect()->route('finance.budget.dev.plan.b20.index',$budget_plan_id);
        }else{
            return response()->json([
                'code'=>500,
                'type'=>'error',
                'msg'=>'No any record found.',
            ]);
        }
    }
}

