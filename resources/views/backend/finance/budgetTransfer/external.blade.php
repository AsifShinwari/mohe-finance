@extends('backend.layout.base')


@section('page_title')
  {{ Settings::trans('Transfers (B10)','خارجي تعدیلات','تعدیلات خارجی') }} {{ $budget_plan->year }}
@endsection

@section('page_nav')
    <li class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
@endsection

@section('contents')
  <x-backend.shared.page-container :show_card="true">
   
        <div class="p-0 pl-1 m-2">
          
          <button class="btn btn-primary" id="add-btn-dr" type="button" data-toggle="modal" data-target="#add-modal-dr">
            <i class="fa fa-plus"></i>
            {{ Settings::trans('Add Dr(+)','د خارج څخه ب-۱۰ ته','از خارج به ب-۱۰') }}
          </button>
          <button class="btn btn-danger" id="add-btn" type="button" data-toggle="modal" data-target="#add-modal">
            <i class="fa fa-minus"></i>
            {{ Settings::trans('Add Cr(-)','د ب-۱۰ څخه خارج ته','از ب-۱۰ به خارج') }}
          </button>
          
          <a class="btn btn-secondary" target="_blank"
          href="{{ route('finance.budget.plan.transfer.external.print.all',$budget_plan->id) }}">
            <i class="fa fa-print"></i>
            {{ Settings::trans('Print','پرنټ','پرنت') }}
          </a>
        </div>


    <div class="table-responsive" id="tbl-container">
      @include('backend.finance.budgetTransfer.inc_external_tbl_body')
    </div>
  </x-backend.shared.page-container>
  @include('backend.finance.budgetTransfer.add-modal')
  @include('backend.finance.budgetTransfer.add-modal-dr')
  @include('backend.finance.budgetTransfer.print-modal')
@endsection

@push('scripts')
  <script>

  </script>
@endpush