<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BudgetDevTransferB20 extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'budget_dev_transfers_b20';
    protected $guarded = [];

    public static function get_list($search=null, $is_deleted=false){
        return BudgetDevTransferB20::join('mohe_auth_db.users','budget_dev_transfers_b20.user_id','mohe_auth_db.users.id')
        ->join('budget_dev_b20','budget_dev_transfers_b20.budget_dev_b20_id','budget_dev_b20.id')
        ->join('budget_dev_b3','budget_dev_b20.budget_dev_b3_id','budget_dev_b3.id')
        ->join('budget_dev_approveds','budget_dev_b3.budget_dev_approveds_id','budget_dev_approveds.id')
        ->select('budget_dev_transfers_b20.*','users.name as username','users.pa_name as pa_username',
        'budget_dev_b20.code_org_5 as b20_code_org_4',
        'budget_dev_b20.code_project_6 as b20_code_project_6',
        'budget_dev_b20.code_program_3 as b20_code_program_3',
        'budget_dev_b20.code_fund_4 as b20_code_fund_4',
        'budget_dev_b20.code_province_2 as b20_code_loaction',
        'budget_dev_b20.code_object_2 as b20_code_object_2',
        'budget_dev_b20.code_cate_1 as b20_code_cate_1',
        'budget_dev_b20.m_1 as b20_m_1',
        'budget_dev_b20.m_2 as b20_m_2',
        'budget_dev_b20.m_3 as b20_m_3',
        'budget_dev_b20.m_4 as b20_m_4',
        'budget_dev_b20.m_5 as b20_m_5',
        'budget_dev_b20.m_6 as b20_m_6',
        'budget_dev_b20.m_7 as b20_m_7',
        'budget_dev_b20.m_8 as b20_m_8',
        'budget_dev_b20.m_9 as b20_m_9',
        'budget_dev_b20.m_10 as b20_m_10',
        'budget_dev_b20.m_11 as b20_m_11',
        'budget_dev_b20.m_12 as b20_m_12');
    }
}
