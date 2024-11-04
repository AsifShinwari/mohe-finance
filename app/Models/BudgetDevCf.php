<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BudgetDevCf extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'budget_dev_cfs';
    protected $guarded = [];

    public static function get_list(){
        return BudgetDevCf::join('mohe_auth_db.users','budget_dev_cfs.user_id','mohe_auth_db.users.id')
        ->select('budget_dev_cfs.*',
        'users.name as username',
        'users.pa_name as pa_username');
    }
}
