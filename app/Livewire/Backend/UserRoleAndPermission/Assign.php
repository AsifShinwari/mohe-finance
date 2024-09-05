<?php

namespace App\Livewire\Backend\UserRoleAndPermission;

use Livewire\Component;
use App\Models\User;
use Livewire\Attributes\Computed;
use \Spatie\Permission\Models\Role;
use \Spatie\Permission\Models\Permission;

class Assign extends Component
{

    public $user;
    public $name;
    public $role_id; //return array of role_names

    public function mount($user_id){
        $this->user = User::where('id',$user_id)->first();
        $this->name = $this->user->name;
        $this->role_id = $this->user_roles_names();
    }

    #[Computed]
    public function roles(){
        return Role::get();
    }
    
    public function get_role_permissions($roleId){
        $role = Role::findById($roleId);
        return $role->permissions;
    }

    #[Computed]
    public function user_roles_names(){
        return $this->user->getRoleNames()->toArray();
    }

    #[Computed]
    public function user_roles(){
        return Role::whereIn('name',$this->user_roles_names)->get();
    }



    #[Computed]
    public function user_roles_permissions(){
        return $this->user->getRoleNames()->toArray();
    }

    public function toggle_permission($role_id,$permission_name){
        if($this->user->hasDirectPermission($permission_name)){
            $this->user->revokePermissionTo($permission_name);
        }else{
            $this->user->givePermissionTo($permission_name);
        }
    }

    public function assign_roles(){
        $this->user->roles()->detach();
        $this->user->assignRole($this->role_id);
        session()->flash('success',\Settings::trans('Added Successfully!','چاره په بریالیتوب ترسره شوه.','کار با موفقیت انجام شد'));
    }

    public function render()
    {
        return view('livewire.backend.user-role-and-permission.assign')
        ->layout('backend.livewire-layout.base');
    }
}
