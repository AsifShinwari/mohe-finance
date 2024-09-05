<?php

namespace App\Livewire\Backend\Employees;

use Livewire\Component;
use App\Models\Employee;
use Livewire\WithFileUploads;

class Update extends Component
{
    use WithFileUploads;

    public $id;
    public $name;
    public $address;
    public $phone;
    public $email;

    public function mount($id){
        $this->id = $id;
        $emp =Employee::where('id',$this->id)->first();
        $this->name = $emp->name;
        $this->address = $emp->address;
        $this->phone = $emp->phone;
        $this->email = $emp->email;
    }

    public function update(){

        $this->validate([
            'name'=>'required',
            'phone'=>'required',
            'email'=>'required',
        ]);

        $emp =Employee::where('id',$this->id)->first();
        $emp->name = $this->name;
        $emp->address = $this->address;
        $emp->phone = $this->phone;
        $emp->email = $this->email;
        $emp->save();

        session()->flash('success','Updated Successfully!');
    }

    public function render()
    {
        return view('livewire.backend.employees.update')
        ->layout('backend.livewire-layout.base');
    }
}
