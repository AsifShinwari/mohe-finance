<div>
     <x-backend.shared.page-nav>
          <x-slot:title>
               {{ Settings::trans('Edit Object','باب تصحیح کړئ','باب تصحیح کنید') }}
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item"><a wire:navigate href="{{ route('finance.master.objects.index') }}">{{ __('leftbar.code_objects') }}</a></li>
          <li class="breadcrumb-item active"> {{ Settings::trans('Edit Object','باب تصحیح کړئ','باب تصحیح کنید') }}</li>
     </x-backend.shared.page-nav>
     <x-backend.shared.page-container>
          
               <div class="row m-0 p-0">
                    
                    <x-select
                         wire:model="category_code"
                         col="col-sm-3"
                         :list="$this->category_codes()" 
                         value="category_code" 
                         text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}" 
                         text="category_code" 
                         default="{{ Settings::trans('--Select Category--','--د کتګوری انتخاب کړئ--','--انتخاب کتګوری--') }}" 
                         name="category_code" 
                         id="category_code"
                         label="{{ Settings::trans('Category','کټګوري','کتګوری') }}" />
                    
                    <x-select
                         wire:model="major_code"
                         col="col-sm-3"
                         :list="$this->major_codes()" 
                         value="major_code" 
                         text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}" 
                         text="major_code" 
                         default="{{ Settings::trans('--Select Major--','--باب انتخاب کړئ--','--انتخاب باب--') }}" 
                         name="major_code" 
                         id="major_code"
                         label="{{ Settings::trans('Major','باب','باب') }}" />

                    <x-select
                         wire:model="minor_code"
                         col="col-sm-3"
                         :list="$this->minor_codes()" 
                         value="minor_code" 
                         text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}" 
                         text="minor_code" 
                         default="{{ Settings::trans('--Select Minor--','--فرعی باب انتخاب کړئ--','--انتخاب باب فرعی--') }}" 
                         name="minor_code" 
                         id="minor_code"
                         label="{{ Settings::trans('Minor','فرعی باب','باب فرعی') }}" />

                    <x-input 
                         name="object_code" 
                         id="object_code" label="{{ Settings::trans('Object','فصل','فصل') }}"
                         placeholder="{{ Settings::trans('Object','فصل','فصل') }}"
                         wire:model="object_code" 
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
