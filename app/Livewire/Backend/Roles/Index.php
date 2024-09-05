<?php

namespace App\Livewire\Backend\Roles;

use Livewire\Component;
use Livewire\Attributes\Computed;
use \Spatie\Permission\Models\Role;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;

    public $search;

    #[Computed]
    public function roles(){
        return Role::when($this->search,function($qry){
            $qry->where('name','like','%'.$this->search.'%');
        })->latest()->paginate(10);
    }

    public function delete($role_id){
        try {
            Role::where('id',$role_id)->delete();
            session()->flash('success','Deleted Successfully!');
        } catch (\Throwable $th) {
            session()->flash('error','Due To Some Reasons You Can Not Delete This Role');
        }
    }

    public function render()
    {
        return view('livewire.backend.roles.index')
        ->layout('backend.livewire-layout.base');
    }
}
