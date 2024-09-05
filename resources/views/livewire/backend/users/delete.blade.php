<div>
     <x-backend.shared.page-nav>
          <x-slot:title>
          {{ __('users.delete_user') }}
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item"><a wire:navigate href="{{ route('admin.user.index') }}">{{ __('leftbar.users') }}</a></li>
          <li class="breadcrumb-item active">{{ __('users.delete_user') }}</li>
     </x-backend.shared.page-nav>
     <div class="row m-0 p-0">
               <div class="col-lg-3 col-md-2 col-sm-1"></div>
               <div class="col-lg-6 col-md-8 col-sm-10">
     <x-backend.shared.page-container>
                       <h3 class="text-danger text-center">
                            <br>
                            <i class="fa fa-trash"></i>
                            <br>
                            <br>{{ __('users.delete_confirm_msg') }}<br><br>
                        </h3>
                       <div class="bg-light p-3 d-flex justify-content-between">
                            <a wire:navigate class="btn btn-secondary" style="color:white!important;" href="{{ route('admin.user.index') }}">
                                <i class="fa fa-arrow-left"></i> {{ __('users.go_back') }}
                            </a>
                            <button wire:click="delete()" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp; {{ __('users.yes_delete') }}</button>
                       </div>
     </x-backend.shared.page-container>
     </div>
               <div class="col-lg-3 col-md-2 col-sm-1"></div>
          </div>
</div>