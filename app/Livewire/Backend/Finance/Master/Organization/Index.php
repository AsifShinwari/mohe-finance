<?php

namespace App\Livewire\Backend\Finance\Master\Organization;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\CodeOrg;
use Livewire\WithPagination;

class Index extends Component 
{
    use WithPagination;

    public $search; 

    #[Computed]
    public function orgs(){
        return CodeOrg::get_list($this->search,true)->paginate(10);
    }

    public function delete($id){
        CodeOrg::where('id',$id)->update([
            'is_used' => false,
        ]);
        session()->flash('success',\Settings::trans('Successfully deleted','چاره په بریالیتوب ترسره شوه','عملیه انجام شد'));
    }

    public function render()
    {
        return view('livewire.backend.finance.master.organization.index')
        ->layout('backend.livewire-layout.base');
    }
}
