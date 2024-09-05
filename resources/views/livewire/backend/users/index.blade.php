<div>
    <x-backend.shared.page-nav>
          <x-slot:title>
               {{ __('users.users_list') }}
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item active">{{ __('leftbar.users') }}</li>
     </x-backend.shared.page-nav>

    <x-backend.shared.page-container>
        <x-backend.shared.table>

            <x-slot:tools>
                <div>
                    @hasDirectPermission('Users - Can Add')
                        <a wire:navigate href="{{ route('admin.user.create') }}" class="btn btn-primary">
                            <i class="fa fa-plus"></i><span class="d-none d-sm-inline-block">&nbsp;{{ __('leftbar.add') }}</span></a>
                    @endhasDirectPermission
                </div>
                <div>
                    <div class="input-group w-100 ml-1">
                        <input wire:model.live.debounce.500ms="search" 
                        type="text" name="search" class="form-control float-right"
                         placeholder="Search">
                        <div class="input-group-append">
                            <button type="button" class="btn btn-default">
                                <i wire:loading.remove class="fas fa-search"></i>
                                <div wire:loading class="spinner-border spinner-border-sm text-secondary" role="status">
                                  <span class="sr-only">Loading...</span>
                                </div>
                            </button>
                        </div>
                    </div>
                </div>
            </x-slot>

            <thead>
                    <th>{{ __('users.no') }}</th>
                    <th>{{ __('users.name') }}</th>
                    <th>{{ __('users.email') }}</th>
                    <th>{{ __('users.department') }}</th>
                    <th>{{ __('users.modules') }}</th>
                    <th>{{ __('users.image') }}</th>
                    <th class="text-center">{{ __('users.actions') }}</th>
            </thead>
            <tbody>
                @foreach($this->users as $user)
                    <tr>
                        <td>{{ $loop->index+1 }}</td>
                        <td>{{ Settings::trans($user->name,$user->pa_name,$user->pa_name) }}</td>
                        <td>{{ $user->email }}</td>
                        <td>{{ Settings::trans($user->dep_name,$user->dep_pa_name,$user->dep_da_name) }}</td>
                        <td>
                            @php $roles = $user->roles()->get(); @endphp
                            @foreach($roles as $key=>$role)
                                <span class="badge badge-info">{{ $role->name }}</span>
                            @endforeach
                        </td>
                        <td>
                            <img src="{{ asset($user->image) }}" class="img-fluid img-thumbnail" style="max-width:30px; max-height:30px;" alt="User-Image">
                        </td>
                        <td class="d-flex justify-content-start">
                            
                            @hasDirectPermission('Users - Can Assign Roles')
                                <a wire:click="lockAccount({{$user->id}})" wire:confirm="{{ (!$user->is_bolcked) ? 'Are You Sure to lock out this account?' : 'Are You Sure To Lock This Account?' }}" href="#" class="btn {{ ($user->is_blocked) ? 'btn-danger' : 'btn-primary' }} btn-sm"><i class="fa fa-lock text-white"></i> </a>
                            @endhasDirectPermission

                            @hasDirectPermission('Users - Can Assign Roles')
                                <a wire:navigate href="{{ route('admin.user.roles.index',$user->id) }}" class="btn btn-primary btn-sm ml-1"><i class="fa fa-cog text-white"></i> </a>
                            @endhasDirectPermission

                            @hasDirectPermission('Users - Can Add')
                                <a wire:navigate href="{{ route('admin.user.edit',$user->id) }}" class="btn btn-info btn-sm ml-1"><i class="fa fa-edit text-white"></i> </a>
                            @endhasDirectPermission

                            @hasDirectPermission('Users - Can Delete')
                                <a wire:navigate href="{{ route('admin.user.delete',$user->id) }}" class="btn btn-danger btn-sm ml-1"><i class="fa fa-trash text-white"></i> </a>
                            @endhasDirectPermission
                        </td>
                    </tr>
                @endforeach
            </tbody>

            <x-slot:links>
                <tfoot>
                    <th colspan="7">
                    {{ $this->users->links() }}
                    </th>
                </tfoot>
            </x-slot>
            

        </x-backend.shared.table> 

    </x-backend.shared.page-container>
</div>
