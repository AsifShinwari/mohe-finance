<div>
     <x-backend.shared.page-nav>
          <x-slot:title>
               {{ Settings::trans('Create User','نوی کاروونکی اضافه کړئ','کاربر نو اضافه کنید') }}
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item"><a wire:navigate href="{{ route('admin.user.index') }}">{{ __('leftbar.users') }}</a></li>
          <li class="breadcrumb-item active">{{ Settings::trans('Create User','نوی کاروونکی اضافه کړئ','کاربر نو اضافه کنید') }}</li>
     </x-backend.shared.page-nav>
     <x-backend.shared.page-container>
          
               <div class="row m-0 p-0">

                    <x-input 
                         name="name" 
                         id="name" label="{{ Settings::trans('Name (English)','نوم (انګلیسي)','اسم (انګلیسي)') }}"
                         placeholder="{{ Settings::trans('Name (English)','نوم (انګلیسي)','اسم (انګلیسي)') }}"
                         wire:model="name" 
                         type="text" 
                         col="col-sm-3" /> 

                    <x-input 
                         name="pa_name" 
                         id="pa_name" label="{{ Settings::trans('Name (Pashto)','نوم (پښتو)','اسم (پشتو)') }}"
                         placeholder="{{ Settings::trans('Name (Pashto)','نوم (پښتو)','اسم (پشتو)') }}"
                         wire:model="pa_name" 
                         type="text" 
                         col="col-sm-3" /> 

                    <x-input 
                         name="email" 
                         id="email" label="{{ Settings::trans('Email','ایمیل','ایمیل') }}"
                         wire:model="email" 
                         placeholder="{{ Settings::trans('Email','ایمیل','ایمیل') }}"
                         type="email" 
                         col="col-sm-3" 
                         autocomplete="new-email" /> 

                         <x-input 
                         name="image" 
                         id="image" 
                         label="{{ Settings::trans('Image','انځور','عکس') }}"
                         wire:model="image" 
                         type="file" 
                         col="col-sm-3" /> 

                    <x-select
                         wire:model="departement_id"
                         col="col-sm-3"
                         :list="$this->departements()" 
                         value="id" 
                         text="{{Settings::trans('name','pa_name','da_name')}}" 
                         default="{{ Settings::trans('--Select Department--','--ډیپارټمنټ انتخاب کړئ--','--انتخاب دیپارتمنت--') }}" 
                         name="departement_id" 
                         id="departement_id"
                         label="{{ Settings::trans('Departments','ډیپارټمنټونه','دیپارتمنت ها') }}" />

                    <x-input 
                         name="password" 
                         id="password" label="{{ Settings::trans('Password','پاسورډ','پاسورډ') }}"
                         placeholder="{{ Settings::trans('Password','پاسورډ','پاسورډ') }}"
                         wire:model="password" 
                         type="password" 
                         col="col-sm-3"
                         autocomplete="new-password" /> 
                    
                    <x-input 
                         name="password_confirmation" 
                         id="password_confirmation" 
                         label="{{ Settings::trans('Confirm Password','پاسورد مطمن کړئ','مطمن نمودن پاسورد') }}"
                         placeholder="{{ Settings::trans('Confirm Password','پاسورد مطمن کړئ','مطمن نمودن پاسورد') }}"
                         wire:model="password_confirmation" 
                         type="password" 
                         col="col-sm-3"
                         autocomplete="new-password" /> 

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
