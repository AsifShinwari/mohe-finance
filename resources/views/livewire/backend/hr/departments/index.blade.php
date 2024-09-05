<div>
    <x-backend.shared.page-nav>
          <x-slot:title>
               
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item active">{{ Settings::trans('Departements','ډیپارټمنټونه','دیپارتمنت ها') }}</li>
     </x-backend.shared.page-nav>

    <x-backend.shared.page-container>

    <div class="d-flex">
        <h3>{{ Settings::trans('Departements','ډیپارټمنټونه','دیپارتمنت ها') }}</h3>
       
    </div>
    @include('livewire.backend.hr.departments.inc_index_department', ['departments' => $this->departments])


    </x-backend.shared.page-container>
</div>