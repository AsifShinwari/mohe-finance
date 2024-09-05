<?php
namespace App\Helpers;
use DB;
class ImageHelper{
    public static function remove_image($path){
        if($path!=null or $path!=''){
            if(file_exists(public_path($path))){
                unlink(public_path($path));
            }
        }
    }
    
    public static function upload_image($file,$folder_path,$file_name){
        
        if($file==null){
            return null;
        }
        
        $file_ext=$file->getClientOriginalExtension();
        $fileNewName=$file_name.'.'.$file_ext;
        $image=$file->move($folder_path,$fileNewName);
        
        return $folder_path.'/'.$fileNewName;
    }

    public static function store_as($image,$path,$index=null){
        if($image!=null){
            if($index==null){
                $image_name = date('Y-m-d-h-i-s-m').'.'.$image->getClientOriginalExtension();
            }else{
                $image_name = date('Y-m-d-h-i-s-m').'-'.$index.'.'.$image->getClientOriginalExtension();
            }

            $img_url = 'storage/'.$path.'/'.$image_name;
            $image->storeAs('public/'.$path, $image_name);
            return $img_url;
        }

        return false;
    }

    public static function upload_save_image($req,$file_name_req,$folder_path,$table_name,$where_col_name,$where_col_val,$target_col_name,$file_new_name){
        
        if($req->hasFile($file_name_req)){
            
            $old_image = DB::table($table_name)
            ->where($where_col_name,$where_col_val)
            ->first();

            if($old_image){
                ImageHelper::remove_image($old_image->$target_col_name);
            }

            $_file=ImageHelper::upload_image($req->file($file_name_req),$folder_path,$file_new_name);

            $is_updated = DB::table($table_name)
            ->where($where_col_name,$where_col_val)
            ->update([
                $target_col_name=>$_file,
            ]);

            return $is_updated;
        }

        return false;
    }
}