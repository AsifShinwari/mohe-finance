<div>
     <x-backend.shared.page-nav>
          <x-slot:title>
               {{ Settings::trans('Approved Budget For The Year','منظور شوی بودیجه','بودیجه منظور شده') }}
               {{ substr(Settings::change_to_hijri($this->get_budget_plan->year),0,4) }}
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item"><a wire:navigate href="{{ route('finance.budget.plan.index') }}">{{ __('leftbar.budget_plan') }}</a></li>
          <li class="breadcrumb-item active">{{ Settings::trans('Approved Budget For The Year','منظور شوی بودیجه','بودیجه منظور شده') }}
          {{ substr(Settings::change_to_hijri($this->get_budget_plan->year),0,4) }}</li>
     </x-backend.shared.page-nav>
     <x-backend.shared.page-container>
               <form wire:submit.prevent="update(Object.fromEntries(new FormData($event.target)))" id="update_codes_data">
               <div class="row m-0 p-0">
                    @foreach($this->get_approveds as $approved)
                         <x-input 
                              name="code{{ $approved->id }}" 
                              id="code" label="{{ Settings::trans('Major Code (2)','باب','باب') }}"
                              placeholder="{{ Settings::trans('Major Code (2)','باب','باب') }}"
                              value="{{ $approved->code_object_2 }}"
                              type="number" 
                              disabled="1"
                              col="col-sm-2" /> 
                         <x-input 
                              name="amount{{ $approved->id }}" 
                              id="amount" label="{{ Settings::trans('Amount (AFN)','اندازه (افغانی)','مقدار (افغانی)') }}"
                              placeholder="{{ Settings::trans('Amount (AFN)','اندازه (افغانی)','مقدار (افغانی)') }}"
                              value="{{ $approved->amount }}"
                              type="number" 
                              col="col-sm-3" /> 
                         <x-input 
                              name="remarks{{ $approved->id }}" 
                              id="remarks" label="{{ Settings::trans('Remarks','ملاحظات','ملاحظات') }}"
                              placeholder="{{ Settings::trans('Remarks','ملاحظات','ملاحظات') }}"
                              value="{{ $approved->remarks }}"
                              type="text" 
                              col="col-sm-7" /> 
                    @endforeach
                    
                    <div class="border-top p-2 w-100 d-flex justify-content-between">
                         <button class="btn btn-primary" wire:loading.attr="disabled" type="submit">
                              <i class="fa fa-save"></i> 
                              {{ Settings::trans('Save','ثبت','ثبت') }}
                         </button>
                         
                         <a class="btn btn-secondary" href="{{ route('finance.budget.plan.index') }}">
                              {{ Settings::trans('Budget List','لیست بودیجه','د بودیجی لیست') }}
                              <i class="fa fa-arrow-left"></i> 
                         </a>
                         
                    </div>
                    </form>
               </div>
     </x-backend.shared.page-container>
</div>