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
               <div class="row m-0 mt-3 p-4">
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
                              :disabled="($approved->is_finalized)"
                              col="col-sm-3" /> 
                         <x-input 
                              name="remarks{{ $approved->id }}" 
                              id="remarks" label="{{ Settings::trans('Remarks','ملاحظات','ملاحظات') }}"
                              placeholder="{{ Settings::trans('Remarks','ملاحظات','ملاحظات') }}"
                              value="{{ $approved->remarks }}"
                              type="text" 
                              :disabled="($approved->is_finalized)"
                              col="col-sm-7" /> 
                    @endforeach
                    
                    <div class="border-top p-2 w-100 d-flex justify-content-between">
                         
                    
                         <div>
                              @hasDirectPermission('Approved Budget (Regular) - Update')
                              @if(!$this->is_finalized())
                                   <button class="btn btn-primary" wire:loading.attr="disabled" type="submit">
                                        <i class="fa fa-save"></i> 
                                        {{ Settings::trans('Save','ثبت','ثبت') }}
                                   </button>
                              @endif
                              @endhasDirectPermission

                              @hasDirectPermission('Approved Budget (Regular) - Finalize')
                              @if(!$this->is_finalized())
                                   <button class="btn btn-info" wire:loading.attr="disabled" wire:click="finalized({{ $approved->budget_plan_id }},1)"
                                   title="{{ Settings::trans('After clicking finalized, you will be not able to change the list.','وروسته له تکمیل کیدو، تاسی نشی کولای چی په بودیجه کی تغیرات راولی','بعد از تکمیل نمودن شما نمیتواند در بودجه تغیر بیاورید.') }}" 
                                   type="button">
                                        <i class="fas fa-lock-open"></i>
                                        {{ Settings::trans('Finalize','تکمیل کړئ','مکمل کنید') }}
                                   </button>
                              @else
                                   <button class="btn btn-success" wire:loading.attr="disabled" wire:click="finalized({{ $approved->budget_plan_id }},0)"
                                   title="{{ Settings::trans('','','') }}" 
                                   type="button">
                                        <i class="fas fa-lock"></i>
                                        {{ Settings::trans('Finalized','تکمیل شوی','مکمل شده') }}
                                   </button>
                              @endif
                              @endhasDirectPermission
                         </div>                         
                         {{--<a class="btn btn-secondary" href="{{ route('finance.budget.plan.index') }}">
                              {{ Settings::trans('Budget Settings','تنظیمات بودیجه','د بودیجی تنظیمات') }}
                              <i class="fa fa-arrow-left"></i> 
                         </a>--}}
                    </div>
                    </form>
               </div>
     </x-backend.shared.page-container>
</div>