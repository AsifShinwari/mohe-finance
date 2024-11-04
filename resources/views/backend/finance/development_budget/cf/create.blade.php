@extends('backend.layout.base')


@section('page_title')
{{ Settings::trans('Add CF','د CF اضافه کول','اضافه کردن CF') }}
@endsection

@section('page_nav')
    <li class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
    <li class="breadcrumb-item active"><a href="{{ route('finance.budget.dev.plan.cf.index',[$budget_plan->id,$cf_list->id]) }}">{{ Settings::trans('CF List','لیست CF','CF لیست') }}</a></li>
    <li class="breadcrumb-item"><a>{{ Settings::trans('Add CF','د CF اضافه کول','اضافه کردن CF') }} {{ substr(Settings::change_to_hijri($budget_plan->year),0,4) }}</a></li>
@endsection

@section('contents')
  <x-backend.shared.page-container :show_card="true">
    <form id="frm-add">
        <div class="row m-0 p-4">
            @csrf
            <input type="hidden" name="budget_plan_id" value="{{ $budget_plan->id }}">
            <input type="hidden" name="budget_dev_cf_list_id" value="{{ $cf_list->id }}">

            <div class="col-sm-12 border-bottom my-4">
                <h5 class="text-secondary">{{ Settings::trans('Select the coding block:','کوډ بلاک انتخاب کړئ:','کودنګ بلاک انتخاب کنید:') }}</h5>
            </div>
            <x-select 
                name="code_org_5" 
                id="code_org_5" label="{{ Settings::trans('Org(5)','واحد(۵)','واحد(۵)') }}"
                col="col-md-3 col-sm-3"
                required="1"
                :list="$code_org_5" 
                :is_livewire='0'
                value="sub_org_code"
                text="sub_org_code"
                default="{{ Settings::trans('Org(5)','واحد(۵)','واحد(۵)') }}" /> 

            <x-select 
                name="code_project_6" 
                id="code_project_6" label="{{ Settings::trans('Project(6)','پروژه(۶)','پروژه(۶)') }}"
                col="col-md-3 col-sm-3"
                required="1"
                :list="$code_project_6" 
                :is_livewire='0'
                value="code"
                text="code"
                default="{{ Settings::trans('Project(6)','پروژه(۶)','پروژه(۶)') }}" /> 

            <x-select 
                name="code_program_5" 
                id="code_program_5" label="{{ Settings::trans('Program(5)','فعالیت(۵)','فعالیت(۵)') }}"
                col="col-md-3 col-sm-3"
                required="1"
                :list="$code_program_5" 
                :is_livewire='0'
                value="activity_code"
                text="activity_code"
                default="{{ Settings::trans('Program(5)','فعالیت(۵)','فعالیت(۵)') }}" /> 

            <x-select 
                name="code_fund_4" 
                id="code_fund_4" label="{{ Settings::trans('Fund(4)','وجه(۴)','وجه(۴)') }}"
                col="col-sm-3"
                required="1"
                :list="$code_fund_4" 
                :is_livewire='0'
                value="sub_fund_code"
                text="sub_fund_code"
                default="{{ Settings::trans('Fund(4)','وجه(۴)','وجه(۴)') }}" /> 

            <x-select 
                name="code_location_4" 
                id="code_location_4" label="{{ Settings::trans('District(4)','ولسوالی(۴)','ولسوالی(۴)') }}"
                col="col-md-3 col-sm-3"
                required="1"
                :list="$code_location_4" 
                :is_livewire='0'
                value="dist_code"
                text="dist_code"
                default="{{ Settings::trans('District(4)','ولسوالی(۴)','ولسوالی(۴)') }}" /> 
            <x-select 
                name="code_cate_1" 
                id="code_cate_1" label="{{ Settings::trans('Category(1)','نوع(۱)','نوع(۱)') }}"
                col="col-md-3 col-sm-3"
                required="1"
                :list="$code_cate_1" 
                :is_livewire='0'
                value="code"
                text="code"
                default="{{ Settings::trans('Category(1)','نوع(۱)','نوع(۱)') }}" /> 

            <x-select 
                name="code_object_2" 
                id="code_object_2" label="{{ Settings::trans('Major Code(2)','باب(۲)','باب(۲)') }}"
                col="col-md-3 col-sm-3"
                required="1"
                :list="$code_objects_2" 
                :is_livewire='0'
                value="major_code"
                text="major_code"
                default="{{ Settings::trans('Major Code(2)','باب(۲)','باب(۲)') }}" /> 
            
            <x-input 
                name="afmis_reg_no" 
                id="afmis_reg_no" 
                required="1"
                label="{{ Settings::trans('AFMIS/Reg#','افمس ګڼه','نمبر آفمس') }}" 
                col="col-md-3 col-sm-6" />

            <div class="col-sm-12 border-bottom my-4">
                <h5 class="text-secondary">{{ Settings::trans('Enter Amounts For Exact Month:','د مشخصی میاشتی ارقام ولیکئ:','ارقام ماه ها مشخص نوشته کنید:') }}</h5>
            </div>

            <x-input 
                name="m_1" 
                id="m_1" 
                type="number"
                placeholder="{{ Settings::trans('Enter Amount','ارقام ولیکئ','ارقام نوشته کنید') }}"
                label="{{ Settings::trans('Hamal(01)','حمل(۰۱)','حمل(۰۱)') }}" 
                col="col-md-2 col-sm-4" />
            <x-input 
                name="m_2" 
                id="m_2" 
                type="number"
                placeholder="{{ Settings::trans('Enter Amount','ارقام ولیکئ','ارقام نوشته کنید') }}"
                label="{{ Settings::trans('Sawar(02)','ثور(۰۲)','ثور(۰۲)') }}" 
                col="col-md-2 col-sm-4" />
            <x-input 
                name="m_3" 
                id="m_3" 
                type="number"
                placeholder="{{ Settings::trans('Enter Amount','ارقام ولیکئ','ارقام نوشته کنید') }}"
                label="{{ Settings::trans('Jawza(03)','جوزا(۰۳)','جوزا(۰۳)') }}" 
                col="col-md-2 col-sm-4" />
            <x-input 
                name="m_4" 
                id="m_4" 
                type="number"
                placeholder="{{ Settings::trans('Enter Amount','ارقام ولیکئ','ارقام نوشته کنید') }}"
                label="{{ Settings::trans('Saratan(04)','سرطان(۰۴)','سرطان(۰۴)') }}" 
                col="col-md-2 col-sm-4" />
            <x-input 
                name="m_5" 
                id="m_5" 
                type="number"
                placeholder="{{ Settings::trans('Enter Amount','ارقام ولیکئ','ارقام نوشته کنید') }}"
                label="{{ Settings::trans('Asad(05)','اسد(۰۵)','اسد(۰۵)') }}" 
                col="col-md-2 col-sm-4" />
            <x-input 
                name="m_6" 
                id="m_6" 
                type="number"
                placeholder="{{ Settings::trans('Enter Amount','ارقام ولیکئ','ارقام نوشته کنید') }}"
                label="{{ Settings::trans('Sunbula(06)','سنبله(۰۶)','سنبله(۰۶)') }}" 
                col="col-md-2 col-sm-4" />
            <x-input 
                name="m_7" 
                id="m_7" 
                type="number"
                placeholder="{{ Settings::trans('Enter Amount','ارقام ولیکئ','ارقام نوشته کنید') }}"
                label="{{ Settings::trans('Mezan(07)','میزان(۰۷)','میزان(۰۷)') }}" 
                col="col-md-2 col-sm-4" />
            <x-input 
                name="m_8" 
                id="m_8" 
                type="number"
                placeholder="{{ Settings::trans('Enter Amount','ارقام ولیکئ','ارقام نوشته کنید') }}"
                label="{{ Settings::trans('Aqrab(08)','عقرب(۰۸)','عقرب(۰۸)') }}" 
                col="col-md-2 col-sm-4" />
            <x-input 
                name="m_9" 
                id="m_9" 
                type="number"
                placeholder="{{ Settings::trans('Enter Amount','ارقام ولیکئ','ارقام نوشته کنید') }}"
                label="{{ Settings::trans('Qaous(09)','قوس(۰۹)','قوس(۰۹)') }}" 
                col="col-md-2 col-sm-4" />
            <x-input 
                name="m_10" 
                id="m_10" 
                type="number"
                placeholder="{{ Settings::trans('Enter Amount','ارقام ولیکئ','ارقام نوشته کنید') }}"
                label="{{ Settings::trans('Jadi(10)','جدی(۱۰)','جدی(۱۰)') }}" 
                col="col-md-2 col-sm-4" />
            <x-input 
                name="m_11" 
                id="m_11" 
                type="number"
                placeholder="{{ Settings::trans('Enter Amount','ارقام ولیکئ','ارقام نوشته کنید') }}"
                label="{{ Settings::trans('Dalwa(11)','دلوه(۱۱)','دلوه(۱۱)') }}" 
                col="col-md-2 col-sm-4" />
            <x-input 
                name="m_12" 
                id="m_12" 
                type="number"
                placeholder="{{ Settings::trans('Enter Amount','ارقام ولیکئ','ارقام نوشته کنید') }}"
                label="{{ Settings::trans('Hoot(12)','حوت(۱۲)','حوت(۱۲)') }}"
                col="col-md-2 col-sm-4" />

            
            
            <div class="col-sm-12">
                <button class="btn btn-info" type="submit">
                    <i class="fa fa-save"></i> {{ Settings::trans('Save','ثبت','ثبت') }}
                </button>
                <a href="{{ route('finance.budget.dev.plan.cf.index',[$budget_plan->id,$cf_list->id]) }}" class="btn btn-secondary">
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

        $('#frm-add').submit(function(e){
            e.preventDefault();
            //validate form data
            if(validate_field('code_org_5')
                || validate_field('code_project_6') || validate_field('code_program_5') || validate_field('code_fund_4') 
                || validate_field('code_location_4') || validate_field('code_cate_1') || validate_field('code_object_2') || validate_field('afmis_reg_no')){
                toastr['error']('Validation Failed!');
                return;
            }

            $.ajax({
                url: "{{ route('finance.budget.dev.plan.cf.store') }}",
                type: 'POST',
                data: $('#frm-add').serialize(),
                success: function(response){
                    if(response.result==200){
                        toastr['success']('Saved Successfully');
                        $('#code_org_5').val('').change();
                        $('#code_project_6').val('').change();
                        $('#code_program_5').val('').change();
                        $('#code_fund_4').val('').change();
                        $('#code_location_4').val('').change();
                        $('#code_cate_1').val('').change();
                        $('#code_object_2').val('').change();
                        $('#afmis_reg_no').val('');
                        $('#m_1').val('');
                        $('#m_2').val('');
                        $('#m_3').val('');
                        $('#m_4').val('');
                        $('#m_5').val('');
                        $('#m_6').val('');
                        $('#m_7').val('');
                        $('#m_8').val('');
                        $('#m_9').val('');
                        $('#m_10').val('');
                        $('#m_11').val('');
                        $('#m_12').val('');
                    }else if(response.result==500){
                        toastr['error'](response.msg);
                    }
                }
            });
        });
    </script>

@endpush