<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CodeLocations extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'code_locations';
    protected $guarded = [];
    
    public static function get_list($search=null, $is_used=false){
        return CodeLocations::join('mohe_auth_db.users','code_locations.user_id','mohe_auth_db.users.id')
        ->when($search,function($qry) use($search){
            $qry->orWhere('prov_code','like','%'. $search.'%')
            ->orWhere('dist_code','like','%'. $search.'%')
            ->orWhere('en_desc','like','%'. $search.'%')
            ->orWhere('pa_desc','like','%'. $search.'%')
            ->orWhere('da_desc','like','%'. $search.'%');
        })->when($is_used,function($qry) use($is_used){
            $qry->where('is_used',$is_used);
        })
        ->select('code_locations.*','users.name as username','users.pa_name as pa_username');
    }
    public static function get_code_2(){
        return CodeLocations::whereNotNull('prov_code')
        ->where('is_used',true)
        ->groupBy('prov_code')
        ->orderBy('prov_code','asc');
    }
    
    public static function get_code_4(){
        return CodeLocations::whereNotNull('dist_code')
        ->where('is_used',true)
        ->groupBy('dist_code')
        ->orderBy('dist_code','asc');
    }
}
