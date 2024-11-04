@extends('backend.layout.base')


@section('page_title')
  {{ Settings::trans(
    'CF Form',
    'سي اف فورم',
    'فورم سی اف') }}
    {{ substr(Settings::change_to_hijri($budget_plan->year),0,4) }}

<span style="font-size:12px;">({{ $cf_list->cf_name }})</span>
 
@endsection

@section('page_nav')
    <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
    <li class="breadcrumb-item"><a href="{{ route('finance.budget.dev.plan.cf.list.index',[$budget_plan->id,$cf_list->id]) }}">{{ Settings::trans('CF List','سي اف لیست','لیست سی اف') }}</a></li>
    <li class="breadcrumb-item active">CF {{ $cf_list->cf_name }}</li>
@endsection
@section('contents')
  <x-backend.shared.page-container :show_card="true">
   
        <div class="p-0 pl-1 m-2"> 
          
        @hasDirectPermission('CF (Development) - Create Details')
          @if(!$is_finalized)
            <a class="btn btn-primary" href="{{ route('finance.budget.dev.plan.cf.create',[$budget_plan->id,$cf_list->id]) }}">
              <i class="fa fa-plus"></i>
              {{ Settings::trans('Add','اضافه کول','اضافه کردن') }}
            </a>
          @endif
        @endhasDirectPermission

          <a class="btn btn-secondary" target="_blank"
          href="{{ route('finance.budget.dev.plan.cf.print',[$budget_plan->id,$cf_list->id]) }}">
            <i class="fa fa-print"></i>
            {{ Settings::trans('Print','پرنټ','پرنت') }}
          </a>

          @hasDirectPermission('CF (Development) - Lock Details')
          <a class="btn @if($is_finalized) btn-success @else btn-info @endif" id="finalize" href="{{ route('finance.budget.dev.plan.cf.finalized',$budget_plan->id) }}" title="{{ Settings::trans('Finalize','تکمیل کړئ','تکمیل کنید') }}">
            @if($is_finalized) <i class="fas fa-lock"></i> @else <i class="fas fa-lock-open"></i> @endif
          </a>
          @endhasDirectPermission

        </div>


    <div class="table-responsive" id="tbl-container">
      @include('backend.finance.development_budget.cf.inc_tbl_body')
    </div>
  </x-backend.shared.page-container>
@endsection

@push('scripts')
  <script>

  </script>
@endpush