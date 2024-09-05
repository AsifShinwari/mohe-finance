<div>
     <x-backend.shared.page-nav>
          <x-slot:title>
               {{ Settings::trans('Add New Fund','نوی وجه اضافه کړئ','وجه جدید اضافه کنید') }}
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item"><a wire:navigate href="{{ route('finance.master.funds.index') }}">{{ __('leftbar.funds') }}</a></li>
          <li class="breadcrumb-item active">{{ Settings::trans('Add New Fund','نوی وجه اضافه کړئ','وجه جدید اضافه کنید') }}</li>
     </x-backend.shared.page-nav>
     <x-backend.shared.page-container>
          
               <div class="row m-0 p-0">
                    
                    <x-select
                         wire:model="fund_type_code"
                         col="col-sm-3"
                         :list="$this->fund_type_codes()" 
                         value="fund_type_code" 
                         text="{{Settings::trans('en_desc','pa_desc','da_desc')}}" 
                         default="{{ Settings::trans('--Select Fund--','--د وجه نوعیت انتخاب کړئ--','--انتخاب نوع وجه--') }}" 
                         name="fund_type_code" 
                         id="fund_type_code"
                         label="{{ Settings::trans('Fund Type','د وجه نوعیت','نوعیت وجه') }}" />
                    
                    <x-select
                         wire:model="fund_code"
                         col="col-sm-3"
                         :list="$this->fund_codes()" 
                         value="fund_code" 
                         text="{{Settings::trans('en_desc','pa_desc','da_desc')}}" 
                         default="{{ Settings::trans('--Select Fund--','--وجه انتخاب کړئ--','--انتخاب وجه--') }}" 
                         name="fund_code" 
                         id="fund_code"
                         label="{{ Settings::trans('Fund','د وجه','وجه') }}" />

                    <x-select
                         wire:model="sub_fund_code"
                         col="col-sm-3"
                         :list="$this->sub_fund_codes()" 
                         value="sub_fund_code" 
                         text="{{Settings::trans('en_desc','pa_desc','da_desc')}}" 
                         default="{{ Settings::trans('--Select Sub-Fund--','--فرعی وجه انتخاب کړئ--','--انتخاب وجه فرعی--') }}" 
                         name="sub_fund_code" 
                         id="sub_fund_code"
                         label="{{ Settings::trans('Sub-Fund','فرعی وجه','وجه فرعی') }}" />

                    <x-input 
                         name="new_code" 
                         id="new_code" label="{{ Settings::trans('Fund Component','د وجهی اجزا','اجزا وجه') }}"
                         placeholder="{{ Settings::trans('Fund Component','د وجهی اجزا','اجزا وجه') }}"
                         wire:model="new_code" 
                         type="number" 
                         col="col-sm-3" /> 

                    <x-input 
                         name="en_desc" 
                         id="en_desc" label="{{ Settings::trans('Description (Eng)','انګلیسی تشریح','تشریح انګلیسی') }}"
                         placeholder="{{ Settings::trans('Description (Eng)','انګلیسی تشریح','تشریح انګلیسی') }}"
                         wire:model="en_desc" 
                         type="text" 
                         col="col-sm-12" /> 

                    <x-input 
                         name="pa_desc" 
                         id="pa_desc" label="{{ Settings::trans('Description (Pashto)','پښتو تشریح','تشریح پشتو') }}"
                         placeholder="{{ Settings::trans('Description (Pashto)','پښتو تشریح','تشریح پشتو') }}"
                         wire:model="pa_desc" 
                         type="text" 
                         col="col-sm-12" /> 

                    <x-input 
                         name="da_desc" 
                         id="da_desc" label="{{ Settings::trans('Description (Dari)','دری تشریح','تشریح دری') }}"
                         placeholder="{{ Settings::trans('Description (Dari)','دری تشریح','تشریح دری') }}"
                         wire:model="da_desc" 
                         type="text" 
                         col="col-sm-12" /> 


                    <div class="card-footer col-sm-12">
                         <button class="btn btn-primary" wire:loading.attr="disabled" wire:click="store()">
                              <i class="fa fa-save"></i> 
                              {{ Settings::trans('Save','ثبت','ثبت') }}
                         </button>
                         
                         <x-loader wire:loading />

                    </div>
               </div>
     </x-backend.shared.page-container>
     
</div>
