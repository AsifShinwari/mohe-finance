<?php

namespace App\Livewire\Backend\Finance\Budget\Plan;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\BudgetPlan;

class Update extends Component
{

    public $year; 
    public $id;
    
    public function mount($id){
        $this->id = $id;
        $data = BudgetPlan::where('id', $this->id)->first();
        if($data){
            $this->year = $data->year.'-01';
        }else{
            session()->flash('error',\Settings::trans('Invalid URL','لینک د اعتبار وړ نه دی','لینک قابل اعتبار نیست'));
            return redirect()->route('finance.budget.plan.index');
        }
    }

    public function store(){
        $this->validate([
            'year'=>'required',
        ],[
            'year.required'=>\Settings::trans('Year Field is Required','د کال فیلد باید خالی نه وي','فیلد سال باید خالي نباشد'),
        ]);

        BudgetPlan::where('id',$this->id)->update([
            'year'=>$this->year,
            'user_id'=>auth()->user()->id
        ]);

        session()->flash('success',\Settings::trans('Budget Plan Updated Successfully!','پلان تصحیح شو','تصحیح پلان'));
    }

    public function render()
    {
        return view('livewire.backend.finance.budget.plan.update')
        ->layout('backend.livewire-layout.base');
    }
}
