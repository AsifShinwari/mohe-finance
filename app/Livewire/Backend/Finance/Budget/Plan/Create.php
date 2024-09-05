<?php

namespace App\Livewire\Backend\Finance\Budget\Plan;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\BudgetPlan;

class Create extends Component
{

    public $year; 

    public function store(){
        $this->validate([
            'year'=>'required|unique:finance.budget_plans',
        ],[
            'year.required'=>\Settings::trans('Year Field is Required','د کال فیلد باید خالی نه وي','فیلد سال باید خالي نباشد'),
            'year.unique'=>\Settings::trans('The year has already been taken','نوموړی پلان شتون لري، دویم ځل لپاره نه اضافه کیږي','این سال یک دفه موجود میباشد، شما دوباره انتری کرده نمیتوانید'),
        ]);

        BudgetPlan::create([
            'year'=>$this->year,
            'user_id'=>auth()->user()->id
        ]);

        session()->flash('success',\Settings::trans('Budget Plan Added Successfully!','نوی وجه اضافه شوه','وجه جدید اضافه ګردید'));
        $this->reset();
    }

    public function render()
    {
        return view('livewire.backend.finance.budget.plan.create')
        ->layout('backend.livewire-layout.base');
    }
}
