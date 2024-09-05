<?php

namespace App\Livewire\Backend\Finance\Master\Organization;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\CodeOrg;

class Update extends Component
{
    public $ministry_code; 
    public $sub_org_code; 
    public $unit_code; 
    public $new_code; 
    public $en_desc; 
    public $pa_desc; 
    public $da_desc; 
    public $id; 

    public function mount($id){
        $this->id = $id;
        $data = CodeOrg::where('id', $this->id)->first();
        if($data){
            $this->ministry_code = $data->ministry_code;
            $this->sub_org_code = $data->sub_org_code;
            $this->unit_code = $data->unit_code;
            $this->object_code = $data->object_code;
            $this->en_desc = $data->en_desc;
            $this->pa_desc = $data->pa_desc;
            $this->da_desc = $data->da_desc;
        }else{
            session()->flash('error',\Settings::trans('Invalid URL','لینک د اعتبار وړ نه دی','لینک قابل اعتبار نیست'));
            return redirect()->route('finance.master.orgs.index');
        }
    }

    #[Computed]
    public function ministry_codes(){
        return CodeOrg::get_list()
        ->whereNotNull('ministry_code')
        ->select('ministry_code','en_desc','pa_desc','da_desc')
        ->groupBy('ministry_code')
        ->get();
    }

    #[Computed]
    public function sub_org_codes(){
        return CodeOrg::get_list()
        ->when($this->ministry_code,function($qry){
            $qry->where('ministry_code',$this->ministry_code);
        })
        ->whereNotNull('sub_org_code')
        ->select('sub_org_code','en_desc','pa_desc','da_desc')
        ->groupBy('sub_org_code')
        ->get();
    }

    #[Computed]
    public function unit_codes(){
        return CodeOrg::get_list()
        ->when($this->sub_org_code,function($qry){
            $qry->where('sub_org_code',$this->sub_org_code);
        })
        ->whereNotNull('unit_code')
        ->select('unit_code','en_desc','pa_desc','da_desc')
        ->groupBy('unit_code')
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

        CodeOrg::where('id',$this->id)->update([
            'ministry_code'=>$this->ministry_code,
            'sub_org_code'=>$this->sub_org_code,
            'unit_code'=>$this->new_code,
            'en_desc'=>$this->en_desc,
            'pa_desc'=>$this->pa_desc,
            'da_desc'=>$this->da_desc,
            'is_used'=>true,
            'user_id'=>auth()->user()->id
        ]);

        session()->flash('success',\Settings::trans('Object Added Successfully!','نوی باب اضافه شوه','باب جدید اضافه ګردید'));
    }

    public function render()
    {
        return view('livewire.backend.finance.master.organization.update')
        ->layout('backend.livewire-layout.base');
    }
}
