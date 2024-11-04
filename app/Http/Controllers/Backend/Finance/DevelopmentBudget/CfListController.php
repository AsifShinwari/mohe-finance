<?php

namespace App\Http\Controllers\Backend\Finance\DevelopmentBudget;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BudgetDevCfList;
use App\Models\BudgetPlan;

class CfListController extends Controller
{
    public function index($budget_plan_id){
        
        $budget_plan = BudgetPlan::where('id',$budget_plan_id)->first();
        $cfs = BudgetDevCfList::where('budget_plan_id',$budget_plan_id)->paginate(10);
        $is_finalized = $this->is_finalized($budget_plan_id);

        return view('backend.finance.development_budget.cf_list.index',compact('budget_plan','cfs','is_finalized'));
    }

    public function is_finalized($budget_plan_id){
        $exist = BudgetDevCfList::where('budget_plan_id',$budget_plan_id)
        ->first();

        if($exist){
            return $exist->is_finalized;
        }

        return false;
    }
    public function create($budget_plan_id){
        $budget_plan = BudgetPlan::where('id',$budget_plan_id)->first();
        return view('backend.finance.development_budget.cf_list.create',compact('budget_plan'));
    }

    public function store(Request $request){

        $request->validate([
            'date' =>'required',
            'cf_name' =>'required'
        ]);

        $cf =new BudgetDevCfList();
        $cf->budget_plan_id = $request->budget_plan_id;
        $cf->date = $request->date;
        $cf->sending_no = $request->sending_no;
        $cf->payment_location = $request->payment_location;
        $cf->location_name = $request->location_name;
        $cf->currency = $request->currency;
        $cf->afmis_no = $request->afmis_no;
        $cf->description = $request->description;
        $cf->prepared_by = $request->prepared_by;
        $cf->approved_by = $request->approved_by;
        $cf->cf_name = $request->cf_name;
        $cf->user_id = auth()->user()->id;
        $cf->save();

        return redirect()->route('finance.budget.dev.plan.cf.list.create',$request->budget_plan_id)->with('success','CF created successfully');
    }

    public function finalized($budget_plan_id){

        $exist = BudgetDevCfList::where('budget_plan_id',$budget_plan_id)->first();

        $is_finalized = false;
        if($exist){
            BudgetDevCfList::where('budget_plan_id',$budget_plan_id)
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
