<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CodeProject extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'code_projects';
    protected $guarded = [];
    
    public static function get_list($search=null, $is_used=false){
        return CodeProject::join('mohe_auth_db.users','code_projects.user_id','mohe_auth_db.users.id')
        ->when($search,function($qry) use($search){
            $qry->orWhere('code','like','%'. $search.'%')
            ->orWhere('en_desc','like','%'. $search.'%')
            ->orWhere('pa_desc','like','%'. $search.'%')
            ->orWhere('da_desc','like','%'. $search.'%');
        })->when($is_used,function($qry) use($is_used){
            $qry->where('is_used',$is_used);
        })
        ->select('code_projects.*','users.name as username','users.pa_name as pa_username');
    }
}
