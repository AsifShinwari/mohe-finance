<?php

namespace App\Http\Controllers\Backend\Finance\DevelopmentBudget;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BudgetDevPromise;
use App\Models\BudgetPlan;
use App\Models\Departement;
use App\Models\CodeObject;
use DB; 

class DevBudgetPromiseController extends Controller
{
    public function index($budget_plan_id){
        
        $budget_plan = BudgetPlan::where('id',$budget_plan_id)->first();
        $budget_plan_promises = BudgetDevPromise::get_list()->where('budget_plan_id',$budget_plan_id)->paginate(10);
        $is_finalized = $this->is_finalized($budget_plan_id);

        return view('backend.finance.development_budget.budget_promises.index',compact('budget_plan','budget_plan_promises','is_finalized'));
    }

    public function is_finalized($budget_plan_id){
        $exist = BudgetDevPromise::where('budget_plan_id',$budget_plan_id)
        ->first();

        if($exist){
            return $exist->is_finalized;
        }

        return false;
    }

    public function create($budget_plan_id){

        $budget_plan = BudgetPlan::where('id',$budget_plan_id)->first();
        $deps = Departement::where('level',3)->get();
        $code_objects_2 = CodeObject::get_code_2()->get();

        return view('backend.finance.development_budget.budget_promises.create',compact('budget_plan','deps','code_objects_2'));
    }

    public function get_object_code_3(Request $req){
        
        $code_object_2 = $req->code_object_2;

        $code_objects_3 = CodeObject::get_code_3()->where('major_code',$code_object_2)->get();
        return response()->json($code_objects_3);
    }

    public function get_object_code_5(Request $req){

        $code_object_3 = $req->code_object_3;

        $code_objects_5 = CodeObject::get_code_5()->where('minor_code',$code_object_3)->get();
        return response()->json($code_objects_5);
    }

    public function store(Request $req){

        try {
           
            BudgetDevPromise::insert([
                "budget_plan_id"=>$req->budget_plan_id,
                "department_id"=>$req->department_id,
                "details" => $req->details,
                "sadira_no" => $req->sadira_no,
                "maktoob_date" => $req->maktoob_date,
                "object_code_5" => $req->code_objects_5_id,
                "promise_amount" => $req->promise_amount,
                "paid_amount" => $req->paid_amount,
                "is_done" => $req->department_id,
                "user_id" => auth()->user()->id,
            ]);
            
            return response()->json(['result'=>200]);

        } catch (\Throwable $th) {
            return response()->json(['result'=>500,'msg'=>$th->getMessage()]);
        }

    }

    public function delete(Request $req){
        try {
            BudgetDevPromise::where('id',$req->id)->delete();
            return response()->json(['result'=>200]);
        } catch (\Throwable $th) {
            return response()->json(['result'=>200,'msg'=>$th->getMessage()]);
        }
    }

    public function print($budget_plan_id){
        
        $budget_plan = BudgetPlan::where('id',$budget_plan_id)->first();
        $budget_plan_promises = BudgetDevPromise::get_list()->where('budget_plan_id',$budget_plan_id)->get();

        return view('backend.finance.development_budget.budget_promises.print',compact('budget_plan','budget_plan_promises'));
    }

    public function edit($promise_id){
    
        $budget_plan_promise = BudgetDevPromise::get_list()->where('budget_dev_promises.id',$promise_id)->first();

        $budget_plan = BudgetPlan::where('id',$budget_plan_promise->budget_plan_id)->first();

        $deps = Departement::where('level',3)->get();
        $code_objects_2 = CodeObject::get_code_2()->get();
        
        $code_objects_3 = CodeObject::get_code_3()->where('major_code',substr($budget_plan_promise->object_code_5,0,2))->get();
        $code_objects_5 = CodeObject::get_code_5()->where('minor_code',substr($budget_plan_promise->object_code_5,0,3))->get();

        return view('backend.finance.development_budget.budget_promises.edit',
        compact('budget_plan','budget_plan_promise','deps','code_objects_2','code_objects_3','code_objects_5'));
    }

    public function finalized($budget_plan_id){

        $exist = BudgetDevPromise::where('budget_plan_id',$budget_plan_id)->first();
        $is_finalized = false;
        if($exist){
            BudgetDevPromise::where('budget_plan_id',$budget_plan_id)
            ->update([
                'is_finalized'=>!$exist->is_finalized,
            ]);
            
            session()->flash('success','Status Changed Successfully');

            return redirect()->back();
        }else{
            session()->flash('error','Status is not Changed');
            return redirect()->back();
        }
    }
}
