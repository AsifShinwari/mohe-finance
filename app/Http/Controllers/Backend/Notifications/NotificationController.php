<?php

namespace App\Http\Controllers\Backend\Notifications;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Notification;

class NotificationController extends Controller
{
    public function seen(string $link){

        //mark the notification as seen
        Notification::where('link', str_replace('*', '/',$link))
        ->where('to_user_id',auth()->user()->id)->update([
            'seen'=>true,
        ]);

        //*********************************************************************//
        //delete the notifications skip only last 5 (only seen notifications)
        //*********************************************************************//
        $total = Notification::where('to_user_id',auth()->user()->id)->get()->count();
        $unseen = Notification::where('to_user_id',auth()->user()->id)->where('seen',0)->get()->count();
        $seen = Notification::where('to_user_id',auth()->user()->id)->where('seen',1)->get()->count();

        //get the total notifications
        if($total > 5){

            // if unseen notifications are more than 5 then delete all seen notifications
            if($unseen > 5){

                //delete all seen notifications
                Notification::where('to_user_id',auth()->user()->id)
                ->where('seen',true)->delete();

            }else{

                //if seen notifications are more than 5, then skip top five and delete all seen notifications
                if($seen > 5){
                    
                    //get top 5 notifications
                    $top_five = Notification::where('to_user_id',auth()->user()->id)->where('seen',true)
                    ->orderBy('id','desc')
                    ->take(5)->pluck('notifications.id')->toArray();
                    
                    if(count($top_five) > 0){
                        //delete all seen notifications, skip only top 5 notifications
                        Notification::where('to_user_id',auth()->user()->id)
                        ->where('seen',true)
                        ->whereNotIn('id',$top_five)
                        ->delete();
                    }
                }
            }
        }

        //redirect to the link of notification
        return redirect(str_replace('*', '/',$link));
    }
}
