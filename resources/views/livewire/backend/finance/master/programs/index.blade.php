<div>
    <x-backend.shared.page-nav>
          <x-slot:title>
               {{ __('leftbar.code_programs') }}
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item active">{{ __('leftbar.code_programs') }}</li>
     </x-backend.shared.page-nav>

    <x-backend.shared.page-container>
        <x-backend.shared.table>

            <x-slot:tools>
                <div>
                    @hasDirectPermission('Programs - Create')
                    <a wire:navigate href="{{ route('finance.master.program.create') }}" class="btn btn-primary">
                        <i class="fa fa-plus"></i><span class="d-none d-sm-inline-block">&nbsp;{{ __('leftbar.add') }}</span></a>
                    @endhasDirectPermission
                </div>
                <div>
                    <div class="input-group w-100 ml-1">
                        <input wire:model.live.debounce.500ms="search" 
                        type="text" name="search" class="form-control float-right"
                         placeholder="{{ Settings::trans('Search','لټون','جستجو') }}">
                        <div class="input-group-append">
                            <button type="button" class="btn btn-default border">
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
                <th>{{ __('master.fund.no') }}</th>
                <th>{{ __('master.program.code') }}</th>
                <th>{{ __('master.program.sub_code') }}</th>
                <th>{{ __('master.program.activity') }}</th>
                <th>{{ __('master.org.desc') }}</th>
                <th>{{ __('master.fund.username') }}</th>
                <th class="text-center">{{ __('master.fund.actions') }}</th>
            </thead>
            <tbody>
                @foreach($this->programs as $obj)
                    <tr class="">
                        <td>{{ $loop->index+1 }}</td>
                        <td>{{ $obj->program_code }}</td>
                        <td>{{ $obj->sub_program_code }}</td>
                        <td>{{ $obj->activity_code }}</td>
                        <td>{{ Settings::trans($obj->en_desc,$obj->pa_desc,$obj->da_desc) }}</td>
                        <td>{{ Settings::trans($obj->username,$obj->pa_username,$obj->pa_username) }}</td>
                        <td class="d-flex justify-content-start">

                            @hasDirectPermission('Programs - Update')
                                <a wire:navigate href="{{ route('finance.master.program.edit',$obj->id) }}" class="btn btn-info btn-sm ml-1"><i class="fa fa-edit text-white"></i> </a>
                            @endhasDirectPermission

                            @hasDirectPermission('Programs - Delete')
                                <button wire:confirm="Are you sure to delete this record?" wire:click="delete({{ $obj->id }})" class="btn btn-danger btn-sm ml-1"><i class="fa fa-trash text-white"></i> </button>
                            @endhasDirectPermission
                        </td>
                    </tr>
                @endforeach
            </tbody>

            <x-slot:links>
                @if($this->programs->lastPage() > 0)
                    <tfoot>
                        <th colspan="8">
                        {{ $this->programs->links() }}
                        </th>
                    </tfoot>
                @endif
            </x-slot>
            

        </x-backend.shared.table> 

    </x-backend.shared.page-container>
</div>
