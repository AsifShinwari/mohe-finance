<?php

namespace App\Livewire\Backend\Permission;

use Livewire\Component;
use Livewire\Attributes\Rule;
use \Spatie\Permission\Models\Permission;

class Update extends Component
{
    public $permission;

    #[Rule('required')]
    public $name;

    public function mount($permission_id){
        $this->permission=Permission::where('id',$permission_id)->first();
        $this->name = $this->permission->name;
    }

    public function update(){
        Permission::where('id',$this->permission->id)->update(['name' => $this->name]);
        session()->flash('success','Permission Updated Successfully!');
    }

    public function render()
    {
        return view('livewire.backend.permission.update')
        ->layout('backend.livewire-layout.base');
    }
}
