<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;
use App\Models\Departement;

class Notification extends Model
{    
    use HasFactory;
    protected $guarded = [];
    
    public static function get_notif($type=null){
        return Notification::join('users','notifications.to_user_id','users.id')
        ->where('to_user_id',auth()->user()->id)
        ->when($type,function($qry)use($type){
            $qry->where('type',$type);
        })->select('notifications.*','users.name as username')
        ->latest()->get();
    }

    public static function get_count($type=null){
        return Notification::join('users','notifications.to_user_id','users.id')
        ->where('to_user_id',auth()->user()->id)
        ->where('seen',false)
        ->when($type,function($qry)use($type){
            $qry->where('type',$type);
        })->select(DB::raw('count(notifications.id) as total'))->first();
    }

    public static function send($departement_id,$cols){
        // get from department, user information
        $user = Departement::user($departement_id);
        if($user){
            $cols['to_user_id'] = $user;
            Notification::create($cols);
        }
    }
}