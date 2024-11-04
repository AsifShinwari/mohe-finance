<div>
     <x-backend.shared.page-nav>
          <x-slot:title>
               Edit User
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
          <li class="breadcrumb-item"><a wire:navigate href="{{ route('admin.user.index') }}">Users</a></li>
          <li class="breadcrumb-item active">Edit User</li>
     </x-backend.shared.page-nav>
     <x-backend.shared.page-container>
                <div class="row m-0 p-4">

                    <div class="col-sm-3">
                         <label class="mb-0" style="display:block;">User Image</label>
                         @if($image)
                             <img src="{{ $image->temporaryUrl() }}" class="img-fluid img-thumbnail w-50 bg-light" />
                         @elseif($old_image)
                             <img src="{{ asset($old_image) }}" class="img-fluid img-thumbnail w-50 bg-light" />
                         @endif
                    
                         <x-input 
                             name="image"  
                             id="image" 
                             wire:model="image" 
                             type="file" 
                             col="w-50 mt-1"
                             accept="image/png, image/jpeg, image/webp" /> 
                    </div>
                    <div class="col-sm-9"></div>
                    <hr class="col-sm-12"> 

                    <x-input 
                         name="name" 
                         id="name" label="Name (English)"
                         wire:model="name" 
                         type="text" 
                         col="col-sm-3" /> 

                    <x-input 
                         name="pa_name" 
                         id="pa_name" label="Name (Pashto)"
                         wire:model="pa_name" 
                         type="text" 
                         col="col-sm-3" /> 

                    <x-input 
                         name="email" 
                         id="email" label="Email"
                         wire:model="email" 
                         type="email" 
                         col="col-sm-3" 
                         autocomplete="new-email" /> 

                    <x-select 
                         wire:model.live="departement_id"
                         col="col-sm-3"
                         :list="$this->departements()" 
                         value="id" 
                         text="{{Settings::trans('name','pa_name','da_name')}}" 
                         default="--Select Departement--" 
                         name="departement_id" 
                         id="departement_id"
                         label="Departements" />

                    <x-input 
                         name="password" 
                         id="password" label="New Password"
                         wire:model="password" 
                         type="password" 
                         col="col-sm-3"
                         autocomplete="new-password" /> 

                    <div class="card-footer col-sm-12">
                         <button class="btn btn-primary" wire:click="update()"><i class="fa fa-save"></i> Update</button>
                         @include('backend.livewire-layout.inc_loader', ['color'=>'primary'])
                    </div>
                </div>
     </x-backend.shared.page-container>
</div>
