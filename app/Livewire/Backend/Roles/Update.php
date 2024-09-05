<?php

namespace App\Livewire\Backend\Roles;

use Livewire\Component;
use Livewire\Attributes\Rule;
use \Spatie\Permission\Models\Role;

class Update extends Component
{
    #[Rule('required')]
    public $name;

    #[Rule('required')]
    public $role_id;

    public function mount($role_id){
        $this->role_id=$role_id;
        $this->name = Role::where('id',$role_id)->pluck('name')->first();
    }

    public function update(){
        
        $this->validate();

        Role::where('id',$this->role_id)->update([
            'name'=>$this->name
        ]);

        session()->flash('success','Role Updated Successfully!');
    }


    public function render(){

        return view('livewire.backend.roles.update')
        ->layout('backend.livewire-layout.base');
    }
}
