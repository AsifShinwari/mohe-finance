<?php

namespace App\Livewire\Backend\Hr\Departments;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\Departement;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;

    public $search; 

    #[Computed]
    public function departments(){
        return Departement::where('parent_department_id',0)
        ->get();
    }


    public function sub_departments($department_id){
        return Departement::where('parent_department_id',$department_id)->get();
    }

    public function delete($department_id){
        try{
            Departement::where('id',$department_id)->delete();
            session()->flash('success','Department Deleted Successfully!');
        }catch(\Throwable $th){
            session()->flash('error','You can not delete this Department, it belongs to other records in database.');
        }
    }

    public function render()
    {
        return view('livewire.backend.hr.departments.index')
        ->layout('backend.livewire-layout.base');
    }
}
