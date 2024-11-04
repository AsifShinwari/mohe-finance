<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CodeDonor extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'code_donors';
    protected $guarded = [];
    
    public static function get_list($search=null, $is_used=false){
        return CodeDonor::join('mohe_auth_db.users','code_donors.user_id','mohe_auth_db.users.id')
        ->when($search,function($qry) use($search){
            $qry->orWhere('departements.en_name','like','%'. $search.'%')
            ->orWhere('departements.pa_name','like','%'. $search.'%')
            ->orWhere('departements.da_name','like','%'. $search.'%');
        })->when($is_used,function($qry) use($is_used){
            $qry->where('is_used',$is_used);
        })
        ->select('code_donors.*','users.name as username','users.pa_name as pa_username');
    }
}
