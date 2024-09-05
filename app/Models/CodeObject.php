<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CodeObject extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $guarded = [];
    
    public static function get_list($search=null, $is_used=false){
        return CodeObject::join('mohe_auth_db.users','code_objects.user_id','mohe_auth_db.users.id')
        ->when($search,function($qry) use($search){
            $qry->orWhere('category_code','like','%'. $search.'%')
            ->orWhere('major_code','like','%'. $search.'%')
            ->orWhere('minor_code','like','%'. $search.'%')
            ->orWhere('object_code','like','%'. $search.'%')
            ->orWhere('en_desc','like','%'. $search.'%')
            ->orWhere('pa_desc','like','%'. $search.'%')
            ->orWhere('da_desc','like','%'. $search.'%');
        })->when($is_used,function($qry) use($is_used){
            $qry->where('is_used',$is_used);
        })
        ->select('code_objects.*','users.name as username','users.pa_name as pa_username');
    }

    public static function get_code_1(){
        return CodeObject::whereNotNull('category_code')
        ->where('is_used',true)
        ->groupBy('category_code')
        ->orderBy('category_code','asc');
    }

    public static function get_code_2(){
        return CodeObject::whereNotNull('major_code')
        ->where('is_used',true)
        ->groupBy('major_code')
        ->orderBy('major_code','asc');
    }

    public static function get_code_3(){
        return CodeObject::whereNotNull('minor_code')
        ->where('is_used',true)
        ->groupBy('minor_code')
        ->orderBy('minor_code','asc');
    }

    public static function get_code_5(){
        return CodeObject::whereNotNull('object_code')
        ->where('is_used',true)
        ->groupBy('object_code')
        ->orderBy('object_code','asc');
    }
}
