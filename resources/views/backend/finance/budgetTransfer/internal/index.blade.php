@extends('backend.layout.base')


@section('page_title')
  {{ Settings::trans('Internal Transfers','داخلي تعدیلات','تعدیلات داخلی') }} {{ $budget_plan->year }}
@endsection

@section('page_nav')
    <li class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
@endsection

@section('contents')
  <x-backend.shared.page-container :show_card="true">
   
        <div class="p-0 pl-1 m-2">
          
          <button class="btn btn-primary" id="add-btn" type="button" data-toggle="modal" data-target="#add-modal">
            <i class="fa fa-plus"></i>
            {{ Settings::trans('Add','تعدیلات اضافه کړئ','تعدیلات اضافه کنید') }}
          </button>
          
          <a class="btn btn-secondary" target="_blank"
          href="{{ route('finance.budget.plan.transfer.external.print.all',$budget_plan->id) }}">
            <i class="fa fa-print"></i>
            {{ Settings::trans('Print','پرنټ','پرنت') }}
          </a>
        </div>


    <div class="table-responsive" id="tbl-container">
      @include('backend.finance.budgetTransfer.internal.inc_tbl_body')
    </div>
  </x-backend.shared.page-container>
  @include('backend.finance.budgetTransfer.internal.add-modal')
  @include('backend.finance.budgetTransfer.internal.print-modal')
@endsection

@push('scripts')
  <script>

  </script>
@endpush