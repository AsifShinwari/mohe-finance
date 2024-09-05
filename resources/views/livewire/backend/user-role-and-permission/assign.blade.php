<div>
     <x-backend.shared.page-nav>
          <x-slot:title>
               Create User
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
          <li class="breadcrumb-item"><a wire:navigate href="{{ route('admin.user.index') }}">Users</a></li>
          <li class="breadcrumb-item active">Create User</li>
     </x-backend.shared.page-nav>
     <x-backend.shared.page-container>
          
               <div class="row m-0 p-0">

                    <x-input 
                         name="name" 
                         readonly
                         id="name" label="Name"
                         wire:model="name" 
                         type="text" 
                         col="col-sm-3" /> 

                    <x-select 
                         wire:model="role_id"
                         multiple
                         col="col-sm-3"
                         :list="$this->roles" 
                         value="name" 
                         text="name" 
                         default="--Select Role--" 
                         name="role_id" 
                         id="role_id"
                         label="Role" />
                    

                        <table class="table table-sm table-stripped">
                            <thead>
                                <th>Role Name</th>
                            </thead>
                            <tbody>
                                @foreach($this->user_roles as $item)
                                    <tr>
                                        <td>{{ $item->name }}</td>
                                        <td>
                                            @foreach($this->get_role_permissions($item->id) as $permission)
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" id="per_{{ $permission->id }}"
                                                     wire:click="toggle_permission({{$item->id}},'{{$permission->name}}')" @if($this->user->hasDirectPermission($permission->name)) checked @endif>
                                                    <label class="form-check-label" for="per_{{ $permission->id }}">{{ $permission->name }}</label>
                                                </div>
                                            @endforeach
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>

                        <div class="bg-light col-sm-12 p-3 d-flex justify-content-between">
                            <x-btn-back wire:navigate route="admin.user.index" />
                            <x-btn-update wire:click="assign_roles()">
                                Assign Role
                                <x-loader wire:loading></x-loader>
                            </x-btn-update>
                        </div>
               </div>
     </x-backend.shared.page-container>
     
</div>
