<div>
    <x-backend.shared.page-nav>
          <x-slot:title>
               Roles
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item active">Roles</li>
     </x-backend.shared.page-nav>

    <x-backend.shared.page-container>
        <x-backend.shared.table>

            <x-slot:tools>
                <div>
                    @hasDirectPermission('Roles - Create')
                    <a wire:navigate href="{{ route('admin.roles.create') }}" class="btn btn-primary">
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
                <tr>
                    <th>{{ __('users.no') }}</th>
                    <th>Role</th>
                    <th class="text-center">{{ __('users.actions') }}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($this->roles as $role)
                    <tr>
                        <td>{{ $loop->index+1 }}</td>
                        <td>{{ $role->name }}</td>
                        <td>
                            @hasDirectPermission('Roles - Can Assign Persmission')
                            <x-btn-edit wire:navigate route="admin.roles.assign" class="btn btn-sm btn-primary" :param="$role->id">Permissions</x-btn-edit>
                            @endhasDirectPermission

                            @hasDirectPermission('Roles - Update')
                                <x-btn-edit wire:navigate route="admin.roles.edit" :param="$role->id" />
                            @endhasDirectPermission

                            @hasDirectPermission('Roles - Delete')
                                <x-btn-delete wire:confirm="Are You Sure To Delete This Record?" wire:click="delete({{ $role->id }})" />
                            @endhasDirectPermission

                        </td>
                    </tr>
                @endforeach
            </tbody>

            <x-slot:links>
                <tfoot>
                    <td colspan="3">
                        @if($this->roles->lastPage() > 1)
                            {{ $this->roles->links() }}
                        @endif
                    </td>
                </tfoot>
                
            </x-slot>

        </x-backend.shared.table>

    </x-backend.shared.page-container>
</div>
