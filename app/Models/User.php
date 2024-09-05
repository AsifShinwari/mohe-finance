<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use \Spatie\Permission\Models\Role;
use \Spatie\Permission\Models\Permission;
use DB;

class User extends Authenticatable
{
    use HasApiTokens, HasRoles, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'image',
        'pa_name'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    public function roles()
    {
        return $this->belongsToMany(Role::class);
    }

    public function permissions()
    {
        return $this->belongsToMany(Permission::class);
    }

    public static function dep(){
        $emp = DB::table('employees')->where('email',auth()->user()->email)->first();
        if($emp){
            return DB::table('departements')->where('id',$emp->departement_id)->first();
        }
        return false;
    }

    public static function under_deps(){
        $emp = DB::table('employees')->where('email',auth()->user()->email)->first();
        if($emp){
            $departmentId = $emp->departement_id;
            $query = "
                WITH RECURSIVE department_hierarchy AS (
                    SELECT
                        id,
                        parent_department_id,
                        name,
                        pa_name,
                        da_name,
                        level,
                        created_at,
                        updated_at
                    FROM departements
                    WHERE id = :departmentId
            
                    UNION ALL
            
                    SELECT
                        d.id,
                        d.parent_department_id,
                        d.name,
                        d.pa_name,
                        d.da_name,
                        d.level,
                        d.created_at,
                        d.updated_at
                    FROM departements d
                    JOIN department_hierarchy h ON d.parent_department_id = h.id
                )
            
                SELECT * FROM department_hierarchy;
            ";
            
            return DB::select($query, ['departmentId' => $departmentId]);            
        }
    }
}
