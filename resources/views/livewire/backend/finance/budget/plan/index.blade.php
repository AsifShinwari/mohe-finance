<div>
    <x-backend.shared.page-nav>
          <x-slot:title>
               {{ __('leftbar.budget_plan') }}
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item active">{{ __('leftbar.budget_plan') }}</li>
     </x-backend.shared.page-nav>

    <x-backend.shared.page-container>
        <x-backend.shared.table>

            <x-slot:tools>
                <div>
                    <a wire:navigate href="{{ route('finance.budget.plan.create') }}" class="btn btn-primary">
                        <i class="fa fa-plus"></i><span class="d-none d-sm-inline-block">&nbsp;{{ __('leftbar.add') }}</span></a>
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
                        <td class="d-flex justify-content-start">
                            @if($obj->is_completed)
                                <button wire:click="mark_as_complete({{ $obj->id }})" wire:confirm="Are You Sure To Mark This as Uncomplete?" class="btn btn-success btn-sm">{{ Settings::trans('Completed','تکمیل شوی','تکمیل شده') }}</button>
                            @else
                                <button wire:click="mark_as_complete({{ $obj->id }})" wire:confirm="Are You Sure To Mark This as Complete?" class="btn btn-warning btn-sm">{{ Settings::trans('Incompleted','نا تکمیل','تکمیل ناشده') }}</button>
                            @endif

                            @hasDirectPermission('Users - Can Add')
                                <a wire:navigate href="{{ route('finance.budget.plan.approved.major.codes',$obj->id) }}" class="btn btn-primary btn-sm ml-1">
                                    {{ Settings::trans('Approved Budget','منظور شوی بودیجه','بودیجه منظور شده') }}
                                </a>
                            @endhasDirectPermission

                            @hasDirectPermission('Users - Can Add')
                                <a href="{{ route('finance.budget.plan.approved.distributions.index',$obj->id) }}" class="btn btn-primary btn-sm ml-1">
                                    {{ Settings::trans('B20','ب ۲۰','ب ۲۰') }}
                                </a>
                            @endhasDirectPermission

                            @hasDirectPermission('Users - Can Add')
                                <a href="{{ route('finance.budget.plan.approved.distributions.b10.index',$obj->id) }}" class="btn btn-primary btn-sm ml-1">
                                    {{ Settings::trans('B10','ب ۱۰','ب ۱۰') }}
                                </a>
                            @endhasDirectPermission

                            @hasDirectPermission('Users - Can Add')
                                <a href="{{ route('finance.budget.plan.transfer.external.index',$obj->id) }}" class="btn btn-primary btn-sm ml-1">
                                    {{ Settings::trans('Transfer Budget External','خارجي تعدیلات','تعدیلات خارجی') }}
                                </a>
                            @endhasDirectPermission

                            @hasDirectPermission('Users - Can Add')
                                <a href="{{ route('finance.budget.plan.transfer.internal.index',$obj->id) }}" class="btn btn-primary btn-sm ml-1">
                                    {{ Settings::trans('Transfer Budget Internal','داخلي تعدیلات','تعدیلات داخلی') }}
                                </a>
                            @endhasDirectPermission
                            
                            @if(!$obj->is_completed)
                                @hasDirectPermission('Users - Can Add')
                                    <a wire:navigate href="{{ route('finance.budget.plan.update',$obj->id) }}" class="btn btn-info btn-sm ml-1">
                                        <i class="fa fa-edit text-white"></i>
                                    </a>
                                @endhasDirectPermission

                                @hasDirectPermission('Users - Can Delete')
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
                <tfoot>
                    <th colspan="8">
                    {{ $this->plans->links() }}
                    </th>
                </tfoot>
            </x-slot>
            
        </x-backend.shared.table> 
    </x-backend.shared.page-container>
</div>
