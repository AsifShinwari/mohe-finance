<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BudgetApprovedB20Transfer extends Model
{
    use HasFactory; 
    protected $connection = 'finance';
    protected $table = 'budget_approved_b20_transfers2';
    protected $guarded = [];

    public static function get_list($search=null, $is_deleted=false){
        return BudgetApprovedB20Transfer::join('mohe_auth_db.users','budget_approved_b20_transfers2.user_id','mohe_auth_db.users.id')
        ->join('budget_approved_distributions','budget_approved_b20_transfers2.budget_approved_b20_row_id','budget_approved_distributions.id')
        ->select('budget_approved_b20_transfers2.*','users.name as username','users.pa_name as pa_username',
        'budget_approved_distributions.code_org_4 as b20_code_org_4',
        'budget_approved_distributions.code_project_6 as b20_code_project_6',
        'budget_approved_distributions.code_program_3 as b20_code_program_3',
        'budget_approved_distributions.code_fund_4 as b20_code_fund_4',
        'budget_approved_distributions.code_loaction as b20_code_loaction',
        'budget_approved_distributions.code_object_2 as b20_code_object_2',
        'budget_approved_distributions.code_cate_1 as b20_code_cate_1',
        'budget_approved_distributions.m_1 as b20_m_1',
        'budget_approved_distributions.m_2 as b20_m_2',
        'budget_approved_distributions.m_3 as b20_m_3',
        'budget_approved_distributions.m_4 as b20_m_4',
        'budget_approved_distributions.m_5 as b20_m_5',
        'budget_approved_distributions.m_6 as b20_m_6',
        'budget_approved_distributions.m_7 as b20_m_7',
        'budget_approved_distributions.m_8 as b20_m_8',
        'budget_approved_distributions.m_9 as b20_m_9',
        'budget_approved_distributions.m_10 as b20_m_10',
        'budget_approved_distributions.m_11 as b20_m_11',
        'budget_approved_distributions.m_12 as b20_m_12');
    }
}
