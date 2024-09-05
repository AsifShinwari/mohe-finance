<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\Employee;
use DB;

class Departement extends Model
{
    use HasFactory;

    public static function childs($departmentId=null){
            // $query = "
            //     WITH RECURSIVE department_hierarchy AS (
            //         SELECT
            //             id,
            //             parent_department_id,
            //             name,
            //             pa_name,
            //             da_name,
            //             level,
            //             created_at,
            //             updated_at
            //         FROM departements
            //         WHERE id = :departmentId
            
            //         UNION ALL
            
            //         SELECT
            //             d.id,
            //             d.parent_department_id,
            //             d.name,
            //             d.pa_name,
            //             d.da_name,
            //             d.level,
            //             d.created_at,
            //             d.updated_at
            //         FROM departements d
            //         JOIN department_hierarchy h ON d.parent_department_id = h.id
            //     )
            
            //     SELECT * FROM department_hierarchy;
            // ";
            
            // return DB::select($query, ['departmentId' => $departmentId]);   
            return Departement::getDepartmentHierarchy($departmentId);
    }
    

public static function getDepartmentHierarchy($departmentId, $level = 1) {

    $dep = DB::table('departements')
    ->select('id','parent_department_id','name','pa_name','da_name','level','created_at','updated_at')
    ->where('id', $departmentId)->first();
    
    $departements = DB::table('departements')
    ->select('id','parent_department_id','name','pa_name','da_name','level','created_at','updated_at')
    ->where('parent_department_id', $departmentId)->get();

    $result = [$dep];
    foreach ($departements as $departement) {
        $departement->level = $level;
        $result[] = $departement;
        $children = Departement::getDepartmentHierarchy($departement->id, $level + 1);
        // $children = DB::table('departements')
        // ->select('id','parent_department_id','name','pa_name','da_name','level','created_at','updated_at')
        // ->where('parent_department_id', $departmentId)->get()->toArray();
        // $children = Departement::getDepartmentHierarchy($departement->id, $level + 1);
        $result = array_merge($result, $children);
    }

    
    //make all records unique
    $uniqueArray = [];
    foreach ($result as $record) {
        // Assuming 'id' is the unique identifier for each record
        $uniqueArray[$record->id] = $record;
    }
    // Convert the associative array back to a sequential array
    $uniqueRecords = array_values($uniqueArray);
    //end make all records unique


    return $uniqueRecords;
}


    //return department's user information
    public static function user($dep_id){

        //get employee's information of department
        $emp = Employee::where('departement_id',$dep_id)->first();
        //if employee exists
        if($emp){
            //get employee user's Account info
            $user = User::where('email',$emp->email)->first();
            if($user){
                return $user->id;    
            }else{
                return 0;
            }
        }

        return 0;
    }

}
