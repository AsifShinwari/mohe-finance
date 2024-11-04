@extends('backend.layout.base')

@section('page_title')
  {{ Settings::trans('Internal Transfers (Development Budget)','داخلي تعدیلات (انکشافي بودیجه)','تعدیلات داخلی (بودجه انکشافی)') }} {{ $budget_plan->year }}
@endsection

@section('page_nav')
    <li class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
@endsection

@section('contents')
  <x-backend.shared.page-container :show_card="true">
   
        <div class="p-0 pl-1 m-2">
          
        @hasDirectPermission('B.I.Transfer (Development) - Create')
          @if(!$is_finalized)
            <button class="btn btn-primary" id="add-btn" type="button" data-toggle="modal" data-target="#add-modal">
              <i class="fa fa-plus"></i>
              {{ Settings::trans('Add','تعدیلات اضافه کړئ','تعدیلات اضافه کنید') }}
            </button>
          @endif
        @endhasDirectPermission

          <a class="btn btn-secondary" target="_blank"
          href="{{ route('finance.budget.dev.plan.transfers.internal.print.all',$budget_plan->id) }}">
            <i class="fa fa-print"></i>
            {{ Settings::trans('Print','پرنټ','پرنت') }}
          </a>
          
          @hasDirectPermission('B.I.Transfer (Development) - Lock')
          <a class="btn @if($is_finalized) btn-success @else btn-info @endif" id="finalize" href="{{ route('finance.budget.dev.plan.transfers.internal.finalized',$budget_plan->id) }}" title="{{ Settings::trans('Finalize','تکمیل کړئ','تکمیل کنید') }}">
            @if($is_finalized) <i class="fas fa-lock"></i> @else <i class="fas fa-lock-open"></i> @endif
          </a>
          @endhasDirectPermission
        </div>


    <div class="table-responsive" id="tbl-container">
      @include('backend.finance.development_budget.budget_internal_transfer.inc_tbl_body')
    </div>
  </x-backend.shared.page-container>
  @include('backend.finance.development_budget.budget_internal_transfer.add-modal')
  @include('backend.finance.development_budget.budget_internal_transfer.print-modal')
@endsection

@push('scripts')
  <script>

  </script>
@endpush