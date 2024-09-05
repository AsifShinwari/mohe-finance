<?php

namespace App\Livewire\Backend\Finance\Master\Objects;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\CodeObject;

class Create extends Component
{
    public $category_code; 
    public $major_code; 
    public $minor_code; 
    public $new_code; 
    public $en_desc; 
    public $pa_desc; 
    public $da_desc; 

    #[Computed]
    public function category_codes(){
        return CodeObject::get_list()
        ->whereNotNull('category_code')
        ->select('category_code','en_desc','pa_desc','da_desc')
        ->groupBy('category_code')
        ->get();
    }

    #[Computed]
    public function major_codes(){
        return CodeObject::get_list()
        ->when($this->category_code,function($qry){
            $qry->where('category_code',$this->category_code);
        })
        ->whereNotNull('major_code')
        ->select('major_code','en_desc','pa_desc','da_desc')
        ->groupBy('major_code')
        ->get();
    }

    #[Computed]
    public function minor_codes(){
        return CodeObject::get_list()
        ->when($this->major_code,function($qry){
            $qry->where('major_code',$this->major_code);
        })
        ->whereNotNull('minor_code')
        ->select('minor_code','en_desc','pa_desc','da_desc')
        ->groupBy('minor_code')
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

        if($this->category_code==null && $this->major_code==null && $this->minor_code==null){
            CodeObject::create([
                'category_code'=>$this->new_code,
                'en_desc'=>$this->en_desc,
                'pa_desc'=>$this->pa_desc,
                'da_desc'=>$this->da_desc,
                'is_used'=>true,
                'user_id'=>auth()->user()->id
            ]);
        }elseif($this->category_code!=null && $this->major_code==null && $this->minor_code==null){
            CodeObject::create([
                'category_code'=>$this->category_code,
                'major_code'=>$this->new_code,
                'en_desc'=>$this->en_desc,
                'pa_desc'=>$this->pa_desc,
                'da_desc'=>$this->da_desc,
                'is_used'=>true,
                'user_id'=>auth()->user()->id
            ]);
        }elseif($this->category_code!=null && $this->major_code!=null && $this->minor_code==null){
            CodeObject::create([
                'category_code'=>$this->category_code,
                'major_code'=>$this->major_code,
                'minor_code'=>$this->new_code,
                'en_desc'=>$this->en_desc,
                'pa_desc'=>$this->pa_desc,
                'da_desc'=>$this->da_desc,
                'is_used'=>true,
                'user_id'=>auth()->user()->id
            ]);
        }elseif($this->category_code!=null && $this->major_code!=null && $this->minor_code!=null){
            CodeObject::create([
                'category_code'=>$this->category_code,
                'major_code'=>$this->major_code,
                'minor_code'=>$this->minor_code,
                'object_code'=>$this->new_code,
                'en_desc'=>$this->en_desc,
                'pa_desc'=>$this->pa_desc,
                'da_desc'=>$this->da_desc,
                'is_used'=>true,
                'user_id'=>auth()->user()->id
            ]);
        }

        session()->flash('success',\Settings::trans('Object Added Successfully!','نوی باب اضافه شوه','باب جدید اضافه ګردید'));
        $this->reset();
    }

    public function render()
    {
        return view('livewire.backend.finance.master.objects.create')
        ->layout('backend.livewire-layout.base');
    }
}
