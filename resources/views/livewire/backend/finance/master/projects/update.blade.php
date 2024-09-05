<div>
     <x-backend.shared.page-nav>
          <x-slot:title>
               {{ Settings::trans('Update Project','د پروژی تصحیح','تصحیح پروژه') }}
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item"><a wire:navigate href="{{ route('finance.master.project.index') }}">{{ __('leftbar.code_programs') }}</a></li>
          <li class="breadcrumb-item active">{{ Settings::trans('Update Project','د پروژی تصحیح','تصحیح پروژه') }}</li>
     </x-backend.shared.page-nav>
     <x-backend.shared.page-container>
          
               <div class="row m-0 p-0">
                    
                    <x-input 
                         name="code" 
                         id="code" label="{{ Settings::trans('Project Code','د پروژی کوډ','کود پروژه') }}"
                         placeholder="{{ Settings::trans('Project Code','د پروژی کوډ','کود پروژه') }}"
                         wire:model="code" 
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
