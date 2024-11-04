<div>
    <x-backend.shared.page-nav>
          <x-slot:title>
               {{ __('leftbar.budget_plan') }}
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item active">{{ __('leftbar.budget_plan') }}</li>
     </x-backend.shared.page-nav>

    <x-backend.shared.page-container>
        <x-backend.shared.table >

            <x-slot:tools>
                <div>
                    @hasDirectPermission('Budget Plan - Create')
                    <a wire:navigate href="{{ route('finance.budget.plan.create') }}" class="btn btn-primary">
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
                <th>{{ __('master.org.desc') }}</th>
                <th>{{ __('master.fund.username') }}</th>
                <th class="text-center">{{ __('master.fund.actions') }}</th>
            </thead>
            <tbody>
                @foreach($this->plans as $obj)
                    <tr class="">
                        <td>{{ $loop->index+1 }}</td>
                        <td>{{ substr(Settings::change_to_hijri($obj->year),0,4) }}</td>
                        <td>{{ Settings::trans($obj->username,$obj->pa_username,$obj->pa_username) }}</td>
                        <td class="d-flex justify-content-center">

                            @hasDirectPermission('Budget Plan - Can Complete')
                                @if($obj->is_completed)
                                    <button wire:click="mark_as_complete({{ $obj->id }})" wire:confirm="Are You Sure To Mark This as Uncomplete?" class="btn btn-success btn-sm">{{ Settings::trans('Completed','تکمیل شوی','تکمیل شده') }}</button>
                                @else
                                    <button wire:click="mark_as_complete({{ $obj->id }})" wire:confirm="Are You Sure To Mark This as Complete?" class="btn btn-warning btn-sm">{{ Settings::trans('Incompleted','نا تکمیل','تکمیل ناشده') }}</button>
                                @endif
                            @endhasDirectPermission

                            @if(!$obj->is_completed)
                                @hasDirectPermission('Budget Plan - Update')
                                    <a wire:navigate href="{{ route('finance.budget.plan.update',$obj->id) }}" class="btn btn-info btn-sm ml-1">
                                        <i class="fa fa-edit text-white"></i>
                                    </a>
                                @endhasDirectPermission

                                @hasDirectPermission('Budget Plan - Delete')
                                    <button wire:confirm="Are you sure to delete this record?" 
                                        wire:click="delete({{ $obj->id }})" class="btn btn-danger btn-sm ml-1">
                                        <i class="fa fa-trash text-white"></i> </button>
                                @endhasDirectPermission
                            @endif
                        </td>
                    </tr>
                @endforeach
            </tbody>

            <x-slot:links>
                @if($this->plans->lastPage() > 1)
                    <tfoot>
                        <th colspan="8">
                        {{ $this->plans->links() }}
                        </th>
                    </tfoot>
                @endif
            </x-slot>
            
        </x-backend.shared.table> 
    </x-backend.shared.page-container>
</div>
