<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BudgetDevPromise extends Model
{ 
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'budget_dev_promises';
    protected $guarded = [];

    public static function get_list($search=null, $is_used=false){
        return BudgetDevPromise::join('mohe_auth_db.users','budget_dev_promises.user_id','mohe_auth_db.users.id')
        ->join('budget_plans','budget_dev_promises.budget_plan_id','budget_plans.id')
        ->join('mohe_auth_db.departements','budget_dev_promises.department_id','mohe_auth_db.departements.id')
        ->when($search,function($qry) use($search){
            $qry->orWhere('budget_dev_promises.details','like','%'. $search.'%')
            ->orWhere('budget_dev_promises.sadira_no','like','%'. $search.'%')
            ->orWhere('budget_dev_promises.maktoob_date','like','%'. $search.'%')
            ->orWhere('budget_dev_promises.object_code_5','like','%'. $search.'%')
            ->orWhere('departements.en_name','like','%'. $search.'%')
            ->orWhere('departements.pa_name','like','%'. $search.'%')
            ->orWhere('departements.da_name','like','%'. $search.'%');
        })->when($is_used,function($qry) use($is_used){
            $qry->where('is_used',$is_used);
        })
        ->select('budget_dev_promises.*','users.name as username','users.pa_name as pa_username',
        'departements.name as dept_en_name','departements.pa_name as dept_pa_name','departements.da_name as dept_da_name',
        'budget_plans.year');
    }
}
