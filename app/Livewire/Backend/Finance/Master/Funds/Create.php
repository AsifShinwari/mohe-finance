<?php

namespace App\Livewire\Backend\Finance\Master\Funds;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\CodeFund;

class Create extends Component
{
    public $fund_type_code; 
    public $fund_code; 
    public $sub_fund_code; 
    public $fund_componenet_code; 
    public $new_code; 
    public $en_desc; 
    public $pa_desc; 
    public $da_desc; 

    #[Computed]
    public function fund_type_codes(){
        return CodeFund::get_list()
        ->whereNotNull('fund_type_code')
        ->select('fund_type_code','en_desc','pa_desc','da_desc')
        ->groupBy('fund_type_code')
        ->get();
    }

    #[Computed]
    public function fund_codes(){
        return CodeFund::get_list()
        ->when($this->fund_type_code,function($qry){
            $qry->where('fund_type_code',$this->fund_type_code);
        })
        ->whereNotNull('fund_code')
        ->select('fund_code','en_desc','pa_desc','da_desc')
        ->groupBy('fund_code')
        ->get();
    }

    #[Computed]
    public function sub_fund_codes(){
        return CodeFund::get_list()
        ->when($this->fund_code,function($qry){
            $qry->where('fund_code',$this->fund_code);
        })
        ->whereNotNull('sub_fund_code')
        ->select('sub_fund_code','en_desc','pa_desc','da_desc')
        ->groupBy('sub_fund_code')
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

        if($this->fund_type_code==null && $this->fund_code==null && $this->sub_fund_code==null){
            CodeFund::create([
                'fund_type_code'=>$this->new_code,
                'en_desc'=>$this->en_desc,
                'pa_desc'=>$this->pa_desc,
                'da_desc'=>$this->da_desc,
                'is_used'=>true,
                'user_id'=>auth()->user()->id
            ]);
        }elseif($this->fund_type_code!=null && $this->fund_code==null && $this->sub_fund_code==null){
            CodeFund::create([
                'fund_type_code'=>$this->fund_type_code,
                'fund_code'=>$this->new_code,
                'en_desc'=>$this->en_desc,
                'pa_desc'=>$this->pa_desc,
                'da_desc'=>$this->da_desc,
                'is_used'=>true,
                'user_id'=>auth()->user()->id
            ]);
        }elseif($this->fund_type_code!=null && $this->fund_code!=null && $this->sub_fund_code==null){
            CodeFund::create([
                'fund_type_code'=>$this->fund_type_code,
                'fund_code'=>$this->fund_code,
                'sub_fund_code'=>$this->new_code,
                'en_desc'=>$this->en_desc,
                'pa_desc'=>$this->pa_desc,
                'da_desc'=>$this->da_desc,
                'is_used'=>true,
                'user_id'=>auth()->user()->id
            ]);
        }elseif($this->fund_type_code!=null && $this->fund_code!=null && $this->sub_fund_code!=null){
            CodeFund::create([
                'fund_type_code'=>$this->fund_type_code,
                'fund_code'=>$this->fund_code,
                'sub_fund_code'=>$this->sub_fund_code,
                'fund_componenet_code'=>$this->new_code,
                'en_desc'=>$this->en_desc,
                'pa_desc'=>$this->pa_desc,
                'da_desc'=>$this->da_desc,
                'is_used'=>true,
                'user_id'=>auth()->user()->id
            ]);
        }

        session()->flash('success',\Settings::trans('Fund Added Successfully!','نوی وجه اضافه شوه','وجه جدید اضافه ګردید'));
        $this->reset();
    }

    public function render()
    {
        return view('livewire.backend.finance.master.funds.create')
        ->layout('backend.livewire-layout.base');
    }
}
