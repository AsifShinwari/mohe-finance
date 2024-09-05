<?php

namespace App\Livewire\Backend\Finance\Master\Projects;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\CodeProject;

class Update extends Component
{
    public $code; 
    public $en_desc; 
    public $pa_desc; 
    public $da_desc; 
    public $id; 

    public function mount($id){
        $this->id = $id;
        $data = CodeProject::where('id', $this->id)->first();
        if($data){
            $this->code = $data->code;
            $this->en_desc = $data->en_desc;
            $this->pa_desc = $data->pa_desc;
            $this->da_desc = $data->da_desc;
        }else{
            session()->flash('error',\Settings::trans('Invalid URL','لینک د اعتبار وړ نه دی','لینک قابل اعتبار نیست'));
            return redirect()->route('finance.master.project.index');
        }
    }

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

            CodeProject::where('id',$this->id)->update([
                'code'=>$this->code,
                'en_desc'=>$this->en_desc,
                'pa_desc'=>$this->pa_desc,
                'da_desc'=>$this->da_desc,
                'is_used'=>true,
                'user_id'=>auth()->user()->id
            ]);

        session()->flash('success',\Settings::trans('Project Added Successfully!','پروژه اضافه شوه','پروژه اضافه ګردید'));
    }

    public function render()
    {
        return view('livewire.backend.finance.master.projects.update')
        ->layout('backend.livewire-layout.base');
    }
}
