<?php

namespace App\Livewire\Backend\Employees;

use Livewire\Component;
use App\Models\Employee;
use Livewire\WithFileUploads;

class Create extends Component
{
    use WithFileUploads;

    public $name;
    public $address;
    public $phone;
    public $email;

    public function store(){

        $this->validate([
            'name'=>'required',
            'phone'=>'required',
            'email'=>'required',
        ]);

        $manf =new Employee;
        $manf->name = $this->name;
        $manf->address = $this->address;
        $manf->phone = $this->phone;
        $manf->email = $this->email;
        $manf->save();

        session()->flash('success','Added Successfully!');
        $this->reset();
    }

    public function render()
    {
        return view('livewire.backend.employees.create')
        ->layout('backend.livewire-layout.base');
    }
}
