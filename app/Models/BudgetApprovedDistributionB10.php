<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BudgetApprovedDistributionB10 extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'budget_approved_distributions_b10';
    protected $guarded = [];

    public static function get_b10_form(){
        return BudgetApprovedDistributionB10::join('code_locations','code_loaction','code_locations.prov_code')
        ->select('budget_approved_distributions_b10.*',
        'code_locations.en_desc as en_prov_name',
        'code_locations.pa_desc as pa_prov_name',
        'code_locations.da_desc as da_prov_name')
        ->orderBy('code_loaction','asc')
        ->groupBy('code_org_3','code_project_6','code_program_3','code_fund_4','code_loaction');
    }
}
