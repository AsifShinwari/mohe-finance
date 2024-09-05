<div>
    <x-backend.shared.page-nav>
          <x-slot:title>
               {{ __('master.fund.index') }}
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item active">{{ __('master.fund.index') }}</li>
     </x-backend.shared.page-nav>

    <x-backend.shared.page-container>
        <x-backend.shared.table>

            <x-slot:tools>
                <div>
                    <a wire:navigate href="{{ route('finance.master.funds.create') }}" class="btn btn-primary">
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
                    <th>{{ __('master.fund.fund_type') }}</th>
                    <th>{{ __('master.fund.fund_code') }}</th>
                    <th>{{ __('master.fund.sub_fund_code') }}</th>
                    <th>{{ __('master.fund.fund_componenet_code') }}</th>
                    <th>{{ __('master.fund.fund_desc') }}</th>
                    <th>{{ __('master.fund.username') }}</th>
                    <th class="text-center">{{ __('master.fund.actions') }}</th>
            </thead>
            <tbody>
                @foreach($this->funds as $fund)
                    <tr class="@if($fund->fund_componenet_code==null && $fund->sub_fund_code==null && $fund->fund_code==null) bg-black @elseif($fund->fund_componenet_code==null && $fund->sub_fund_code==null) bg-secondary @elseif($fund->fund_componenet_code==null) bg-light @endif">
                        <td>{{ $loop->index+1 }}</td>
                        <td>{{ $fund->fund_type_code }}</td>
                        <td>{{ $fund->fund_code }}</td>
                        <td>{{ $fund->sub_fund_code }}</td>
                        <td>{{ $fund->fund_componenet_code }}</td>
                        <td>{{ Settings::trans($fund->en_desc,$fund->pa_desc,$fund->da_desc) }}</td>
                        <td>{{ Settings::trans($fund->username,$fund->pa_username,$fund->pa_username) }}</td>
                        <td class="d-flex justify-content-start">

                            @hasDirectPermission('Users - Can Add')
                                <a wire:navigate href="{{ route('finance.master.funds.edit',$fund->id) }}" class="btn btn-info btn-sm ml-1"><i class="fa fa-edit text-white"></i> </a>
                            @endhasDirectPermission

                            @hasDirectPermission('Users - Can Delete')
                                <button wire:confirm="Are you sure to delete this record?" wire:click="delete({{ $fund->id }})" class="btn btn-danger btn-sm ml-1"><i class="fa fa-trash text-white"></i> </button>
                            @endhasDirectPermission
                        </td>
                    </tr>
                @endforeach
            </tbody>

            <x-slot:links>
                <tfoot>
                    <th colspan="8">
                    {{ $this->funds->links() }}
                    </th>
                </tfoot>
            </x-slot>
            

        </x-backend.shared.table> 

    </x-backend.shared.page-container>
</div>
