<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CodeProgram extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $table = 'code_programs';
    protected $guarded = [];
    
    public static function get_list($search=null, $is_used=false){
        return CodeProgram::join('mohe_auth_db.users','code_programs.user_id','mohe_auth_db.users.id')
        ->when($search,function($qry) use($search){
            $qry->orWhere('program_code','like','%'. $search.'%')
            ->orWhere('sub_program_code','like','%'. $search.'%')
            ->orWhere('activity_code','like','%'. $search.'%')
            ->orWhere('en_desc','like','%'. $search.'%')
            ->orWhere('pa_desc','like','%'. $search.'%')
            ->orWhere('da_desc','like','%'. $search.'%');
        })->when($is_used,function($qry) use($is_used){
            $qry->where('is_used',$is_used);
        })
        ->select('code_programs.*','users.name as username','users.pa_name as pa_username');
    }

    public static function get_code_3(){
        return CodeProgram::whereNotNull('program_code')
        ->where('is_used',true)
        ->groupBy('program_code')
        ->orderBy('program_code','asc');
    }

    public static function get_code_4(){
        return CodeProgram::whereNotNull('sub_program_code')
        ->where('is_used',true)
        ->groupBy('sub_program_code')
        ->orderBy('sub_program_code','asc');
    }

    public static function get_code_5(){
        return CodeProgram::whereNotNull('activity_code')
        ->where('is_used',true)
        ->groupBy('activity_code')
        ->orderBy('activity_code','asc');
    }

}
