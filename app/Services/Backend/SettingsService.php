<?php 

    namespace App\Services\Backend;
    use App\Models\Setting;
    use App\Helpers\ImageHelper;

class SettingsService {

    public function update($req){
        
        $obj = Setting::find(1);
        $obj->en_app_name=$req->en_app_name;
        $obj->pa_app_name=$req->pa_app_name;
        $obj->da_app_name=$req->da_app_name;
        $obj->abbr=$req->abbr;
        $obj->update();

        ImageHelper::upload_save_image($req,'medium_logo','uploads/logo/medium_logo',
        'settings','id',1,'medium_logo','rise-geo-logo');

        ImageHelper::upload_save_image($req,'larg_logo','uploads/logo/larg_logo',
        'settings','id',1,'larg_logo','rise-geo-logo');

        ImageHelper::upload_save_image($req,'small_logo','uploads/logo/small_logo',
        'settings','id',1,'small_logo','rise-geo-logo');

        ImageHelper::upload_save_image($req,'favicon','uploads/logo/favicon',
        'settings','id',1,'favicon','rise-geo-favicon');

        session()->flash('success','Changes Saved Successfully');

        return true;
    }
}