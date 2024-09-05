<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BudgetApproved extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'budget_approveds';
    protected $guarded = [];
    
    public static function get_list($search=null, $is_deleted=false){
        return BudgetPlan;
        // ::join('mohe_auth_db.users','budget_approveds.user_id','mohe_auth_db.users.id')
        // ->when($search,function($qry) use($search){
        //     $qry->orWhere('budget_approveds.year','like','%'.$search.'%');
        // })
        // ->where('budget_approveds.is_deleted',$is_deleted)
        // ->select('budget_approveds.*','users.name as username','users.pa_name as pa_username');
    }
}
 