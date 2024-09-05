<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BudgetApprovedB10Transfer extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'budget_approved_b10_transfers';
    protected $guarded = [];

    public static function get_list($search=null, $is_deleted=false){
        return BudgetApprovedB10Transfer::join('mohe_auth_db.users','budget_approved_b10_transfers.user_id','mohe_auth_db.users.id')
        ->join('budget_approved_distributions_b10','budget_approved_b10_transfers.budget_approved_distributions_b10_id','budget_approved_distributions_b10.id')
        
        // ->when($search,function($qry) use($search){
        //     $qry->orWhere('budget_approveds.year','like','%'.$search.'%');
        // })

        ->select('budget_approved_b10_transfers.*','users.name as username','users.pa_name as pa_username',
        'budget_approved_distributions_b10.code_org_3 as b10_code_org_3',
        'budget_approved_distributions_b10.code_project_6 as b10_code_project_6',
        'budget_approved_distributions_b10.code_program_3 as b10_code_program_3',
        'budget_approved_distributions_b10.code_fund_4 as b10_code_fund_4',
        'budget_approved_distributions_b10.code_loaction as b10_code_loaction',
        'budget_approved_distributions_b10.code_object_2 as b10_code_object_2',
        'budget_approved_distributions_b10.amount as b10_amount');
    }
}
