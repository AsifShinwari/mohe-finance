<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Measurement extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'measurements';
    protected $guarded = [];
    
    public static function get_list($search=null, $is_used=false){
        return Measurement::join('mohe_auth_db.users','measurements.user_id','mohe_auth_db.users.id')
        ->when($search,function($qry) use($search){
            $qry->orWhere('en_name','like','%'. $search.'%')
            ->orWhere('pa_name','like','%'. $search.'%')
            ->orWhere('da_name','like','%'. $search.'%');
        })->when($is_used,function($qry) use($is_used){
            $qry->where('is_used',$is_used);
        })
        ->select('measurements.*','users.name as username','users.pa_name as pa_username');
    }
}
