<?php
    namespace App\Global;
use App\Models\Setting;
use App\Models\Notification;
use App\Helpers\HijriDate;

class Settings {

    public static function get(){
        return Setting::latest()->first();
    }

    public static function check_current_route($route_name){
        if(\Route::currentRouteName()==$route_name){
          return 'active';
        }
        return null;
    }

    public static function check_current_url($url){
        if(url()->full()==$url){
          return 'active';
        }
        return null;
    }
  
    public static function check_in_urls($urls){ 
  
          for ($i=0; $i < count($urls); $i++) { 
              if(url()->full()==$urls[$i]){
                return 'menu-open';
                break;
              }
          }
  
          return '';
    }

    public static function check_in_routes($routes){ 
  
          for ($i=0; $i < count($routes); $i++) { 
              if(\Route::currentRouteName()==$routes[$i]){
                return 'menu-open';
                break;
              }
          }
  
          return '';
    }

    public static function trans($en,$pa,$da){

        switch (app()->getLocale()) {
            case 'en':
                return $en;
                break;
            case 'pa':
                return $pa;
                break;
            case 'da':
                return $da;
                break;           
            default:
                return $en;
                break;
        }
    }

    //token system only 
    public static function get_process_statuses(){
        $obj = (object)[
            'id'=>1,
            'en_name'=>'New',
            'pa_name'=>'نوی',
            'da_name'=>'جدید' 
        ];

        $obj1 = (object)[
            'id'=>2,
            'en_name'=>'Under Process',
            'pa_name'=>'اجرات',
            'da_name'=>'اجرات' 
        ];

        $obj2 = (object)[
            'id'=>3,
            'en_name'=>'Rejected',
            'pa_name'=>'رد شوی',
            'da_name'=>'رد شوی',
        ];

        $obj3 = (object)[
            'id'=>4,
            'en_name'=>'Completed',
            'pa_name'=>'تکمیل شوی',
            'da_name'=>'تکمیل شده',
        ];

        $array = 
        [
            $obj, $obj1, $obj2, $obj3
        ];

        return (object)$array;


    }

    public static function OpertationTypes(){
        return (object)[ (object)[
                'value'=>'new',
                'en_name'=>'New',
                'pa_name'=>'اصل صادر شوي',
                'da_name'=>'سادر شده اصل',
            ], (object)[
                'value'=>'in-terms-of-communication',
                'en_name'=>'In Terms of Communication',
                'da_name'=>'از حیث ارتباط',
                'pa_name'=>'د ارتباط په ډول',
            ], (object)[
                'value'=>'maktoob-answer',
                'en_name'=>'Maktoob Answer',
                'pa_name'=>'مکتوب ځواب',
                'da_name'=>'جواب مکتوب',
            ], (object)[
                'value'=>'forward-internal-orignal',
                'en_name'=>'Forward Internal Orignal',
                'pa_name'=>'راجع کول - اصلی',
                'da_name'=>'راجع - اصلی',
            ], (object)[
                'value'=>'forward-internal-copy',
                'en_name'=>'Forward Internal Copy',
                'pa_name'=>'راجع کول - کاپي',
                'da_name'=>'راجع - کاپی',
            ], (object)[
                'value'=>'suggestion',
                'en_name'=>'Suggestion',
                'pa_name'=>'وړاندیز',
                'da_name'=>'پیشنهاد',
            ], (object)[
                'value'=>'command',
                'en_name'=>'Command',
                'pa_name'=>'حکم',
                'da_name'=>'حکم',
            ], (object)[
                'value'=>'maktoob-followup',
                'en_name'=>'Follow Up',
                'pa_name'=>'تعقیبي مکتوب',
                'da_name'=>'مکتوب تعقیبی',
            ], (object)[
                'value'=>'maktoob-copy',
                'en_name'=>'Copy',
                'pa_name'=>'کاپي',
                'da_name'=>'کاپی',
            ],
            //  (object)[
            //     'value'=>'to-all',
            //     'en_name'=>'To All',
            //     'pa_name'=>'متحدالمال',
            //     'da_name'=>'متحدالمال', 
            // ],
            (object)[
                'value'=>'to-all-original',
                'en_name'=>'To All',
                'pa_name'=>'متحدالمال',
                'da_name'=>'متحدالمال',
            ]  
        ];
    }

    public static function get_times($post_datetime,$abbr=false){
        $ttime='';
        $years=0; $months=0; $days=0; 
        $hours=0; $minutes=0; $seconds=0;

        $date2 = strtotime($post_datetime);  
        $date1 = strtotime(date('Y-m-d H:i:s'));  
        // Formulate the Difference between two dates 
        $diff = abs($date2 - $date1);  
        // To get the year divide the resultant date into 
        // total seconds in a year (365*60*60*24) 
        $years = floor($diff / (365*60*60*24));  
        // To get the month, subtract it with years and 
        // divide the resultant date into 
        // total seconds in a month (30*60*60*24) 
        $months = floor(($diff - $years * 365*60*60*24) / (30*60*60*24));  
        // To get the day, subtract it with years and  
        // months and divide the resultant date into 
        // total seconds in a days (60*60*24) 
        $days = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24)/ (60*60*24)); 
        // To get the hour, subtract it with years,  
        // months & seconds and divide the resultant 
        // date into total seconds in a hours (60*60) 
        $hours = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24 - $days*60*60*24) / (60*60));  
        // To get the minutes, subtract it with years, 
        // months, seconds and hours and divide the  
        // resultant date into total seconds i.e. 60 
        $minutes = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24 - $days*60*60*24 - $hours*60*60)/ 60);  
        // To get the minutes, subtract it with years, 
        // months, seconds, hours and minutes  
        $seconds = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24 - $days*60*60*24 - $hours*60*60 - $minutes*60));  
        
        if($abbr){
            if($years!=0){ return $years.' Y'; }
            if($months!=0){ return $months.' M'; }
            if($days!=0){ return $days.' D'; }
            if($hours!=0){ return $hours.' H'; }
            if($minutes!=0){ return $minutes.' Min'; }
            if($seconds!=0){ return $seconds.' S'; }
        }else{
            if($years!=0){ return $years.'-Years Ago'; }
            if($months!=0){ return $months.'-Months Ago'; }
            if($days!=0){ return $days.'-Days Ago'; }
            if($hours!=0){ return $hours.'-Hours Ago'; }
            if($minutes!=0){ return $minutes.'-Minutes Ago'; }
            if($seconds!=0){ return $seconds.'-Seconds Ago'; }
        }

        return $ttime;
    }

    public static function change_from_hijri($date){
        if($date!=null && $date!=''){
            $convertToHijri=new HijriDate();
            $gregorian=$convertToHijri->jalali_to_gregorian(explode("-", $date)[0],explode("-", $date)[1],explode("-", $date)[2]);
            return $gregorian[0].'-'.$gregorian[1].'-'.$gregorian[2];
        }
    }

    public static function change_to_hijri($date){
        if($date!=null && $date!=''){
            $convertToHijri=new HijriDate();
            $hijri = $convertToHijri->gregorian_to_jalali(date('Y',strtotime($date)),date('m',strtotime($date)),date('d',strtotime($date)));
            return $hijri[0].'-'.$hijri[1].'-'.$hijri[2];
        }
    }
    
}