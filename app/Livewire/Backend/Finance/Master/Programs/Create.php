<?php

namespace App\Livewire\Backend\Finance\Master\Programs;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\CodeProgram;

class Create extends Component
{
    public $program_code; 
    public $sub_program_code; 
    // public $activity_code; 
    public $new_code; 
    public $en_desc; 
    public $pa_desc; 
    public $da_desc; 

    #[Computed]
    public function program_codes(){
        return CodeProgram::get_list()
        ->whereNotNull('program_code')
        ->select('program_code','en_desc','pa_desc','da_desc')
        ->groupBy('program_code')
        ->get();
    }

    #[Computed]
    public function sub_program_codes(){
        return CodeProgram::get_list()
        ->when($this->program_code,function($qry){
            $qry->where('program_code',$this->program_code);
        })
        ->whereNotNull('sub_program_code')
        ->select('sub_program_code','en_desc','pa_desc','da_desc')
        ->groupBy('sub_program_code')
        ->get();
    }

    #[Computed]
    public function activity_codes(){
        return CodeProgram::get_list()
        ->when($this->sub_program_code,function($qry){
            $qry->where('sub_program_code',$this->sub_program_code);
        })
        ->whereNotNull('activity_code')
        ->select('activity_code','en_desc','pa_desc','da_desc')
        ->groupBy('activity_code')
        ->get();
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

        if($this->program_code==null && $this->sub_program_code==null){
            CodeProgram::create([
                'program_code'=>$this->new_code,
                'en_desc'=>$this->en_desc,
                'pa_desc'=>$this->pa_desc,
                'da_desc'=>$this->da_desc,
                'is_used'=>true,
                'user_id'=>auth()->user()->id
            ]);
        }elseif($this->program_code!=null && $this->sub_program_code==null){
            CodeProgram::create([
                'program_code'=>$this->program_code,
                'sub_program_code'=>$this->new_code,
                'en_desc'=>$this->en_desc,
                'pa_desc'=>$this->pa_desc,
                'da_desc'=>$this->da_desc,
                'is_used'=>true,
                'user_id'=>auth()->user()->id
            ]);
        }elseif($this->program_code!=null && $this->sub_program_code!=null){
            CodeProgram::create([
                'program_code'=>$this->program_code,
                'sub_program_code'=>$this->sub_program_code,
                'activity_code'=>$this->new_code,
                'en_desc'=>$this->en_desc,
                'pa_desc'=>$this->pa_desc,
                'da_desc'=>$this->da_desc,
                'is_used'=>true,
                'user_id'=>auth()->user()->id
            ]);

        }

        session()->flash('success',\Settings::trans('Program Added Successfully!','برنامه اضافه شوه','برنامه جدید اضافه ګردید'));
        $this->reset();
    }

    public function render()
    {
        return view('livewire.backend.finance.master.programs.create')
        ->layout('backend.livewire-layout.base');
    }
}
