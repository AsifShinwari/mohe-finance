<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BudgetDevB20 extends Model
{
    use HasFactory; 
    protected $connection = 'finance';
    protected $table = 'budget_dev_b20';
    protected $guarded = [];

    public static function get_list(){
        return BudgetDevB20::join('mohe_auth_db.users','budget_dev_b20.user_id','mohe_auth_db.users.id')
        ->join('budget_dev_b3','budget_dev_b20.budget_dev_b3_id','budget_dev_b3.id')
        ->join('budget_dev_approveds','budget_dev_b3.budget_dev_approveds_id','budget_dev_approveds.id')
        ->join('code_locations','budget_dev_b20.code_province_2','code_locations.prov_code')
        ->groupBy('budget_dev_b20.id')
        ->orderBy('budget_dev_b20.code_province_2','asc')
        ->select('budget_dev_b20.*',
        'budget_dev_approveds.budget_plan_id',
        'users.name as username',
        'users.pa_name as pa_username',
        'code_locations.en_desc as en_prov_name',
        'code_locations.pa_desc as pa_prov_name',
        'code_locations.da_desc as da_prov_name');
    }
}
