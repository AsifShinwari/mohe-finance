<?php

namespace App\Livewire\Backend\Finance\Master\Objects;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\CodeObject;

class Edit extends Component
{
    public $category_code; 
    public $major_code; 
    public $minor_code; 
    public $object_code; 
    public $en_desc; 
    public $pa_desc; 
    public $da_desc; 
    public $id; 

    public function mount($id){
        $this->id = $id;
        $data = CodeObject::where('id', $this->id)->first();
        if($data){
            $this->category_code = $data->category_code;
            $this->major_code = $data->major_code;
            $this->minor_code = $data->minor_code;
            $this->object_code = $data->object_code;
            $this->en_desc = $data->en_desc;
            $this->pa_desc = $data->pa_desc;
            $this->da_desc = $data->da_desc;
        }else{
            session()->flash('error',\Settings::trans('Invalid URL','لینک د اعتبار وړ نه دی','لینک قابل اعتبار نیست'));
            return redirect()->route('finance.master.funds.index');
        }
    }

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

            CodeObject::where('id',$this->id)->update([
                'category_code'=>$this->category_code,
                'major_code'=>$this->major_code,
                'minor_code'=>$this->minor_code,
                'object_code'=>$this->object_code,
                'en_desc'=>$this->en_desc,
                'pa_desc'=>$this->pa_desc,
                'da_desc'=>$this->da_desc,
                'is_used'=>true,
                'user_id'=>auth()->user()->id
            ]);

        session()->flash('success',\Settings::trans('Object Updated Successfully!','فصل آپډیټ شو','فصل آپدیت شد'));
    }

    public function render()
    {
        return view('livewire.backend.finance.master.objects.edit')
        ->layout('backend.livewire-layout.base');
    }
}
