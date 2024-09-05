<?php

namespace App\Livewire\Backend\Finance\Master\Projects;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\CodeProject;

class Create extends Component
{
    public $code; 
    public $en_desc; 
    public $pa_desc; 
    public $da_desc; 

    public function store(){
        $this->validate([
            'en_desc'=>'required',
            'pa_desc'=>'required',
            'da_desc'=>'required',
        ],[
            'en_desc.required'=>\Settings::trans('English Description Field is Required','د انګلیسی تشریح باید خالی نه وي','تشریح انګلیسی باید خالي نباشد'),
            'pa_desc.required'=>\Settings::trans('Pashto Description Field is Required','د پښتو تشریح باید خالی نه وي','تشریح پشتو باید خالي نباشد'),
            'da_desc.required'=>\Settings::trans('Dari Description Field is Required','د دری تشریح باید خالی نه وي','تشریح دری باید خالي نباشد'),
        ]);

            CodeProject::create([
                'code'=>$this->code,
                'en_desc'=>$this->en_desc,
                'pa_desc'=>$this->pa_desc,
                'da_desc'=>$this->da_desc,
                'is_used'=>true,
                'user_id'=>auth()->user()->id
            ]);

        session()->flash('success',\Settings::trans('Project Added Successfully!','پروژه اضافه شوه','پروژه اضافه ګردید'));
        $this->reset();
    }

    public function render()
    {
        return view('livewire.backend.finance.master.projects.create')
        ->layout('backend.livewire-layout.base');
    }
}
