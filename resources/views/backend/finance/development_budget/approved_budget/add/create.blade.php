@extends('backend.layout.base') @section('page_title') {{ Settings::trans('Add
Budget Development Project','د انکشافي بودیجی پروژی اضافه کول','اضافه نمودن
پروژه بودجه انکشافی') }} @endsection @section('page_nav')
<li class="breadcrumb-item active">
    <a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a>
</li>
<li class="breadcrumb-item active">
    <a href="{{ route('finance.budget.dev.plan.edit',$budget_plan->id) }}">{{ Settings::trans('Development Budget
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
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <div class="row">
                    @csrf
                    <input type="hidden" name="budget_plan_id" value="{{ $budget_plan->id }}" />
                    <div class="col-sm-12 border-bottom my-4">
                        <h5 class="my-4">
                            {{ Settings::trans('Project Information Form','د پروژی معلوماتو
                            فورم','فورم معلومات پروژه') }}
                        </h5> 
                    </div>
                    <x-select 
                      name="code" 
                      id="code" label="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}"
                      col="col-sm-6"
                      required="1"
                      :list="$code_project_6" 
                      :is_livewire='0'
                      value="code"
                      text="code"
                      default="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}" />

                    <x-input name="project_name" id="project_name" required="1"
                        label="{{ Settings::trans('Project Name','د پروژی نوم','اسم پروژه') }}" col="col-sm-6"
                        placeholder="{{ Settings::trans('Enter Project Name','د پروژی نوم ولیکئ','اسم پروژه نوشته کنید') }}" />
                    <x-input name="year" id="year" required="1" readonly type="text"
                        placeholder="{{ Settings::trans('Select Date','تاریخ انتخاب کړئ','انتخاب تاریخ') }}"
                        label="{{ Settings::trans('Start Year','د شروع کال','سال آغاز') }}" col="col-sm-6"
                        placeholder="{{ Settings::trans('Start Year','د شروع کال','سال اغاز') }}" />

                    <x-select name="doner_id" id="doner_id"
                        label="{{ Settings::trans('Donor','تمویلونکی','تمویل کننده') }}" col="col-sm-6" required="1"
                        :list="$code_donors" :is_livewire="0" value="id"
                        text="{{ Settings::trans('en_name','pa_name','da_name') }}"
                        default="{{ Settings::trans('Donor','تمویلونکی','تمویل کننده') }}" />

                    <x-select name="is_intentional" id="is_intentional"
                        label="{{ Settings::trans('Tentional/Intentional','اختیاري/غیراختیاري','اختیاری/غیراختیاری') }}"
                        col="col-sm-6" required="1" :list="Settings::tentional_or_intentional()" :is_livewire="0"
                        value="id" text="{{ Settings::trans('en_name','pa_name','da_name') }}"
                        default="{{ Settings::trans('Tentional/Intentional','اختیاري/غیراختیاري','اختیاری/غیراختیاری') }}" />

                    <x-input name="employees_count" id="employees_count" required="1"
                        label="{{ Settings::trans('Employees Count','کارمندانو تعداد','تعداد کارمندان ') }}"
                        col="col-sm-6"
                        placeholder="{{ Settings::trans('Employees Count','د داخلي حمایوي تخنیکي کارمندانو تعداد','کارمندان حمایوی تخنیکی داخلی') }}" />

                    <x-input name="budget_amount" id="budget_amount" required="1"
                        label="{{ Settings::trans('Budget Amount','د بودیجی ارقام','ارقام بودجه') }}"
                        col="col-sm-12"
                        placeholder="{{ Settings::trans('Enter Budget Amount','د بودیجی ارقام','ارقام بودجه') }}" />

                    <div class="col-sm-12 my-4">
                        <button class="btn btn-info" type="submit">
                            <i class="fa fa-save"></i> {{ Settings::trans('Save','ثبت','ثبت')
                            }}
                        </button>
                        <a href="{{ route('finance.budget.dev.plan.edit',$budget_plan->id) }}"
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
            validate_field("code") ||
            validate_field("project_name") ||
            validate_field("year") ||
            validate_field("doner_id") ||
            validate_field("is_intentional") ||
            validate_field("employees_count") ||
            validate_field("budget_amount")
        ) {
            toastr["error"]("Validation Failed!");
            return;
        }

        $.ajax({
            url: "{{ route('finance.budget.dev.plan.create',$budget_plan->id) }}",
            type: "POST",
            data: $("#frm-add").serialize(),
            success: function (response) {
                if (response.result == 200) {
                    toastr["success"]("Saved Successfully");
                    document.getElementById('frm-add').reset();
                    $('#code').val('').change();
                    
                } else if (response.result == 500) {
                    toastr["error"](response.msg);
                }
            },
        });
    });
</script>

@endpush