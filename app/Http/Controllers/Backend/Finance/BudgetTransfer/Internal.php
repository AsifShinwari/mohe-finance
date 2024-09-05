<?php

namespace App\Http\Controllers\Backend\Finance\BudgetTransfer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CodeOrg;
use App\Models\CodeProject;
use App\Models\CodeProgram;
use App\Models\CodeFund;
use App\Models\CodeLocations;
use App\Models\CodeObject;
use App\Models\CodeCategory;
use App\Models\BudgetPlan;
use App\Models\BudgetApprovedB20Transfer;
use App\Models\BudgetApprovedDistribution;
use DB;

class Internal extends Controller
{
    public function index($budget_plan_id){
        $code_org_5 = CodeOrg::get_code_5()->get(); //get sub-organization code 5
        $code_project_6 = CodeProject::get_list(null,true)->get(); //get project code 6
        $code_program_3 = CodeProgram::get_code_3()->get(); //get program code 3
        $code_fund_4 = CodeFund::get_code_4()->get(); //get fund code 4
        $code_location_2 = CodeLocations::get_code_2()->get(); //get provinces code 4
        $code_objects_2 = CodeObject::get_code_2()->get(); //get Object 2 code 1
        $code_category = CodeCategory::get(); //get Category code 1

        $budget_plan = BudgetPlan::where('id',$budget_plan_id)->first();

        $b20_transfers = BudgetApprovedB20Transfer::get_list()
        ->where('budget_approved_b20_transfers2.budget_plan_id',$budget_plan_id)
        ->orderBy('budget_approved_b20_transfers2.id','desc')->paginate(10);

        return view('backend.finance.budgetTransfer.internal.index',
        compact('budget_plan','code_org_5','code_category',
        'code_project_6','code_program_3',
        'code_fund_4','code_location_2',
        'code_objects_2','b20_transfers'));
    }

    public function get_code_amount(Request $req){
        
        $code_total_amount = 0;
        $month = $req->cr_month;

        $b20_row = BudgetApprovedDistribution::where('budget_plan_id',$req->budget_plan_id)
        ->where('code_org_4',$req->cr_code_org_5)
        ->where('code_loaction',$req->cr_code_loaction)
        ->where('code_fund_4',$req->cr_code_fund_4)
        ->where('code_object_2',$req->cr_code_object_2)
        ->where('code_program_3',$req->cr_code_program_3)
        ->where('code_project_6',$req->cr_code_project_6)
        ->where('code_cate_1',$req->cr_code_cate_1)
        ->first();

        $total_cr = 0;
        if($b20_row){
            $b20_transfers = BudgetApprovedB20Transfer::get_list()
            ->where('budget_approved_b20_row_id',$b20_row->id)
            ->select(DB::raw('sum(cr) as total_cr'))
            ->groupBy('budget_approved_b20_row_id')
            ->first();

            if($b20_transfers){
                $total_cr = $b20_transfers->total_cr;
            }

            $code_total_amount = $b20_row->$month;

        }

        return response()->json(['code_total_amount'=>$code_total_amount,'total_cr'=>$total_cr,'remaining_amount'=>($code_total_amount-$total_cr)]);
    }

    public function store(Request $req){
        // {
        //     "budget_plan_id": "1",
        //     "cr_code_org_5": "12800",
        //     "cr_code_project_6": "00000",
        //     "cr_code_program_3": "282",
        //     "cr_code_fund_4": "2000",
        //     "cr_code_loaction": "1",
        //     "cr_code_cate_1": "0",
        //     "cr_code_object_2": "21",
        //     "cr_month": "m_1",
        //     "cr_amount": "100",
        //     "dr_code_org_5": "12800",
        //     "dr_code_project_6": "00000",
        //     "dr_code_program_3": "281",
        //     "dr_code_fund_4": "2000",
        //     "dr_code_loaction": "1",
        //     "dr_code_cate_1": "0",
        //     "dr_code_object_2": "21",
        //     "dr_month": "m_2",
        //     "dr_amount": "10",
        //     "afmis_reg_no": null,
        //     "sending_no": null,
        //     "sending_date": null,
        //     "needs_in_letters": null,
        //     "prescription_gnrl_drctr": null
        // }
      
        $b20_row = BudgetApprovedDistribution::where('budget_plan_id',$req->budget_plan_id)
        ->where('code_loaction',$req->cr_code_loaction)
        ->where('code_fund_4',$req->cr_code_fund_4)
        ->where('code_object_2',$req->cr_code_object_2)
        ->where('code_program_3',$req->cr_code_program_3)
        ->where('code_project_6',$req->cr_code_project_6)
        ->where('code_cate_1',$req->cr_code_cate_1)
        ->where('code_org_4',$req->cr_code_org_5)
        ->first();

       
        if($b20_row){
            BudgetApprovedB20Transfer::insert([
                'budget_approved_b20_row_id'=>$b20_row->id,
                'budget_plan_id'=>$req->budget_plan_id,
                'code_org_4'=>$req->dr_code_org_5,
                'code_cate_1'=>$req->dr_code_cate_1,
                'code_project_6'=>$req->dr_code_project_6,
                'code_program_3'=>$req->dr_code_program_3,
                'code_fund_4'=>$req->dr_code_fund_4,
                'code_loaction'=>$req->dr_code_loaction,
                'code_object_2'=>$req->dr_code_object_2,
                'from_month'=>$req->cr_month,
                'to_month'=>$req->dr_month,
                'cr'=>0,
                'dr'=>$req->dr_amount,
                'afmis_reg_no'=>$req->afmis_reg_no,
                'sending_no'=>$req->sending_no,
                'sending_date'=>$req->sending_date,
                'needs_in_letters'=>$req->needs_in_letters,
                'prescription_gnrl_drctr'=>$req->prescription_gnrl_drctr,
                'user_id'=>auth()->user()->id,
            ]);

            $b20_transfers = BudgetApprovedB20Transfer::get_list()
            ->where('budget_approved_b20_transfers2.budget_plan_id',$req->budget_plan_id)
            ->orderBy('budget_approved_b20_transfers2.id','desc')->paginate(10);
            
            $tbl_html = view('backend.finance.budgetTransfer.internal.inc_tbl_body',['b20_transfers'=>$b20_transfers])->render();

            return response()->json(['result'=>200,'msg_type'=>'success','msg'=>'Transfered Completlly','tbl_html'=>$tbl_html]);
        }else{
            return response()->json(['result'=>403,'msg_type'=>'error','msg'=>'B20 Record is not found']);
        }
    }

    public function delete($id){
        $bat = BudgetApprovedB20Transfer::where('id',$id)->first();
        if($bat){
            BudgetApprovedB20Transfer::where('id',$id)->delete(); 
            session()->flash('success', 'Deleted Successfully!');  
            return redirect()->back();
        }else{
            session()->flash('error', 'Record is not exist!');
            return redirect()->back();
        }
    }

    public function get_form_info(Request $req){
        
        $b20_transfers = BudgetApprovedB20Transfer::get_list()
        ->where('budget_approved_b20_transfers2.id',$req->id)->first();

        return response()->json(['result'=>200,'data'=>$b20_transfers]);
    }

    public function save_form_info(Request $req){
        BudgetApprovedB20Transfer::where('id',$req->id)->update([
            'afmis_reg_no'=>$req->afmis_reg_no,
            'needs_in_letters'=>$req->needs_in_letters,
            'prescription_gnrl_drctr'=>$req->prescription_gnrl_drctr,
            'sending_date'=>$req->sending_date,
            'sending_no'=>$req->sending_no,
        ]);
        return response()->json(['result'=>200,'id'=>$req->id]);
    }

    public function print_single_form_info(Request $req){
        $transfer = BudgetApprovedB20Transfer::get_list()->where('budget_approved_b20_transfers2.id',$req->id)->first();
        $budget_plan = BudgetPlan::where('id',$transfer->budget_plan_id)->first();

        return view('backend.finance.budgetTransfer.internal.print-single',compact('transfer','budget_plan'));
    }

    public function print_all(Request $req,$budget_plan_id){
        $transfers = BudgetApprovedB20Transfer::get_list()->where('budget_approved_b20_transfers2.budget_plan_id',$budget_plan_id)->get();
        $budget_plan = BudgetPlan::where('id',$budget_plan_id)->first();

        return view('backend.finance.budgetTransfer.internal.print-all',compact('transfers','budget_plan'));
    }
}
