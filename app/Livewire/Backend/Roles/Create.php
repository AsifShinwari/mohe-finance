<?php

namespace App\Livewire\Backend\Roles;

use Livewire\Component;
use Livewire\Attributes\Rule;
use \Spatie\Permission\Models\Role;

class Create extends Component
{
    #[Rule('required')]
    public $name;

    public function store(){
        $this->validate();        
        $role = Role::create(['name' => $this->name]);
        session()->flash('success','Role Added Successfully!');
        $this->reset();
    }

    public function render()
    {
        return view('livewire.backend.roles.create')
        ->layout('backend.livewire-layout.base');
    }
}
