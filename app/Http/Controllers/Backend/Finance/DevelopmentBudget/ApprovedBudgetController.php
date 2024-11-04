<?php

namespace App\Http\Controllers\Backend\Finance\DevelopmentBudget;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BudgetDevApproved;
use App\Models\BudgetPlan;
use App\Models\CodeDonor;
use App\Models\CodeProject;

class ApprovedBudgetController extends Controller
{
    public function index(Request $req, $plan_id){

        $budget_plan = BudgetPlan::where('id',$plan_id)->first();

        //search is null, user_id is false the last is budget_plan_id
        $data = BudgetDevApproved::get_list(null,false,$plan_id)->paginate(10); 

        $is_finalized = $this->is_finalized($plan_id);

        return view('backend.finance.development_budget.approved_budget.index',compact('budget_plan','data','plan_id','is_finalized'));
    }

    public function is_finalized($budget_plan_id){
        $exist = BudgetDevApproved::where('budget_plan_id',$budget_plan_id)
        ->first();

        if($exist){
            return $exist->is_finalized;
        }

        return false;
    }

    public function create($budget_plan_id){
        
        $code_donors = CodeDonor::get();
        $budget_plan = BudgetPlan::where('id',$budget_plan_id)->first();
        $code_project_6 = CodeProject::get_list(null,true)->get(); //get project code 6 // reload only development

        return view('backend.finance.development_budget.approved_budget.add.create',compact('code_donors','budget_plan','code_project_6'));
    }

    public function store(Request $req){
        if($req->ajax()){
            $validated_data = $req->validate([
                'budget_amount' =>'required',
                'employees_count' =>'required',
                'is_intentional' =>'required',
                'doner_id' =>'required',
                'year' =>'required',
                'project_name' =>'required',
                'code' =>'required',
                'budget_plan_id' =>'required'
            ]);
            
            $validated_data['user_id'] = auth()->user()->id;

            $is_saved = BudgetDevApproved::create($validated_data);

            if($is_saved){
                return response()->json([
                    'result'=>200
                ]);
            }else{
                return response()->json([
                    'result'=>500,
                   'msg'=>'Failed to save data.'
                ]);
            }
        }else{
            return response()->json([
                'result'=>403,
               'msg'=>'Invalid request.'
            ]);
        }
    }

    public function delete(Request $req){
        if($req->ajax()){
            $is_deleted = BudgetDevApproved::where('id',$req->id)->delete();

            if($is_deleted){
                return response()->json([
                   'result'=>200
                ]);
            }else{
                return response()->json([
                   'result'=>500,
                   'msg'=>'Failed to delete data.'
                ]);
            }
        }else{
            return response()->json([
                'result'=>403,
               'msg'=>'Invalid request.'
            ]);
        }
    }

    public function print(Request $req,$plan_id){

        $data = BudgetDevApproved::get_list(null,false,$plan_id)->get();
        $budget_plan = BudgetPlan::where('id',$plan_id)->first();

        return view('backend.finance.development_budget.approved_budget.print.print',compact('data','budget_plan'));
    }
 
    public function finalized(Request $req){

        $exist = BudgetDevApproved::where('budget_plan_id',$req->budget_plan_id)->first();
        $is_finalized = false;
        if($exist){
            BudgetDevApproved::where('budget_plan_id',$req->budget_plan_id)
            ->update([
                'is_finalized'=>!$exist->is_finalized,
            ]);
            
            if(!$exist->is_finalized){
                $is_finalized = true;
            }
            
            $data = BudgetDevApproved::get_list(null,false,$req->budget_plan_id)->paginate(10);
            
            $html = view('backend.finance.development_budget.approved_budget.inc_tbl_body',['data'=>$data])->render();

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
