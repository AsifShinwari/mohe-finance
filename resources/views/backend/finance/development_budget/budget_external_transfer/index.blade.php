@extends('backend.layout.base')


@section('page_title')
  {{ Settings::trans('Development Budget Transfers (B3)','(B3)خارجي تعدیلات(B3)','تعدیلات خارجی') }} {{ substr(Settings::change_to_hijri($budget_plan->year),0,4) }}
@endsection

@section('page_nav')
    <li class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
@endsection

@section('contents') 
  <x-backend.shared.page-container :show_card="true">
   
        <div class="p-0 pl-1 m-2">
          
          @hasDirectPermission('B.E.Transfer (Development) - Create')
            @if(!$is_finalized)
              <button class="btn btn-primary" id="add-btn-dr" type="button" data-toggle="modal" data-target="#add-modal-dr">
                <i class="fa fa-plus"></i>
                {{ Settings::trans('Add Dr(+)','تزئید','تزئید') }}
              </button>
              <button class="btn btn-danger" id="add-btn" type="button" data-toggle="modal" data-target="#add-modal">
                <i class="fa fa-minus"></i>
                {{ Settings::trans('Add Cr(-)','تنقیص','تنقیص') }}
              </button>
            @endif
          @endhasDirectPermission
          
          <a class="btn btn-secondary" target="_blank"
          href="{{ route('finance.budget.dev.plan.transfers.external.print.all',$budget_plan->id) }}">
            <i class="fa fa-print"></i>
            {{ Settings::trans('Print','پرنټ','پرنت') }}
          </a>

          @hasDirectPermission('B.E.Transfer (Development) - Lock')
          <a class="btn @if($is_finalized) btn-success @else btn-info @endif" id="finalize" href="{{ route('finance.budget.dev.plan.transfers.external.finalized',$budget_plan->id) }}" title="{{ Settings::trans('Finalize','تکمیل کړئ','تکمیل کنید') }}">
            @if($is_finalized) <i class="fas fa-lock"></i> @else <i class="fas fa-lock-open"></i> @endif
          </a>
          @endhasDirectPermission
          
        </div>


    <div class="table-responsive" id="tbl-container">
      @include('backend.finance.development_budget.budget_external_transfer.inc_external_tbl_body')
    </div>
  </x-backend.shared.page-container>
  @include('backend.finance.development_budget.budget_external_transfer.add-modal')
  @include('backend.finance.development_budget.budget_external_transfer.add-modal-dr')
  @include('backend.finance.development_budget.budget_external_transfer.print-modal')
@endsection

@push('scripts')
  <script>

  </script>
@endpush