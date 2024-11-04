@extends('backend.layout.base')


@section('page_title')
{{ Settings::trans('Add CF','د CF اضافه کول','اضافه کردن CF') }}
@endsection

@section('page_nav')
    <li class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
    <li class="breadcrumb-item active"><a href="{{ route('finance.budget.dev.plan.cf.list.index',$budget_plan->id) }}">{{ Settings::trans('CF List','لیست CF','CF لیست') }}</a></li>
    <li class="breadcrumb-item"><a>{{ Settings::trans('Add CF','د CF اضافه کول','اضافه کردن CF') }} {{ substr(Settings::change_to_hijri($budget_plan->year),0,4) }}</a></li>
@endsection

@section('contents')
  <x-backend.shared.page-container :show_card="true">
    <form id="frm-add" method="POST" action="{{ route('finance.budget.dev.plan.cf.list.store') }}">
        <div class="row m-0 p-4">
            @csrf
            <input type="hidden" name="budget_plan_id" value="{{ $budget_plan->id }}">
            
            <x-input 
                name="cf_name" 
                id="cf_name" 
                required="1"
                label="{{ Settings::trans('CF Name','د سي اف نوم','اسم سي اف') }}" 
                placeholder="{{ Settings::trans('CF Name','د سي اف نوم','اسم سي اف') }}" 
                col="col-md-3 col-sm-6" />  

            <x-input 
                name="date" 
                id="date" 
                required="1"
                placeholder="-          -            -"
                label="{{ Settings::trans('Date','تاریخ','تاریخ') }}" 
                col="col-md-2 col-sm-6" />  

            <x-input 
                name="sending_no" 
                id="sending_no" 
                label="{{ Settings::trans('SendingNo.','صادره ګڼه','شماره صادره') }}" 
                placeholder="{{ Settings::trans('SendingNo.','صادره ګڼه','شماره صادره') }}" 
                col="col-md-2 col-sm-6" />
            <x-input 
                name="currency" 
                id="currency" 
                label="{{ Settings::trans('Currency','د تعهد اسعار','اسعار تعهد') }}" 
                placeholder="{{ Settings::trans('Currency','د تعهد اسعار','اسعار تعهد') }}" 
                col="col-md-2 col-sm-6" /> 
            <x-input 
                name="payment_location" 
                id="payment_location" 
                label="{{ Settings::trans('Payment location','د تادیی محل','محل تادیه') }}" 
                placeholder="{{ Settings::trans('Payment location','د تادیی محل','محل تادیه') }}" 
                col="col-md-3 col-sm-6" />     

            <x-input 
                name="location_name" 
                id="location_name" 
                label="{{ Settings::trans('Location Name','د محل نوم','نام محل') }}" 
                placeholder="{{ Settings::trans('Location Name','د محل نوم','نام محل') }}" 
                col="col-md-3 col-sm-6" />             

            <x-input 
                name="afmis_no" 
                id="afmis_no" 
                label="{{ Settings::trans('AFMIS#','آفمس ګڼه','شماره آفمس') }}" 
                placeholder="{{ Settings::trans('AFMIS#','آفمس ګڼه','شماره آفمس') }}" 
                col="col-md-3 col-sm-6" />            
            

            <x-input 
                name="prepared_by" 
                id="prepared_by" 
                label="{{ Settings::trans('Prepared By','ترتیب شوی','ترتیب شده توسط') }}" 
                placeholder="{{ Settings::trans('Prepared By','ترتیب شوی','ترتیب شده توسط') }}" 
                col="col-md-3 col-sm-6" />            

            <x-input 
                name="approved_by" 
                id="approved_by" 
                label="{{ Settings::trans('Approved By','د بودیجوي واحد په واسطه تصدیق شوی','تصدیق شده توسط واحد بودجوی') }}" 
                placeholder="{{ Settings::trans('Approved By','د بودیجوي واحد په واسطه تصدیق شوی','تصدیق شده توسط واحد بودجوی') }}" 
                col="col-md-3 col-sm-6" />            
            
            <div class="col-sm-12 pb-4">
                <label for="description" class="mb-0">{{ Settings::trans('Description','تشریح','تشریح') }}</label>
                <textarea name="description" style="height: 307px;" placeholder="{{ Settings::trans('Enter Description Here','تشریح دلته ولیکئ','تشریح نوشته کنید') }}" class="form-control" id="description"></textarea>
            </div>

            <div class="col-sm-12">
                <button class="btn btn-info" type="submit">
                    <i class="fa fa-save"></i> {{ Settings::trans('Save','ثبت','ثبت') }}
                </button>
                <a href="{{ route('finance.budget.dev.plan.cf.list.index',$budget_plan->id) }}" class="btn btn-secondary">
                    <i class="fa fa-times"></i> {{ Settings::trans('Cancel','لغوه','لغوه') }}
                </a>
            </div>
            
        </div>
    </form>
  </x-backend.shared.page-container>
@endsection

@push('scripts')
    <script>
        $("#date").persianDatepicker({ 
            showGregorianDate: false,
            months: ["حمل", "ثور", "جوزا", "سرطان", "اسد", "سنبله", "میزان", "عقرب", "قوس","جدی","دلوه","حوت"],
            formatDate: "YYYY-MM-DD",
            onSelect: function () {
                // {{--@this.set('maktoob_date',$("#maktoob_date").attr("data-jdate"));--}}
            }
        });

        
    </script>

@endpush