<?php

namespace App\Livewire\Backend\Hr\Departments;

use Livewire\Component;
use App\Models\Departement;

class Update extends Component
{
    public $name;
    public $pa_name;
    public $da_name;
    public $id;

    public function mount($id){
        $this->id = $id;
        $cate = Departement::where('id',$id)->first();
        $this->name = $cate->name;
        $this->pa_name = $cate->pa_name;
        $this->da_name = $cate->da_name;
    }

    public function update(){

        $this->validate([
            'name'=>'required',
            'pa_name'=>'required',
            'da_name'=>'required',
        ]);

        $cat = Departement::where('id',$this->id)->first();
        $cat->name = $this->name;
        $cat->pa_name = $this->pa_name;
        $cat->da_name = $this->da_name;
        $cat->update();

        session()->flash('success','Updated Successfully!');
    }

    public function render()
    {
        return view('livewire.backend.hr.departments.update')
        ->layout('backend.livewire-layout.base');
    }
}
