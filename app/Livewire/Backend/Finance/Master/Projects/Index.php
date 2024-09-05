<?php

namespace App\Livewire\Backend\Finance\Master\Projects;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\CodeProject;
use Livewire\WithPagination;

class Index extends Component 
{
    use WithPagination;

    public $search; 

    #[Computed]
    public function code_projects(){
        return CodeProject::get_list($this->search,true)->paginate(10);
    }

    public function delete($id){
        CodeProject::where('id',$id)->update([
            'is_used' => false,
        ]);
        session()->flash('success',\Settings::trans('Successfully deleted','چاره په بریالیتوب ترسره شوه','عملیه انجام شد'));
    }
    
    public function render()
    {
        return view('livewire.backend.finance.master.projects.index')
        ->layout('backend.livewire-layout.base');
    }
}
