<div>
     <x-backend.shared.page-nav>
          <x-slot:title>
              {{ Settings::trans('Update Department Info','د ډیپارټمنټ معلومات اصلاح کول','اصلاح نمودن معلومات دیپارتمنت') }}
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item"><a wire:navigate href="{{ route('admin.hr.dep.index') }}">{{ __('leftbar.departments') }}</a></li>
          <li class="breadcrumb-item active">{{ Settings::trans('Update Department Info','د ډیپارټمنټ معلومات اصلاح کول','اصلاح نمودن معلومات دیپارتمنت') }}</li>
     </x-backend.shared.page-nav>
     <x-backend.shared.page-container>
        <div class="row">
            <x-input col="col-sm-4" wire:model="name" label="{{ Settings::trans('Department Name (English)','د ډیپارټمنټ نوم (انګلیسي)','اسم دیپارتمنت (انګلیسی)') }}" placeholder="{{ Settings::trans('Department Name (English)','د ډیپارټمنټ نوم (انګلیسي)','اسم دیپارتمنت (انګلیسی)') }}" />
            <x-input col="col-sm-4" wire:model="pa_name" label="{{ Settings::trans('Department Name (Pashto)','د ډیپارټمنټ نوم (پښتو)','اسم دیپارتمنت (پشتو)') }}" placeholder="{{ Settings::trans('Department Name (Pashto)','د ډیپارټمنټ نوم (پښتو)','اسم دیپارتمنت (پشتو)') }}" />
            <x-input col="col-sm-4" wire:model="da_name" label="{{ Settings::trans('Department Name (Dari)','د ډیپارټمنټ نوم (انګلیسي)','اسم دیپارتمنت (دری)') }}" placeholder="{{ Settings::trans('Department Name (Dari)','د ډیپارټمنټ نوم (دری)','اسم دیپارتمنت (دری)') }}" />
        </div>

        <div class="bg-light p-3 d-flex justify-content-between">
            <x-btn-back wire:navigate route="admin.hr.dep.index" />
            <x-btn-update wire:click="update()">
                {{ Settings::trans('Update','ثبت','ثبت') }}
                <x-loader wire:loading></x-loader>
            </x-btn-update>
        </div>
        
     </x-backend.shared.page-container>
</div>
