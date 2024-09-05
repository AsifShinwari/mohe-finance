<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CodeFund extends Model
{
    use HasFactory;
    protected $connection = 'finance';
    protected $guarded = [];
    
    public static function get_list($search=null, $is_used=false){
        return CodeFund::join('mohe_auth_db.users','code_funds.user_id','mohe_auth_db.users.id')
        ->when($search,function($qry) use($search){
            $qry->orWhere('fund_type_code','like','%'. $search.'%')
            ->orWhere('fund_code','like','%'. $search.'%')
            ->orWhere('sub_fund_code','like','%'. $search.'%')
            ->orWhere('fund_componenet_code','like','%'. $search.'%')
            ->orWhere('en_desc','like','%'. $search.'%')
            ->orWhere('pa_desc','like','%'. $search.'%')
            ->orWhere('da_desc','like','%'. $search.'%');
        })->when($is_used,function($qry) use($is_used){
            $qry->where('is_used',$is_used);
        })
        ->select('code_funds.*','users.name as username','users.pa_name as pa_username');
    }

    public static function get_code_1(){
        return CodeFund::whereNotNull('fund_type_code')
        ->where('is_used',true)
        ->groupBy('fund_type_code')
        ->orderBy('fund_type_code','asc');
    }

    public static function get_code_2(){
        return CodeFund::whereNotNull('fund_code')
        ->where('is_used',true)
        ->groupBy('fund_code')
        ->orderBy('fund_code','asc');
    }

    public static function get_code_4(){
        return CodeFund::whereNotNull('sub_fund_code')
        ->where('is_used',true)
        ->groupBy('sub_fund_code')
        ->orderBy('sub_fund_code','asc');
    }

    public static function get_code_5(){
        return CodeFund::whereNotNull('fund_componenet_code')
        ->where('is_used',true)
        ->groupBy('fund_componenet_code')
        ->orderBy('fund_componenet_code','asc');
    }
}
