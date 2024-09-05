<?php

namespace App\Livewire\Backend\RolePermissions;

use Livewire\Component;
use Livewire\Attributes\Computed;
use \Spatie\Permission\Models\Role;
use \Spatie\Permission\Models\Permission;

class Assign extends Component
{
    public $role_id;
    public $permission_id;

    public function mount($role_id){
        $this->role_id = $role_id;
        $this->permission_id = $this->role_permissions()->pluck('name')->toArray();
    }

    #[Computed]
    public function roles(){
        return Role::get();
    }

    #[Computed]
    public function permissions(){
        return Permission::get();
    }

    #[Computed]
    public function role_permissions(){
        $role = Role::findById($this->role_id);
        return $role->permissions;
    }

    public function assign_permission_to_role(){
        $role = Role::findById($this->role_id);
        $role->syncPermissions($this->permission_id);
        // $role->givePermissionTo($permission);
        session()->flash('success','Successfully Assigned!');
    }

    public function render()
    {
        return view('livewire.backend.role-permissions.assign')
        ->layout('backend.livewire-layout.base');
    }
}
