<?php

namespace App\Livewire\Backend\Permission;

use Livewire\Component;
use Livewire\Attributes\Computed;
use \Spatie\Permission\Models\Permission;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;

    public $search;

    #[Computed]
    public function permissions(){
        return Permission::when($this->search,function($qry){
            $qry->where('name','like','%'.$this->search.'%');
        })
        ->latest()->paginate(10);
    }

    public function delete($permission_id){
        try {
            Permission::where('id',$permission_id)->delete();
            session()->flash('success','Deleted Successfully!');
        } catch (\Throwable $th) {
            session()->flash('error','Due To Some Reasons You Can Not Delete This Role');
        }
    }

    public function render()
    {
        return view('livewire.backend.permission.index')
        ->layout('backend.livewire-layout.base');
    }
}
