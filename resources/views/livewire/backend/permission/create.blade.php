<div>
     <x-backend.shared.page-nav> 
          <x-slot:title>
               Create Permission
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
          <li class="breadcrumb-item"><a wire:navigate href="{{ route('admin.permission.index') }}">Permissions</a></li>
          <li class="breadcrumb-item active">Create Permission</li>
     </x-backend.shared.page-nav>
     <x-backend.shared.page-container>
          
               <div class="row m-0 p-0">

                    <x-input 
                         name="name" 
                         id="name" label="Permission Name (English)"
                         wire:model="name" 
                         type="text" 
                         col="col-sm-3" /> 

                    <div class="bg-light p-3 d-flex justify-content-between col-sm-12">
                        <x-btn-back wire:navigate route="admin.permission.index" />
                        <x-btn-update wire:click="store()">
                            Save
                            <x-loader wire:loading></x-loader>
                        </x-btn-update>
                    </div>
               </div>
     </x-backend.shared.page-container>
     
</div>
