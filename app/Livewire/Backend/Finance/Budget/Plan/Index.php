<?php

namespace App\Livewire\Backend\Finance\Budget\Plan;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\BudgetPlan;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;

    public $search; 

    #[Computed]
    public function plans(){
        return BudgetPlan::get_list($this->search)->paginate(10);
    }

    public function delete($id){
        BudgetPlan::where('id',$id)->update([
            'is_deleted' => true,
        ]);
        session()->flash('success',\Settings::trans('Successfully deleted','چاره په بریالیتوب ترسره شوه','عملیه انجام شد'));
    }

    public function mark_as_complete($id){
        
        $plan = BudgetPlan::where('id',$id)->first();

        BudgetPlan::where('id',$id)->update([
            'is_completed' => !$plan->is_completed,
        ]);

        session()->flash('success',\Settings::trans('Status Changed Successfully!','چاره په بریالیتوب ترسره شوه.','عملیه به کامیابی انجام شد.'));
    }

    public function render()
    {
        return view('livewire.backend.finance.budget.plan.index')
        ->layout('backend.livewire-layout.base');
    }
}
