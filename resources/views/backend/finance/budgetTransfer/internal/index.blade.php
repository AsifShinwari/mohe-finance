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
          
          @hasDirectPermission('B.Internal Transfer (Regular) - Create')
            <button class="btn btn-primary @if($is_finalized) d-none @endif"
             id="add-btn" type="button" data-toggle="modal" data-target="#add-modal">
              <i class="fa fa-plus"></i>
              {{ Settings::trans('Add','تعدیلات اضافه کړئ','تعدیلات اضافه کنید') }}
            </button>
          @endhasDirectPermission
          
          <a class="btn btn-secondary" target="_blank"
          href="{{ route('finance.budget.plan.transfer.external.print.all',$budget_plan->id) }}">
            <i class="fa fa-print"></i>
            {{ Settings::trans('Print','پرنټ','پرنت') }}
          </a>
          
          @hasDirectPermission('B.Internal Transfer (Regular) - Lock')
            <button class="btn @if($is_finalized) btn-success @else btn-info @endif" id="finalize" type="button" title="{{ Settings::trans('Finalize','تکمیل کړئ','تکمیل کنید') }}">
              @if($is_finalized) <i class="fas fa-lock"></i> @else <i class="fas fa-lock-open"></i> @endif
            </button>
          @endhasDirectPermission
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
    $('#finalize').click(function(){
      if(confirm('Are you sure, to finalize this form?')) {
        $.ajax({
          url: "{{ route('finance.budget.plan.transfer.internal.finalized') }}",
          method: 'POST',
          data: {
            _token: '{{ csrf_token() }}',
            budget_plan_id: $('#budget_plan_id').val()
          },
          success: function(res) {
            if(res.code==200){
              $('#main-tbl').empty();
              $('#main-tbl').html(res.html);
              if(res.is_finalized){
                $('#finalize').removeClass('btn-info');
                $('#finalize').addClass('btn-success');
                $('#finalize').html('<i class="fa fa-lock"></i>');
                $('#add-btn').addClass('d-none');
                $('#add-btn-dr').addClass('d-none');
              }else{
                $('#finalize').addClass('btn-info');
                $('#finalize').removeClass('btn-success');
                $('#finalize').html('<i class="fa fa-lock-open"></i>');
                $('#add-btn').removeClass('d-none');
                $('#add-btn-dr').removeClass('d-none');
              }
            }
            toastr[res.type](res.msg);
          },
          error: function(error) {
            console.log(error);
          }
        });
      }
    });
  </script>
@endpush