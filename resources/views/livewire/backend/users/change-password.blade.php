<div>
     <x-backend.shared.page-nav>
          <x-slot:title>
               Profile
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
          <li class="breadcrumb-item active">User Profile</li>
     </x-backend.shared.page-nav>
     <x-backend.shared.page-container>
                <div class="row m-0 p-0">

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
                         type="text" 
                         col="col-sm-3" disabled /> 

                    <x-input 
                         name="email" 
                         id="email" label="Email"
                         wire:model="email" 
                         disabled
                         type="email" 
                         col="col-sm-3" 
                         autocomplete="new-email" /> 

                    <x-input 
                         name="password" 
                         id="password" label="New Password"
                         wire:model="password" 
                         type="password" 
                         col="col-sm-3"
                         autocomplete="new-password" /> 

                    <div class="card-footer col-sm-12">
                         <button class="btn btn-primary" wire:click="update()"><i class="fa fa-save"></i> Update Profile</button>
                         @include('backend.livewire-layout.inc_loader', ['color'=>'primary'])
                    </div>
                </div>
     </x-backend.shared.page-container>
</div>
