<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BudgetDevApproved extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'budget_dev_approveds';
    protected $guarded = [];

    public static function get_list($search=null, $is_used=false,$budget_plan_id=null){
        return BudgetDevApproved::join('mohe_auth_db.users','budget_dev_approveds.user_id','mohe_auth_db.users.id')
        ->join('budget_plans','budget_dev_approveds.budget_plan_id','budget_plans.id')
        ->join('code_donors','budget_dev_approveds.doner_id','code_donors.id')
        ->when($search,function($qry) use($search){
            $qry->orWhere('budget_dev_approveds.code','like','%'. $search.'%')
            ->orWhere('budget_dev_approveds.project_name','like','%'. $search.'%')
            ->orWhere('budget_dev_approveds.year','like','%'. $search.'%')
            ->orWhere('budget_dev_approveds.donor','like','%'. $search.'%');
        })->when($is_used,function($qry) use($is_used){
            $qry->where('is_used',$is_used);
        })->when($budget_plan_id,function($qry) use($budget_plan_id){
            $qry->where('budget_dev_approveds.budget_plan_id',$budget_plan_id);
        })
        ->select('budget_dev_approveds.*','users.name as username','users.pa_name as pa_username',
        'budget_plans.year','code_donors.en_name as donor_en_name','code_donors.pa_name as donor_pa_name','code_donors.da_name as donor_da_name');
    }
}
