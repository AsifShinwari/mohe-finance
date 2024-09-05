<?php

namespace App\Livewire\Backend\Hr\Departments;

use Livewire\Component;
use App\Models\Departement;
use Illuminate\Support\Str;
use Livewire\Attributes\Computed;

class Create extends Component
{
    public $name;
    public $da_name;
    public $pa_name;
    public $department_id;

    public function mount($department_id=null){
        $this->department_id = $department_id;
    }

    #[Computed]
    public function department(){
        return Departement::where('id',$this->department_id)
        ->first();
    }

    public function store(){

        $this->validate([
            'name'=>'required|unique:departements',
            'pa_name'=>'required',
            'da_name'=>'required',
        ]);

        $cat = new Departement;
        $cat->name = $this->name;
        $cat->pa_name = $this->pa_name;
        $cat->da_name = $this->da_name;
        $cat->parent_department_id = $this->department_id;
        $cat->save();

        session()->flash('success','Department Add Successfully!');
        $this->name = null;
        $this->pa_name = null;
        $this->da_name = null;
    }

    public function render()
    {
        return view('livewire.backend.hr.departments.create')
        ->layout('backend.livewire-layout.base');
    }
}
