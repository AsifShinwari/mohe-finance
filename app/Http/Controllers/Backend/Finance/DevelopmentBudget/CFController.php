<?php

namespace App\Http\Controllers\Backend\Finance\DevelopmentBudget;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BudgetDevCf;
use App\Models\BudgetDevCfList;
use App\Models\BudgetPlan;
use App\Models\Departement;
use App\Models\CodeOrg;
use App\Models\CodeProject;
use App\Models\CodeProgram;
use App\Models\CodeFund;
use App\Models\CodeLocations;
use App\Models\CodeCategory;
use App\Models\CodeObject;
use DB;

class CFController extends Controller
{
    public function index($budget_plan_id,$cf_list_id){
        
        $budget_plan = BudgetPlan::where('id',$budget_plan_id)->first();
        $cf_list = BudgetDevCfList::where('id',$cf_list_id)->first();

        $cfs = BudgetDevCf::get_list()
        ->where('budget_dev_cf_list_id',$cf_list_id)
        ->where('budget_plan_id',$budget_plan_id)
        ->paginate(10);

        $is_finalized = $this->is_finalized($budget_plan_id);

        return view('backend.finance.development_budget.cf.index',compact('budget_plan','cfs','cf_list','is_finalized'));
    }

    public function is_finalized($budget_plan_id){
        $exist = BudgetDevCf::where('budget_plan_id',$budget_plan_id)
        ->first();

        if($exist){
            return $exist->is_finalized;
        }

        return false;
    }

    public function create($budget_plan_id,$cf_list_id){
        $cf_list = BudgetDevCfList::where('id',$cf_list_id)->first();
        $budget_plan = BudgetPlan::where('id',$budget_plan_id)->first();

        $code_org_5 = CodeOrg::get_code_5()->get(); //get sub-organization code 5
        $code_project_6 = CodeProject::get_list(null,true)->get(); //get project code 6
        $code_program_5 = CodeProgram::get_code_5()->get(); //get program code 3
        $code_fund_4 = CodeFund::get_code_4()->get(); //get fund code 4
        $code_location_4 = CodeLocations::get_code_4()->get(); //get provinces code 4
        $code_cate_1 = CodeCategory::get(); //get Category code 1
        $code_objects_2 = CodeObject::get_code_2()->get(); //get Object 2 code 1

        return view('backend.finance.development_budget.cf.create',compact('budget_plan',
        'code_org_5','code_project_6','code_program_5','code_fund_4','code_location_4','code_cate_1','code_objects_2','cf_list'));
    }


    public function store(Request $req){
        try {
            
            $exist = BudgetDevCf::where('budget_plan_id',$req->budget_plan_id)
            ->where('budget_dev_cf_list_id',$req->budget_dev_cf_list_id)
            ->where('code_cate_1',$req->code_cate_1)
            ->where('code_fund_4',$req->code_fund_4)
            ->where('code_location_4',$req->code_location_4)
            ->where('code_object_2',$req->code_object_2)
            ->where('code_org_5',$req->code_org_5)
            ->where('code_program_5',$req->code_program_5)
            ->where('code_project_6',$req->code_project_6)
            ->first();

            if(!$exist){
                BudgetDevCf::insert([
                    "afmis_reg_no" => $req->afmis_reg_no,
                    "budget_plan_id" => $req->budget_plan_id,
                    "budget_dev_cf_list_id" => $req->budget_dev_cf_list_id,
                    "code_cate_1" => $req->code_cate_1,
                    "code_fund_4" => $req->code_fund_4,
                    "code_location_4" => $req->code_location_4,
                    "code_object_2" => $req->code_object_2,
                    "code_org_5" => $req->code_org_5,
                    "code_program_5" => $req->code_program_5,
                    "code_project_6" => $req->code_project_6,
                    "m_1" => $req->m_1,
                    "m_2" => $req->m_2,
                    "m_3" => $req->m_3,
                    "m_4" => $req->m_4,
                    "m_5" => $req->m_5,
                    "m_6" => $req->m_6,
                    "m_7" => $req->m_7,
                    "m_8" => $req->m_8,
                    "m_9" => $req->m_9,
                    "m_10" => $req->m_10,
                    "m_11" => $req->m_11,
                    "m_12" => $req->m_12,
                    "user_id" => auth()->user()->id,
                ]);

                return response()->json(['result'=>200]);
            }else{
                return response()->json(['result'=>500,'msg'=>'Record for same coding block already exists']);
            }

        } catch (\Throwable $th) {
            return response()->json(['result'=>500,'msg'=>$th->getMessage()]);
        }

    }
    

    public function delete(Request $req){
        try {
            BudgetDevCf::where('id',$req->id)->delete();
            return response()->json(['result'=>200]);
        } catch (\Throwable $th) {
            return response()->json(['result'=>200,'msg'=>$th->getMessage()]);
        }
    }

    public function print($budget_plan_id,$cf_list_id){
        
        $budget_plan = BudgetPlan::where('id',$budget_plan_id)->first();
        $cf_list = BudgetDevCfList::where('id',$cf_list_id)->first();
        $cfs = BudgetDevCf::get_list()
        ->where('budget_plan_id',$budget_plan_id)
        ->where('budget_dev_cf_list_id',$cf_list_id)
        ->get();

        return view('backend.finance.development_budget.cf.print',compact('budget_plan','cfs','cf_list'));
    }

    public function edit($cf_id){
    
        $cf = BudgetDevCf::where('id',$cf_id)->first();
        $cf_list = BudgetDevCfList::where('id',$cf->budget_dev_cf_list_id)->first();

        $budget_plan = BudgetPlan::where('id',$cf->budget_plan_id)->first();

        $code_org_5 = CodeOrg::get_code_5()->get(); //get sub-organization code 5
        $code_project_6 = CodeProject::get_list(null,true)->get(); //get project code 6
        $code_program_5 = CodeProgram::get_code_5()->get(); //get program code 3
        $code_fund_4 = CodeFund::get_code_4()->get(); //get fund code 4
        $code_location_4 = CodeLocations::get_code_4()->get(); //get provinces code 4
        $code_cate_1 = CodeCategory::get(); //get Category code 1
        $code_objects_2 = CodeObject::get_code_2()->get(); //get Object 2 code 1

        return view('backend.finance.development_budget.cf.edit',
        compact('cf','budget_plan','code_org_5','code_project_6','code_program_5','code_fund_4','code_location_4','code_cate_1','code_objects_2','cf_list'));
    }

    public function update(Request $req,$cf_id){
        try {
            
            $exist = BudgetDevCf::where('id',$cf_id)->first();
            
            if($exist){

                    $exist->afmis_reg_no = $req->afmis_reg_no;
                    $exist->budget_plan_id = $req->budget_plan_id;
                    $exist->code_cate_1 = $req->code_cate_1;
                    $exist->code_fund_4 = $req->code_fund_4;
                    $exist->code_location_4 = $req->code_location_4;
                    $exist->code_object_2 = $req->code_object_2;
                    $exist->code_org_5 = $req->code_org_5;
                    $exist->code_program_5 = $req->code_program_5;
                    $exist->code_project_6 = $req->code_project_6;
                    $exist->m_1 = $req->m_1;
                    $exist->m_2 = $req->m_2;
                    $exist->m_3 = $req->m_3;
                    $exist->m_4 = $req->m_4;
                    $exist->m_5 = $req->m_5;
                    $exist->m_6 = $req->m_6;
                    $exist->m_7 = $req->m_7;
                    $exist->m_8 = $req->m_8;
                    $exist->m_9 = $req->m_9;
                    $exist->m_10 = $req->m_10;
                    $exist->m_11 = $req->m_11;
                    $exist->m_12 = $req->m_12;
                    $exist->user_id = auth()->user()->id;
                    $exist->save();

                return response()->json(['result'=>200]);
            }else{
                return response()->json(['result'=>500,'msg'=>'Invalid request']);
            }

        } catch (\Throwable $th) {
            return response()->json(['result'=>500,'msg'=>$th->getMessage()]);
        }

    }

    public function finalized($budget_plan_id){

        $exist = BudgetDevCf::where('budget_plan_id',$budget_plan_id)->first();
        $is_finalized = false;
        if($exist){
            BudgetDevCf::where('budget_plan_id',$budget_plan_id)
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
