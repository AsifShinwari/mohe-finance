<div>
     <x-backend.shared.page-nav>
          <x-slot:title>
               {{ Settings::trans('Add New Organization','نوی واحد اضافه کړئ','واحد جدید اضافه کنید') }}
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item"><a wire:navigate href="{{ route('finance.master.orgs.index') }}">{{ __('leftbar.code_orgs') }}</a></li>
          <li class="breadcrumb-item active">{{ Settings::trans('Add New Organization','نوی واحد اضافه کړئ','واحد جدید اضافه کنید') }}</li>
     </x-backend.shared.page-nav>
     <x-backend.shared.page-container>
          
               <div class="row m-0 p-0">
                    
                    <x-select
                         wire:model="ministry_code"
                         col="col-sm-3"
                         :list="$this->ministry_codes()" 
                         value="ministry_code" 
                         text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}" 
                         text="ministry_code" 
                         default="{{ Settings::trans('--Select Ministry--','--د وزارت انتخاب کړئ--','--انتخاب وزارت--') }}" 
                         name="ministry_code" 
                         id="ministry_code"
                         label="{{ Settings::trans('Ministry Code','وزارت','وزارت') }}" />
                    
                    <x-select
                         wire:model="sub_org_code"
                         col="col-sm-3"
                         :list="$this->sub_org_codes()" 
                         value="sub_org_code" 
                         text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}" 
                         text="sub_org_code" 
                         default="{{ Settings::trans('--Select Sub-Org--','--فرعی واحد انتخاب کړئ--','--انتخاب واحد فرعی--') }}" 
                         name="sub_org_code" 
                         id="sub_org_code"
                         label="{{ Settings::trans('Sub-Org','فرعی واحد','واحد فرعی') }}" />

                    <x-input 
                         name="unit_code" 
                         id="unit_code" label="{{ Settings::trans('Unit','واحد','واحد') }}"
                         placeholder="{{ Settings::trans('Unit','واحد','واحد') }}"
                         wire:model="unit_code" 
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
