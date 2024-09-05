<div>
     <x-backend.shared.page-nav>
          <x-slot:title>
               {{ Settings::trans('Add New Program','پروګرام اضافه کړئ','پروګرام اضافه کنید') }}
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item"><a wire:navigate href="{{ route('finance.master.orgs.index') }}">{{ __('leftbar.code_programs') }}</a></li>
          <li class="breadcrumb-item active">{{ Settings::trans('Add New Program','پروګرام اضافه کړئ','پروګرام اضافه کنید') }}</li>
     </x-backend.shared.page-nav>
     <x-backend.shared.page-container>
          
               <div class="row m-0 p-0">
                    
                    <x-select
                         wire:model="program_code"
                         col="col-sm-3"
                         :list="$this->program_codes()" 
                         value="program_code" 
                         text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}" 
                         text="program_code" 
                         default="{{ Settings::trans('--Select Program--','-- برنامه انتخاب کړئ--','--انتخاب برنامه--') }}" 
                         name="program_code" 
                         id="program_code"
                         label="{{ Settings::trans('Program Code','برنامه','برنامه') }}" />
                    
                    <x-select
                         wire:model="sub_program_code"
                         col="col-sm-3"
                         :list="$this->sub_program_codes()" 
                         value="sub_program_code" 
                         text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}" 
                         text="sub_program_code" 
                         default="{{ Settings::trans('--Select Sub-Program--','--فرعی برنامه انتخاب کړئ--','--انتخاب برنامه فرعی--') }}" 
                         name="sub_program_code" 
                         id="sub_program_code"
                         label="{{ Settings::trans('Sub-Program','فرعی برنامه','برنامه فرعی') }}" />

                    <x-input 
                         name="new_code" 
                         id="new_code" label="{{ Settings::trans('Activity Code','د فعالیت کود','کود فعالیت') }}"
                         placeholder="{{ Settings::trans('Activity Code','د فعالیت کود','کود فعالیت') }}"
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
