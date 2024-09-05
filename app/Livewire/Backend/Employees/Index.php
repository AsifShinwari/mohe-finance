<?php

namespace App\Livewire\Backend\Employees;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\Employee;
use Livewire\WithPagination;

class Index extends Component
{

    use WithPagination;
 
    public $search; 

    #[Computed]
    public function employees(){
        return Employee::when($this->search,function($qry){
            $qry->orWhere('name','like','%'.$this->search.'%')
            ->orWhere('email','like','%'.$this->search.'%')
            ->orWhere('address','like','%'.$this->search.'%')
            ->orWhere('phone','like','%'.$this->search.'%');
        })
        ->latest()->paginate(10);
    }

    public function delete($id){
        try {
            Employee::where('id',$id)->delete();
            session()->flash('success','Record Deleted Successfully!');
        } catch (\Throwable $th) {
            session()->flash('error','This record can not be deleted, due to some reasons.');
        }
    }

    public function render()
    {
        return view('livewire.backend.employees.index')
        ->layout('backend.livewire-layout.base');
    }
}
