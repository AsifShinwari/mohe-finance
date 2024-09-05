<div>
    <x-backend.shared.page-nav>
          <x-slot:title>
               Permissions 
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item active">Permissions</li>
     </x-backend.shared.page-nav>

    <x-backend.shared.page-container>
        <x-backend.shared.table>

            <x-slot:tools>
                <div>
                    @hasDirectPermission('Users Permission - Can Add')
                    <a wire:navigate href="{{ route('admin.permission.create') }}" class="btn btn-primary">
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
                    <th>Permission Name</th>
                    <th class="text-center">{{ __('users.actions') }}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($this->permissions as $permission)
                    <tr>
                        <td>{{ $loop->index+1 }}</td>
                        <td>{{ $permission->name }}</td>
                        <td>
                            @hasDirectPermission('Users Permission - Can Edit')
                                <x-btn-edit wire:navigate route="admin.permission.edit" :param="$permission->id" />
                            @endhasDirectPermission

                            @hasDirectPermission('Users Permission - Can Delete')
                                <x-btn-delete wire:confirm="Are You Sure To Delete This Record?" wire:click="delete({{ $permission->id }})" />
                            @endhasDirectPermission

                        </td>
                    </tr>
                @endforeach
            </tbody>

            <x-slot:links>
                <tbody>
                    <tr>
                        <td colspan="3">
                            {{ $this->permissions->links() }}
                        </td>
                    </tr>
                </tbody>
            </x-slot>

        </x-backend.shared.table>

    </x-backend.shared.page-container>
</div>
