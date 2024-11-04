@extends('backend.layout.base')


@section('page_title')
{{ Settings::trans('Edit Budget Promises','د تعهد تصحیح کول','تصحیح کردن تعهد') }}
@endsection

@section('page_nav')
    <li class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
    <li class="breadcrumb-item active"><a href="{{ route('finance.budget.dev.plan.promises.index',$budget_plan->id) }}">{{ Settings::trans('Budget Promises','تعهدات','تعهدات') }}</a></li>
    <li class="breadcrumb-item"><a>{{ Settings::trans('Add Budget Promises','د تعهد تصحیح کول','تصحیح کردن تعهد') }} {{ substr(Settings::change_to_hijri($budget_plan->year),0,4) }}</a></li>
@endsection

@section('contents')
  <x-backend.shared.page-container :show_card="true">
    <form id="frm-add">
        <div class="row m-0 p-4">
            @csrf
            <input type="hidden" name="budget_plan_id" value="{{ $budget_plan->id }}">

            <x-select 
                name="department_id" 
                id="department_id" label="{{ Settings::trans('Departement','اداره','اداره') }}"
                col="col-md-3 col-sm-3"
                required="1"
                :list="$deps" 
                :is_livewire='0'
                value="id"
                text="{{ Settings::trans('en_name','pa_name','da_name') }}"
                default="{{ Settings::trans('Departement','اداره','اداره') }}" /> 

            <x-select 
                name="code_objects_2_id" 
                id="code_objects_2_id" label="{{ Settings::trans('Major Code(2)','کود بودجه','کود بودیجه') }}"
                col="col-sm-3"
                required="1"
                :list="$code_objects_2" 
                :is_livewire='0'
                value="major_code"
                text="major_code"
                default="{{ Settings::trans('Major Code(2)','کود بودجه','کود بودیجه') }}" /> 

            <x-select 
                name="code_objects_3_id" 
                id="code_objects_3_id" label="{{ Settings::trans('Minor Code(3)','کود بودجه(۳)','کود بودیجه(۳)') }}"
                col="col-md-3 col-sm-3"
                required="1"
                :list="$code_objects_3" 
                :is_livewire='0'
                value="minor_code"
                text="minor_code"
                default="{{ Settings::trans('Minor Code(3)','کود بودجه(۳)','کود بودیجه(۳)') }}" /> 

            <x-select 
                name="code_objects_5_id" 
                id="code_objects_5_id" label="{{ Settings::trans('Object Code(5)','کودبودیجه(۵)','کودبودجه(۵)') }}"
                col="col-md-3 col-sm-3"
                required="1"
                :list="$code_objects_5" 
                :is_livewire='0'
                value="object_code"
                text="object_code"
                default="{{ Settings::trans('Object Code(5)','کودبودیجه(۵)','کودبودجه(۵)') }}" /> 
            
            <x-input 
                name="sadira_no" 
                id="sadira_no" 
                required="1"
                label="{{ Settings::trans('SendingNo.','صادره ګڼه','شماره صادره') }}" 
                col="col-md-3 col-sm-6" />

            <x-input 
                name="maktoob_date" 
                id="maktoob_date" 
                readonly="1"
                required="1"
                label="{{ Settings::trans('SendingDate.','صادره تاریخ','تاریخ صادره') }}" 
                col="col-md-3 col-sm-6" />

            <x-input 
                name="promise_amount" 
                id="promise_amount" 
                type="number"
                required="1"
                label="{{ Settings::trans('Promised Amount','د تعهد مبلغ','مبلغ تعهد') }}" 
                col="col-md-3 col-sm-6" />

            <x-input 
                name="paid_amount" 
                id="paid_amount" 
                type="number"
                label="{{ Settings::trans('Paid Amount','د تعهد اجرا شوی مبلغ','مبلغ اجرا شده تعهد') }}" 
                col="col-md-3 col-sm-6" />
            
            <x-textarea  
                label="{{ Settings::trans('Description','د تعهد موضوع','موضوع تعهد') }}"
                placeholder="{{ Settings::trans('Enter description here','د تعهد موضوع دلته ولیکئ','موضوع تعهد اینجا نوشته کنید') }}"
                name="details"
                col="col-sm-12"
                required="1"
                style="height: 200px;"
                id="details" />
            
            <div class="col-sm-12">
                <button class="btn btn-info" type="submit">
                    <i class="fa fa-save"></i> {{ Settings::trans('Save','ثبت','ثبت') }}
                </button>
                <a href="{{ route('finance.budget.dev.plan.promises.index',$budget_plan->id) }}" class="btn btn-secondary">
                    <i class="fa fa-times"></i> {{ Settings::trans('Cancel','لغوه','لغوه') }}
                </a>
            </div>
            
        </div>
    </form>
  </x-backend.shared.page-container>
@endsection

@push('scripts')
    <script>
        $("#maktoob_date").persianDatepicker({ 
            showGregorianDate: false,
            months: ["حمل", "ثور", "جوزا", "سرطان", "اسد", "سنبله", "میزان", "عقرب", "قوس","جدی","دلوه","حوت"],
            formatDate: "YYYY-MM-DD",
            onSelect: function () {
                // {{--@this.set('maktoob_date',$("#maktoob_date").attr("data-jdate"));--}}
            }
        });
        //init fields
        initFields();

        function initFields(){
            $('#department_id').val('{{ $budget_plan_promise->department_id }}').change();
            $('#code_objects_2_id').val('{{ substr($budget_plan_promise->object_code_5,0,2) }}').change();
            $('#code_objects_3_id').val('{{ substr($budget_plan_promise->object_code_5,0,3) }}').change();
            $('#code_objects_5_id').val('{{ $budget_plan_promise->object_code_5 }}').change();
            $('#sadira_no').val('{{ $budget_plan_promise->sadira_no }}');
            $('#maktoob_date').val('{{ $budget_plan_promise->maktoob_date }}');
            $('#promise_amount').val('{{ $budget_plan_promise->promise_amount }}');
            $('#paid_amount').val('{{ $budget_plan_promise->paid_amount }}');
            $('#details').val('{{ $budget_plan_promise->details }}');
        }

        $('#code_objects_2_id').on('change', function(){
            var selected = $(this).val();
            $.ajax({
                url: "{{ route('finance.budget.dev.plan.promises.get.code.object.3') }}",
                type: 'GET',
                data: { 'code_object_2': selected },
                success: function(response){
                    $('#code_objects_3_id').empty();
                    $('#code_objects_3_id').append('<option value="">' + "{{ Settings::trans('Select Minor Code','انتخاب کود بودجه','انتخاب کود بودجه') }}" + '</option>');
                    response.forEach(function(item){
                        $('#code_objects_3_id').append('<option value="' + item.minor_code + '">' + item.minor_code + '</option>');
                    });
                }
            });
        });

        $('#code_objects_3_id').on('change', function(){
            var selected = $(this).val();
            $.ajax({
                url: "{{ route('finance.budget.dev.plan.promises.get.code.object.5') }}",
                type: 'GET',
                data: { 'code_object_3': selected },
                success: function(response){
                    $('#code_objects_5_id').empty();
                    $('#code_objects_5_id').append('<option value="">' + "{{ Settings::trans('Select Object Code','انتخاب کود بودجه','انتخاب کود بودجه') }}" + '</option>');
                    response.forEach(function(item){
                        $('#code_objects_5_id').append('<option value="' + item.object_code + '">' + item.object_code + '</option>');
                    });
                }
            });
        });

        $('#frm-add').submit(function(e){
            e.preventDefault();

            //validate form data
            if(validate_field('department_id')
                || validate_field('code_objects_2_id') || validate_field('code_objects_3_id') || validate_field('code_objects_5_id') 
                || validate_field('sadira_no') || validate_field('maktoob_date') || validate_field('promise_amount') || validate_field('details')){
                toastr['error']('Validation Failed!');
                return;
            }

            $.ajax({
                url: "{{ route('finance.budget.dev.plan.promises.store') }}",
                type: 'POST',
                data: $('#frm-add').serialize(),
                success: function(response){
                    if(response.result==200){
                        toastr['success']('Saved Successfully');
                    }else if(response.result==500){
                        toastr['error'](response.msg);
                    }
                    
                    $('#department_id').val('').change();
                    $('#code_objects_2_id').val('').change();
                    $('#code_objects_3_id').val('').change();
                    $('#code_objects_5_id').val('').change();
                    $('#sadira_no').val('');
                    $('#maktoob_date').val('');
                    $('#promise_amount').val('');
                    $('#paid_amount').val('');
                    $('#details').val('');
                    
                }
            });
        });
    </script>

@endpush