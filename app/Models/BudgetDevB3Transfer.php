<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BudgetDevB3Transfer extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'budget_dev_b3_transfers';
    protected $guarded = [];

    public static function get_list($search=null, $is_deleted=false){
        return BudgetDevB3Transfer::join('mohe_auth_db.users','budget_dev_b3_transfers.user_id','mohe_auth_db.users.id')
        ->leftJoin('budget_dev_b3','budget_dev_b3_transfers.budget_dev_b3_id','budget_dev_b3.id')
        ->leftJoin('budget_dev_approveds','budget_dev_b3.budget_dev_approveds_id','budget_dev_approveds.id')
        ->select('budget_dev_b3_transfers.*','users.name as username','users.pa_name as pa_username',
        'budget_dev_b3.code_org_3 as b10_code_org_3',
        'budget_dev_b3.code_project_6 as b10_code_project_6',
        'budget_dev_b3.code_program_3 as b10_code_program_3',
        'budget_dev_b3.code_fund_4 as b10_code_fund_4',
        'budget_dev_b3.code_province_2 as b10_code_loaction',
        'budget_dev_b3.code_object_2 as b10_code_object_2',
        'budget_dev_b3.amount as b10_amount');
    }
}
