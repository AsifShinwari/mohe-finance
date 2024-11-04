<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BudgetDevCfList extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'budget_dev_cf_lists';
    protected $guarded = [];
}
