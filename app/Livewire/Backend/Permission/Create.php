<?php

namespace App\Livewire\Backend\Permission;

use Livewire\Component;
use Livewire\Attributes\Rule;
use \Spatie\Permission\Models\Permission;

class Create extends Component
{
    #[Rule('required')]
    public $name;

    public function store(){
        Permission::create(['name' => $this->name]);
        session()->flash('success','Permission Added Successfully!');
        $this->reset();
    }

    public function render()
    {
        return view('livewire.backend.permission.create')
        ->layout('backend.livewire-layout.base');
    }
}
