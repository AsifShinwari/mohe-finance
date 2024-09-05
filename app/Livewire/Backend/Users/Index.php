<?php

namespace App\Livewire\Backend\Users;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\User;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;

    public $search;

    #[Computed]
    public function users(){
        return User::leftJoin('employees','employees.email','users.email')
            ->leftJoin('departements','employees.departement_id','departements.id')
            ->when($this->search,function($qry){
            $qry->orWhere('users.name','like','%'.$this->search.'%')
            ->orWhere('users.email','like','%'.$this->search.'%');
        })->select('users.*','departements.name as dep_name','departements.pa_name as dep_pa_name','departements.da_name as dep_da_name')
        ->latest()->paginate(10);
    }

    public function render()
    {
        return view('livewire.backend.users.index')
        ->layout('backend.livewire-layout.base');
    }
}
