<?php

namespace App\Livewire\Backend\Finance\Budget\Plan\Approved;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\BudgetPlan;
use App\Models\BudgetApproved;
use App\Models\CodeObject;

class Update extends Component
{
    public $id;
    
    public function mount($id){
        $this->id = $id;
        $data = BudgetPlan::where('id', $this->id)->first();
        if($data){
            $this->year = $data->year.'-01';

            $approved_budget = BudgetApproved::where('budget_plan_id',$this->id)->get();

            if($approved_budget->count() <= 0){
                $codes = CodeObject::groupBy('major_code')->get();
                foreach($codes as $code){
                    BudgetApproved::create([
                        'code_object_2' => $code->major_code,
                        'budget_plan_id' => $this->id,
                        'user_id' => auth()->user()->id,
                        'remarks' => null,
                    ]);
                }
            }

        }else{
            session()->flash('error',\Settings::trans('Invalid URL','لینک د اعتبار وړ نه دی','لینک قابل اعتبار نیست'));
            return redirect()->route('finance.budget.plan.index');
        }
    }

    #[Computed]
    public function get_approveds(){
        return BudgetApproved::where('budget_plan_id',$this->id)->get();
    }

    #[Computed]
    public function get_budget_plan(){
        return BudgetPlan::where('id', $this->id)->first();
    }

    public function update($data){
        foreach($this->get_approveds as $item){

            BudgetApproved::where('id',$item->id)->update([
                'amount' => $data['amount'.$item->id],
               'remarks' => $data['remarks'.$item->id],
            ]);

        }
        session()->flash('success','Updated successfully!');
    }

    public function finalized($budget_plan_id,$value){
        BudgetApproved::where('budget_plan_id', $budget_plan_id)->update([
            'is_finalized' => $value,
        ]);
        session()->flash('success',\Settings::trans('Finalized Successfully!','عملیه په بریالیتوب ترسره شوه.','با موفقیت انجام شد.'));
        // return redirect()->back();
    }

    public function is_finalized(){
        if(isset($this->get_approveds()[0])){
            return $this->get_approveds()[0]->is_finalized;
        }
    }

    public function render()
    {
        return view('livewire.backend.finance.budget.plan.approved.update')
        ->layout('backend.livewire-layout.base');
    }
}
