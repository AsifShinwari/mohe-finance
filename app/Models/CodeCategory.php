<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CodeCategory extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'code_categories';
    protected $guarded = [];
    
    public static function get_list($search=null, $is_used=false){
        // return CodeOrg::join('mohe_auth_db.users','code_organizations.user_id','mohe_auth_db.users.id')
        // ->when($search,function($qry) use($search){
        //     $qry->orWhere('ministry_code','like','%'. $search.'%')
        //     ->orWhere('sub_org_code','like','%'. $search.'%')
        //     ->orWhere('unit_code','like','%'. $search.'%')
        //     ->orWhere('en_desc','like','%'. $search.'%')
        //     ->orWhere('pa_desc','like','%'. $search.'%')
        //     ->orWhere('da_desc','like','%'. $search.'%');
        // })->when($is_used,function($qry) use($is_used){
        //     $qry->where('is_used',$is_used);
        // })
        // ->select('code_organizations.*','users.name as username','users.pa_name as pa_username');
    }
}
