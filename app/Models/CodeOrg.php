<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CodeOrg extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'code_organizations';
    protected $guarded = [];
    
    public static function get_list($search=null, $is_used=false){
        return CodeOrg::join('mohe_auth_db.users','code_organizations.user_id','mohe_auth_db.users.id')
        ->when($search,function($qry) use($search){
            $qry->orWhere('ministry_code','like','%'. $search.'%')
            ->orWhere('sub_org_code','like','%'. $search.'%')
            ->orWhere('unit_code','like','%'. $search.'%')
            ->orWhere('en_desc','like','%'. $search.'%')
            ->orWhere('pa_desc','like','%'. $search.'%')
            ->orWhere('da_desc','like','%'. $search.'%');
        })->when($is_used,function($qry) use($is_used){
            $qry->where('is_used',$is_used);
        })
        ->select('code_organizations.*','users.name as username','users.pa_name as pa_username');
    }

    public static function get_code_5(){
        return CodeOrg::whereNotNull('unit_code')
        ->where('is_used',true)
        ->groupBy('unit_code')
        ->orderBy('unit_code','asc');
    }

    public static function get_code_4(){
        return CodeOrg::whereNotNull('sub_org_code')
        ->where('is_used',true)
        ->groupBy('sub_org_code')
        ->orderBy('sub_org_code','asc');
    }

    public static function get_code_3(){
        return CodeOrg::whereNotNull('ministry_code')
        ->where('is_used',true)
        ->groupBy('ministry_code')
        ->orderBy('ministry_code','asc');
    }
}
