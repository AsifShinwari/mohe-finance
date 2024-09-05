<div>
     <x-backend.shared.page-nav>
          <x-slot:title>
               Assign Permission To Rule
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
          <li class="breadcrumb-item"><a wire:navigate href="{{ route('admin.permission.index') }}">Permissions</a></li>
          <li class="breadcrumb-item active">Assign Permission</li>
     </x-backend.shared.page-nav>
     <x-backend.shared.page-container>
          
               <div class="row m-0 p-0">
                    
                    <x-select 
                         wire:model.live="role_id"
                         col="col-sm-3"
                         :list="$this->roles()" 
                         value="id" 
                         text="name" 
                         readonly
                         disabled
                         default="--Select Role--" 
                         name="role_id" 
                         id="role_id"
                         label="Role" />

                    <x-select 
                         wire:model="permission_id"
                         multiple
                         col="col-sm-3"
                         :list="$this->permissions()" 
                         value="name" 
                         text="name" 
                         default="--Select Permissions--" 
                         name="permission_id" 
                         id="permission_id"
                         label="Permission" />

                    <div class="bg-light p-3 d-flex justify-content-between col-sm-12">
                        <x-btn-back wire:navigate route="admin.roles.index" />
                        <x-btn-update wire:click="assign_permission_to_role()">
                            Assign
                            <x-loader wire:loading></x-loader>
                        </x-btn-update>
                    </div>
               </div>
     </x-backend.shared.page-container>
     
</div>
