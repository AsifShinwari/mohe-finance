<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BudgetApprovedDistribution extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'budget_approved_distributions';
    protected $guarded = [];
    
    public static function get_list($search=null, $is_deleted=false){
        // return BudgetPlan::join('mohe_auth_db.users','budget_plans.user_id','mohe_auth_db.users.id')
        // ->when($search,function($qry) use($search){
        //     $qry->orWhere('budget_plans.year','like','%'.$search.'%');
        // })
        // ->where('budget_plans.is_deleted',$is_deleted)
        // ->select('budget_plans.*','users.name as username','users.pa_name as pa_username');
    }
    
}
