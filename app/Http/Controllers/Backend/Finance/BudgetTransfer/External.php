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
use App\Models\BudgetPlan;
use App\Models\BudgetApprovedB10Transfer;
use App\Models\BudgetApprovedDistributionB10;
use DB;

class External extends Controller
{
    public function index($budget_plan_id){
        $code_org_3 = CodeOrg::get_code_3()->get(); //get sub-organization code 3
        $code_project_6 = CodeProject::get_list(null,true)->get(); //get project code 6
        $code_program_3 = CodeProgram::get_code_3()->get(); //get program code 3
        $code_fund_4 = CodeFund::get_code_4()->get(); //get fund code 4
        $code_location_2 = CodeLocations::get_code_2()->get(); //get provinces code 4
        $code_objects_2 = CodeObject::get_code_2()->get(); //get Object 2 code 1

        $budget_plan = BudgetPlan::where('id',$budget_plan_id)->first();

        $b10_transfers = BudgetApprovedB10Transfer::get_list()
        ->where('budget_approved_b10_transfers.budget_plan_id',$budget_plan_id)
        ->orderBy('budget_approved_b10_transfers.id','desc')->paginate(10);

        $is_finalized = $this->is_finalized($budget_plan_id);

        return view('backend.finance.budgetTransfer.external',
        compact('budget_plan','code_org_3',
        'code_project_6','code_program_3',
        'code_fund_4','code_location_2',
        'code_objects_2','b10_transfers','is_finalized'));
    }

    public function is_finalized($budget_plan_id){
        $exist = BudgetApprovedB10Transfer::where('budget_approved_b10_transfers.budget_plan_id',$budget_plan_id)
        ->first();

        if($exist){
            return $exist->is_finalized;
        }

        return false;
    }

    public function get_code_amount(Request $req){
        
        $code_total_amount = 0;

        $b10_row = BudgetApprovedDistributionB10::where('budget_plan_id',$req->budget_plan_id)
        ->where('code_loaction',$req->cr_code_loaction)
        ->where('code_fund_4',$req->cr_code_fund_4)
        ->where('code_object_2',$req->cr_code_object_2)
        ->where('code_program_3',$req->cr_code_program_3)
        ->where('code_project_6',$req->cr_code_project_6)
        ->first();

        $total_cr = 0;
        if($b10_row){
            $b10_transfers = BudgetApprovedB10Transfer::get_list()
            ->where('budget_approved_distributions_b10_id',$b10_row->id)
            ->select(DB::raw('sum(cr) as total_cr'))
            ->groupBy('budget_approved_distributions_b10_id')
            ->first();

            if($b10_transfers){
                $total_cr = $b10_transfers->total_cr;
            }

            $code_total_amount = $b10_row->amount;
        }

        return response()->json(['code_total_amount'=>$code_total_amount,'total_cr'=>$total_cr,'remaining_amount'=>($code_total_amount-$total_cr)]);
    }

    public function store(Request $req){
        $b10_row = BudgetApprovedDistributionB10::where('budget_plan_id',$req->budget_plan_id)
        ->where('code_loaction',$req->cr_code_loaction)
        ->where('code_fund_4',$req->cr_code_fund_4)
        ->where('code_object_2',$req->cr_code_object_2)
        ->where('code_program_3',$req->cr_code_program_3)
        ->where('code_project_6',$req->cr_code_project_6)
        ->first();
        if(isset($req->is_dr_to_b10)){

            if($req->is_dr_to_b10=='yes'){
                return response()->json('is_dr_to_b10==Yes');

                $dr = $req->dr_amount;
                $cr = 0;

                $b10_row = BudgetApprovedDistributionB10::where('budget_plan_id',$req->budget_plan_id)
                ->where('code_loaction',$req->dr_code_loaction)
                ->where('code_fund_4',$req->dr_code_fund_4)
                ->where('code_object_2',$req->dr_code_object_2)
                ->where('code_program_3',$req->dr_code_program_3)
                ->where('code_project_6',$req->dr_code_project_6)
                ->first();

                if(!$b10_row){
                return response()->json('!b10_row');
                    
                    $recentInsertedId = BudgetApprovedDistributionB10::insertGetId([
                        'code_fund_4'=>$req->dr_code_fund_4,
                        'code_loaction'=>$req->dr_code_loaction,
                        'code_object_2'=>$req->dr_code_object_2,
                        'code_org_3'=>$req->dr_code_org_3,
                        'code_program_3'=>$req->dr_code_program_3,
                        'code_project_6'=>$req->dr_code_project_6,
                        'amount'=>0,
                        'budget_plan_id'=>$req->budget_plan_id,
                        'user_id'=>auth()->user()->id,
                    ]);

                    $b10_row = BudgetApprovedDistributionB10::where('id',$recentInsertedId)->first();
                }

            }else{
                $dr = 0;
                $cr = $req->dr_amount;
            }
        }

        if($b10_row){
            if(isset($req->is_dr_to_b10)){

                if($req->is_dr_to_b10=='yes'){

                    BudgetApprovedB10Transfer::insert([
                        'budget_approved_distributions_b10_id'=>$b10_row->id,
                        'budget_plan_id'=>$req->budget_plan_id,
                        'code_org_3'=>$req->cr_code_org_3,
                        'code_project_6'=>$req->cr_code_project_6,
                        'code_program_3'=>$req->cr_code_program_3,
                        'code_fund_4'=>$req->cr_code_fund_4,
                        'code_loaction'=>$req->cr_code_loaction,
                        'code_object_2'=>$req->cr_code_object_2,
                        'dr'=>$dr,
                        'cr'=>$cr,
                        'afmis_reg_no'=>$req->afmis_reg_no,
                        'sending_no'=>$req->sending_no,
                        'sending_date'=>$req->sending_date,
                        'needs_in_letters'=>$req->needs_in_letters,
                        'prescription_gnrl_drctr'=>$req->prescription_gnrl_drctr,
                        'user_id'=>auth()->user()->id,
                    ]);
                }else{

                    BudgetApprovedB10Transfer::insert([
                        'budget_approved_distributions_b10_id'=>$b10_row->id,
                        'budget_plan_id'=>$req->budget_plan_id,
                        'code_org_3'=>$req->dr_code_org_3,
                        'code_project_6'=>$req->dr_code_project_6,
                        'code_program_3'=>$req->dr_code_program_3,
                        'code_fund_4'=>$req->dr_code_fund_4,
                        'code_loaction'=>$req->dr_code_loaction,
                        'code_object_2'=>$req->dr_code_object_2,
                        'dr'=>$dr,
                        'cr'=>$cr,
                        'afmis_reg_no'=>$req->afmis_reg_no,
                        'sending_no'=>$req->sending_no,
                        'sending_date'=>$req->sending_date,
                        'needs_in_letters'=>$req->needs_in_letters,
                        'prescription_gnrl_drctr'=>$req->prescription_gnrl_drctr,
                        'user_id'=>auth()->user()->id,
                    ]);
                }
            }

            $b10_transfers = BudgetApprovedB10Transfer::get_list()
            ->where('budget_approved_b10_transfers.budget_plan_id',$req->budget_plan_id)
            ->orderBy('budget_approved_b10_transfers.id','desc')->paginate(10);
            
            $tbl_html = view('backend.finance.budgetTransfer.inc_external_tbl_body',['b10_transfers'=>$b10_transfers])->render();

            return response()->json(['result'=>200,'msg_type'=>'success','msg'=>'Transfered Completlly','tbl_html'=>$tbl_html]);
        }else{
            return response()->json(['result'=>403,'msg_type'=>'error','msg'=>'B10 Record is not found']);
        }
    }

    public function get_form_info(Request $req){
        
        $b10_transfers = BudgetApprovedB10Transfer::get_list()
        ->where('budget_approved_b10_transfers.id',$req->id)->first();

        return response()->json(['result'=>200,'data'=>$b10_transfers]);
    }

    public function save_form_info(Request $req){
        BudgetApprovedB10Transfer::where('id',$req->id)->update([
            'afmis_reg_no'=>$req->afmis_reg_no,
            'needs_in_letters'=>$req->needs_in_letters,
            'prescription_gnrl_drctr'=>$req->prescription_gnrl_drctr,
            'sending_date'=>$req->sending_date,
            'sending_no'=>$req->sending_no,
        ]);
        return response()->json(['result'=>200,'id'=>$req->id]);
    }

    public function print_single_form_info(Request $req){
        $transfer = BudgetApprovedB10Transfer::get_list()->where('budget_approved_b10_transfers.id',$req->id)->first();
        $budget_plan = BudgetPlan::where('id',$transfer->budget_plan_id)->first();

        return view('backend.finance.budgetTransfer.print-single',compact('transfer','budget_plan'));
    }

    public function print_all(Request $req,$budget_plan_id){
        $transfers = BudgetApprovedB10Transfer::get_list()->where('budget_approved_b10_transfers.budget_plan_id',$budget_plan_id)->get();
        $budget_plan = BudgetPlan::where('id',$budget_plan_id)->first();

        return view('backend.finance.budgetTransfer.print-all',compact('transfers','budget_plan'));
    }

    public function finalized(Request $req){

        $exist = BudgetApprovedB10Transfer::where('budget_plan_id',$req->budget_plan_id)->first();
        $is_finalized = false;
        if($exist){
            BudgetApprovedB10Transfer::where('budget_plan_id',$req->budget_plan_id)
            ->update([
                'is_finalized'=>!$exist->is_finalized,
            ]);
            
            if(!$exist->is_finalized){
                $is_finalized = true;
            }
            
            $b10_transfers = BudgetApprovedB10Transfer::get_list()
            ->where('budget_approved_b10_transfers.budget_plan_id',$req->budget_plan_id)
            ->orderBy('budget_approved_b10_transfers.id','desc')->paginate(10);
            
            $html = view('backend.finance.budgetTransfer.inc_external_tbl_body',['b10_transfers'=>$b10_transfers])->render();

            return response()->json([
                'code'=>200,
                'type'=>'success',
                'msg'=>'Operation completed successfully',
                'html'=>$html,
                'is_finalized'=>$is_finalized,
            ]);
        }else{
            return response()->json([
                'code'=>500,
                'type'=>'error',
                'msg'=>'No any record found.',
            ]);
        }
    }
}
