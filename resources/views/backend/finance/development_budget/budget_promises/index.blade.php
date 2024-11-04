@extends('backend.layout.base')


@section('page_title')
  {{ Settings::trans('Development Budget Promises','د مالي کال د انکشافي بودیجی لپاره د لګښتونو ریاست تعهدات','تعهدات بودجه انکشافی بخش مصارفات بابت سال مالی') }} {{ substr(Settings::change_to_hijri($budget_plan->year),0,4) }}
@endsection

@section('page_nav')
    <li class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
@endsection

@section('contents')
  <x-backend.shared.page-container :show_card="true">
   
        <div class="p-0 pl-1 m-2">
          @hasDirectPermission('B.Promises (Development) - Create')
            @if(!$is_finalized)
              <a class="btn btn-primary" href="{{ route('finance.budget.dev.plan.promises.create',$budget_plan->id) }}">
                <i class="fa fa-plus"></i>
                {{ Settings::trans('Add','اضافه کول','اضافه کردن') }}
              </a>
            @endif
          @endhasDirectPermission
          
          <a class="btn btn-secondary" target="_blank"
          href="{{ route('finance.budget.dev.plan.promises.print',$budget_plan->id) }}">
            <i class="fa fa-print"></i>
            {{ Settings::trans('Print','پرنټ','پرنت') }}
          </a>

          @hasDirectPermission('B.Promises (Development) - Lock')
            <a class="btn @if($is_finalized) btn-success @else btn-info @endif" id="finalize" href="{{ route('finance.budget.dev.plan.promises.finalized',$budget_plan->id) }}" title="{{ Settings::trans('Finalize','تکمیل کړئ','تکمیل کنید') }}">
              @if($is_finalized) <i class="fas fa-lock"></i> @else <i class="fas fa-lock-open"></i> @endif
            </a>
          @endhasDirectPermission

        </div>


    <div class="table-responsive" id="tbl-container">
      @include('backend.finance.development_budget.budget_promises.inc_tbl_body')
    </div>
  </x-backend.shared.page-container>
@endsection

@push('scripts')
  <script>

  </script>
@endpush