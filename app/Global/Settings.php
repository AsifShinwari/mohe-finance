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

    public static function get_month_col($month){
        switch ($month) {
            case 'm_1':
                return Settings::trans('Hamal','وری','حمل');
                break;
            case 'm_2':
                return Settings::trans('Sawar','ثور','غویی');
                break;
            case 'm_3':
                return Settings::trans('Jawza','غبرګولی','جوزا');
                break;
            case 'm_4':
                return Settings::trans('Saratan','چنګاښ','سرطان');
                break;
            case 'm_5':
                return Settings::trans('Asad','زمری','اسد');
                break;
            case 'm_6':
                return Settings::trans('Sunbula','وږی','سنبله');
                break;
            case 'm_7':
                return Settings::trans('Mezan','تله','میزان');
                break;
            case 'm_8':
                return Settings::trans('Aqrab','لړم','عقرب');
                break;
            case 'm_9':
                return Settings::trans('Qaous','لیندۍ','قوس');
                break;
            case 'm_10':
                return Settings::trans('Jadi','مرغومی','جدی');
                break;
            case 'm_11':
                return Settings::trans('Dalwa','سلواغه','دلوه');
                break;
            case 'm_12':
                return Settings::trans('Hoot','کب','حوت');
                break;
            default:
                return 'invalid';
                break;
        }
    }

    public static function tentional_or_intentional(){
        return (object)[
            (object)[
                'id'=>1,
                'en_name'=>'Tentional',
                'pa_name'=>'اختیاري',
                'da_name'=>'اختیاری',
            ],
            (object)[
                'id'=>0,
                'en_name'=>'Intentional',
                'pa_name'=>'غیراختیاري',
                'da_name'=>'غیراختیاری',
            ]
        ];
    }
    public static function months(){
        return (object)[ (object)[
                'value'=>'Hamal',
                'value_col'=>'m_1',
                'en_name'=>'01-Hamal',
                'pa_name'=>'۰۱-وری',
                'da_name'=>'۰۱-حمل',
            ], (object)[
                'value'=>'Sawar',
                'value_col'=>'m_2',
                'en_name'=>'02-Sawar',
                'da_name'=>'۰۲-غویی',
                'pa_name'=>'۰۲-ثور',
            ], (object)[
                'value'=>'Jawza',
                'value_col'=>'m_3',
                'en_name'=>'03-Jawza',
                'pa_name'=>'۰۳-غبرګولی',
                'da_name'=>'۰۳-جوزا',
            ], (object)[
                'value'=>'Saratan',
                'value_col'=>'m_4',
                'en_name'=>'04-Saratan',
                'pa_name'=>'۰۴-چنګاښ',
                'da_name'=>'۰۴-سرطان',
            ], (object)[
                'value'=>'Asad',
                'value_col'=>'m_5',
                'en_name'=>'05-Asad',
                'pa_name'=>'۰۵-زمری',
                'da_name'=>'۰۵-اسد',
            ], (object)[
                'value'=>'Sunbula',
                'value_col'=>'m_6',
                'en_name'=>'06-Sunbula',
                'pa_name'=>'۰۶-وږی',
                'da_name'=>'۰۶-سنبله',
            ], (object)[
                'value'=>'Mezan',
                'value_col'=>'m_7',
                'en_name'=>'07-Mezan',
                'pa_name'=>'۰۷-تله',
                'da_name'=>'۰۷-میزان',
            ], (object)[
                'value'=>'Aqrab',
                'value_col'=>'m_8',
                'en_name'=>'08-Aqrab',
                'pa_name'=>'۰۸-لړم',
                'da_name'=>'۰۸-عقرب',
            ], (object)[
                'value'=>'Qaous',
                'value_col'=>'m_9',
                'en_name'=>'09-Qaous',
                'pa_name'=>'۰۹-لیندۍ',
                'da_name'=>'۰۹-قوس',
            ],
            (object)[
                'value'=>'Jadi',
                'value_col'=>'m_10',
                'en_name'=>'10-Jadi',
                'pa_name'=>'۱۰-مرغومی',
                'da_name'=>'۱۰-جدی',
            ],
            (object)[
                'value'=>'Dalwa',
                'value_col'=>'m_11',
                'en_name'=>'11-Dalwa',
                'pa_name'=>'۱۱-سلواغه',
                'da_name'=>'۱۱-دلوه',
            ],
            (object)[
                'value'=>'Hoot',
                'value_col'=>'m_12',
                'en_name'=>'12-Hoot',
                'pa_name'=>'۱۲-کب',
                'da_name'=>'۱۲-حوت',
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