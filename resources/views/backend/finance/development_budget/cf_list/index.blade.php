@extends('backend.layout.base')


@section('page_title')
  {{ Settings::trans(
    'CF List',
    'سي اف لیست',
    'لیست سی اف') }}
    {{ substr(Settings::change_to_hijri($budget_plan->year),0,4) }}
@endsection

@section('page_nav')
    <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
@endsection

@section('contents')
  <x-backend.shared.page-container :show_card="true">
   
        <div class="p-0 pl-1 m-2">
          
        @hasDirectPermission('CF (Development) - Create')
          @if(!$is_finalized)
            <a class="btn btn-primary" href="{{ route('finance.budget.dev.plan.cf.list.create',$budget_plan->id) }}">
              <i class="fa fa-plus"></i>
              {{ Settings::trans('Add','اضافه کول','اضافه کردن') }}
            </a>
          @endif
        @endhasDirectPermission

          @hasDirectPermission('CF (Development) - Lock')
          <a class="btn @if($is_finalized) btn-success @else btn-info @endif" id="finalize" href="{{ route('finance.budget.dev.plan.cf.list.finalized',$budget_plan->id) }}" title="{{ Settings::trans('Finalize','تکمیل کړئ','تکمیل کنید') }}">
            @if($is_finalized) <i class="fas fa-lock"></i> @else <i class="fas fa-lock-open"></i> @endif
          </a>
          @endhasDirectPermission

        </div>


    <div class="table-responsive" id="tbl-container">
      <table class="table table-sm table-bordered">
        <thead class="bg-light">
          <th>{{ Settings::trans('No.','ګڼه','شماره') }}</th>
          <th>{{ Settings::trans('CF Name','سي اف نوم','اسم سی اف') }}</th>
          <th>{{ Settings::trans('Budget Year','مالي کال','سال مالی') }}</th>
          <th>{{ Settings::trans('Date','تاریخ','تاریخ') }}</th>
          <th>{{ Settings::trans('SendingNo.','صادره ګڼه','شماره صادره') }}</th>
          <th>{{ Settings::trans('Payment Location','د تادیی محل','محل تادیه تعهد') }}</th>
          <th>{{ Settings::trans('Location Name','د محل نوم','نام محل') }}</th>
          <th>{{ Settings::trans('Currency','اسعار','اسعار') }}</th>
          <th>{{ Settings::trans('AFMIS#','د آفمس ګڼه','شماره افمس') }}</th>
          <th>{{ Settings::trans('Actions','کړنی','عملیات') }}</th>
        </thead>
        <tbody>
          @foreach ($cfs as $index => $cf)
            <tr>
              <td>{{ $index + 1 }}</td>
              <td>{{ $cf->cf_name }}</td>
              <td>{{ substr(Settings::change_to_hijri($budget_plan->year),0,4) }}</td>
              <td>{{ $cf->date }}</td>
              <td>{{ $cf->sending_no }}</td>
              <td>{{ $cf->payment_location }}</td>
              <td>{{ $cf->location_name }}</td>
              <td>{{ $cf->currency }}</td>
              <td>{{ $cf->afmis_no }}</td>
              <td>
                @if(!$is_finalized)
                  @hasDirectPermission('CF (Development) - Show Details')
                  <a class="btn btn-sm btn-info" title="{{ Settings::trans('CF Details','د سي اف معلومات','معلومات سی اف') }}"
                    href="{{ route('finance.budget.dev.plan.cf.index',[$cf->budget_plan_id,$cf->id]) }}">
                    <i class="fa fa-list"></i> {{ Settings::trans('CF Details','د سي اف معلومات','معلومات سی اف') }}
                  </a>
                  @endhasDirectPermission
                  @hasDirectPermission('CF (Development) - Update')
                  <a class="btn btn-sm btn-primary" href="{{ route('finance.budget.dev.plan.cf.edit',$cf->id) }}"><i class="fa fa-edit"></i></a>
                  @endhasDirectPermission
                @endif

                <a class="btn btn-sm btn-secondary" target="_blank"
                  href="{{ route('finance.budget.dev.plan.cf.print',[$cf->budget_plan_id,$cf->id]) }}">
                    <i class="fa fa-print"></i>
                </a>
              </td>
            </tr>
          @endforeach
        </tbody>
        @if($cfs->lastPage() > 1)
        <tfoot id="tbl-foot">
          <th colspan="9">
            {{ $cfs->links() }}
          </th>
        </tfoot>
        @endif
      </table>
    </div>
  </x-backend.shared.page-container>
@endsection

@push('scripts')
  <script>

  </script>
@endpush