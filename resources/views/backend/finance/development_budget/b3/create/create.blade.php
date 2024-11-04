@extends('backend.layout.base') @section('page_title') {{ Settings::trans('Add
Budget Development Project','د انکشافي بودیجی پروژی اضافه کول','اضافه نمودن
پروژه بودجه انکشافی') }} @endsection @section('page_nav')
<li class="breadcrumb-item active">
    <a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a>
</li>
<li class="breadcrumb-item active">
    <a href="{{ route('finance.budget.dev.plan.b3.index',$budget_plan->id) }}">{{ Settings::trans('Development Budget
        Projects List','د انکشافي بودیجی
        پروژو لیست','لیست پروژه های بودجه انکشافی') }}</a>
</li>
<li class="breadcrumb-item">
    <a>{{ Settings::trans('Add Budget Development Project','د انکشافي بودیجی پروژی
        اضافه کول','اضافه نمودن پروژه بودجه انکشافی') }} {{
        substr(Settings::change_to_hijri($budget_plan->year),0,4) }}</a>
</li>
@endsection @section('contents')
<x-backend.shared.page-container :show_card="true">
    <form id="frm-add">
        <div class="row m-0 p-4">

            <div class="col-sm-12">
                <div class="d-flex justify-content-around" id="projects">  
                    @include('backend.finance.development_budget.b3.create.calculate_major_codes')
                </div>
            </div>

            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <div class="row">
                    @csrf
                    <input type="hidden" name="budget_plan_id" id="budget_plan_id" value="{{ $budget_plan->id }}">
                    <div class="col-sm-12 border-bottom my-4">
                        <h5 class="my-4">
                            {{ Settings::trans('Project Information Form','د پروژی معلوماتو
                            فورم','فورم معلومات پروژه') }}
                        </h5>
                    </div>
                    
                
                    <x-select 
                      name="code_org_3" 
                      id="code_org_3" label="{{ Settings::trans('Organization-Code(3)','کود وزارت(۳)','کود وزارت(۳)') }}"
                      col="col-sm-6"
                      required="1"
                      :list="$code_org_3" 
                      :is_livewire='0'
                      value="ministry_code"
                      text="ministry_code"
                      default="{{ Settings::trans('Organization-Code(3)','کود وزارت(۳)','کود وزارت(۳)') }}" 
                       /> 

                    <x-select 
                      name="budget_dev_approveds_id" 
                      id="budget_dev_approveds_id" label="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}"
                      col="col-sm-6"
                      required="1"
                      :list="$budget_approveds" 
                      :is_livewire='0'
                      value="id"
                      text="code"
                      default="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}" /> 

                    <x-select 
                      name="code_program_3" 
                      id="code_program_3" label="{{ Settings::trans('Program Code(3)','د برنامی کوډ(۳)','کود برنامه(۳)') }}"
                      col="col-sm-6"
                      required="1"
                      :list="$code_program_3" 
                      :is_livewire='0'
                      value="program_code"
                      text="program_code"
                      default="{{ Settings::trans('Program Code(3)','د برنامی کوډ(۳)','کود برنامه(۳)') }}" /> 

                    <x-select 
                      name="code_fund_4" 
                      id="code_fund_4" label="{{ Settings::trans('Fund Code(4)','د وجه کوډ(۴)','کود وجه(۴)') }}"
                      col="col-sm-6"
                      required="1"
                      :list="$code_fund_4" 
                      :is_livewire='0'
                      value="sub_fund_code"
                      text="sub_fund_code"
                      default="{{ Settings::trans('Fund Code(4)','د وجه کوډ(۴)','کود وجه(۴)') }}" /> 

                    <x-select 
                      name="code_province_2" 
                      id="code_province_2" label="{{ Settings::trans('Province Code(2)','د ولایت کوډ(۲)','کود ولایت(۲)') }}"
                      col="col-sm-6" 
                      required="1"
                      :list="$code_location_2" 
                      :is_livewire='0'
                      value="prov_code"
                      text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}"
                      text="prov_code"
                      default="{{ Settings::trans('Province Code(2)','د ولایت کوډ(۲)','کود ولایت(۲)') }}" /> 

                    <x-select 
                      name="code_object_2" 
                      id="code_object_2" label="{{ Settings::trans('Object Code(2)','د باب کوډ(۲)','کود باب(۲)') }}"
                      default="{{ Settings::trans('Object Code(2)','د باب کوډ(۲)','کود باب(۲)') }}" 
                      col="col-sm-6" 
                      required="1"
                      :list="$code_objects_2" 
                      :is_livewire='0'
                      value="major_code"
                      text="major_code" />

                    <x-input 
                        required="1"
                        name="amount" 
                        id="amount" label="{{ Settings::trans('Amount (AFN)','اندازه (افغانی)','مقدار (افغانی)') }}"
                        placeholder="{{ Settings::trans('Amount (AFN)','اندازه (افغانی)','مقدار (افغانی)') }}"
                        type="number" 
                        col="col-sm-12" /> 


                    <div class="col-sm-12 my-4">
                        <button class="btn btn-info" type="submit">
                            <i class="fa fa-save"></i> {{ Settings::trans('Save','ثبت','ثبت')
                            }}
                        </button>
                        <a href="{{ route('finance.budget.dev.plan.b3.index',$budget_plan->id) }}"
                            class="btn btn-secondary">
                            <i class="fa fa-times"></i> {{
                            Settings::trans('Cancel','لغوه','لغوه') }}
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-sm-3"></div>
        </div>
    </form>
</x-backend.shared.page-container>
@endsection @push('scripts')
<script>
    $("#year").persianDatepicker({
        showGregorianDate: false,
        months: [
            "حمل",
            "ثور",
            "جوزا",
            "سرطان",
            "اسد",
            "سنبله",
            "میزان",
            "عقرب",
            "قوس",
            "جدی",
            "دلوه",
            "حوت",
        ],
        formatDate: "YYYY-MM-DD",
        onSelect: function () { },
    });

    $("#frm-add").submit(function (e) {
        e.preventDefault();

        //validate form data
        if (
            validate_field("code_org_3") ||
            validate_field("budget_dev_approveds_id") ||
            validate_field("code_program_3") ||
            validate_field("code_fund_4") ||
            validate_field("code_loaction") ||
            validate_field("code_object_2") ||
            validate_field("amount")
        ) {
            toastr["error"]("Validation Failed!");
            return;
        }

        $.ajax({
            url: "{{ route('finance.budget.dev.plan.b3.store',$budget_plan->id) }}",
            type: "POST",
            data: $("#frm-add").serialize(),
            success: function (response) {
                if (response.result == 200) {
                    toastr["success"]("Saved Successfully");
                    $('#projects').html(response.projects);
                    document.getElementById('frm-add').reset();
                    $('#code_org_3').val('').change();
                    $('#code_program_3').val('').change();
                    $('#code_fund_4').val('').change();
                    $('#code_loaction').val('').change();
                    $('#code_object_2').val('').change();
                } else if (response.result == 500) {
                    toastr["error"](response.msg);
                }
            },
        });
    });
</script>

@endpush