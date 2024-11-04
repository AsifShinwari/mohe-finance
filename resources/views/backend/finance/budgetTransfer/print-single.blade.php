@extends('backend.layout.print_base')
@section('contents')
<style>
    th,td{
        vertical-align: middle !important;
        text-align: center;
    }
</style>
<p class="text-center">
    <img src="{{ asset(Settings::get()->small_logo) }}" alt="{{ Settings::get()->abbr }} Logo" 
    class="img-circle elevation-3" style="opacity: .8;max-height: 95px !important;">
</p>
<div class="text-center">
    <p class="mb-0 font-weight-bold">{{ Settings::trans('Islamic Emart of Afghanistan','د افغانستان اسلامي امارت','امارت اسلامی افغانستان') }}</p>
    <p class="mb-0 font-weight-bold">{{ Settings::trans('Ministry of Finance','د مالیی وزارت','وزارت مالیه') }}</p>
    <p class="mb-0 font-weight-bold">{{ Settings::trans('General Direct of National Budget','د ملي بودیجی عمومي ریاست','ریاست عمومی بودیجه ملی') }}</p>
    <p class="mb-0 font-weight-bold">{{ substr(Settings::change_to_hijri($budget_plan->year),0,4) }}</p>
</div>
<table class="table table-sm table-bordered">
    <thead class="bg-light">
        <tr>
            <th colspan="8" class="text-center">
                {{ Settings::trans('Budget Transfer Form (Approved Budget)','د ب ۲۳ فورم (د نظور شوی بودیجی تعدیل)','فورم ب ۲۳ تعدیل بودجه منظور شده') }}
            </th>
        </tr>
        <tr>
            <th colspan="4">{{ Settings::trans('Organization','بودیجوي واحد','واحد بودجوی') }}</th>
            <th colspan="4">{{ Settings::trans('AFMIS Reg. No.','د افمس ثبت ګڼه','شماره ثبت افمس') }}</th>
        </tr>
        <tr>
            <th colspan="4">{{ Settings::trans('Ministry of Higher Education','د لوړو زده کړو وزارت','وزارت تحصیلات عالی') }}</th>
            <th colspan="4">{{ $transfer->afmis_reg_no }}</th>
        </tr>
        <tr>
            <th colspan="3">{{ Settings::trans('Created By','ترتیب شوی','ترتیب شده') }}</th>
            <th colspan="3">{{ Settings::trans('Approved By','منظور شوی (آمر اعطا)','منظور شده توسط (امر اعطا)') }}</th>
            <th rowspan="2">{{ Settings::trans('Sending No.','صادره ګڼه','نمبر صادره') }}</th>
            <th rowspan="2">{{ Settings::trans('Sending Date','د صادری تاریخ','تاریخ صادره') }}</th>

        </tr>
        <tr>
            <th colspan="3">{{ $budget_plan->b10_gnrl_bgt_mgr }}</th>
            <th colspan="3">{{ $budget_plan->b10_gnrl_drctr }}</th>
        </tr>
        <tr>
            <th colspan="3">{{ Settings::trans('General Budget Manager','د بودیجی عمومي مدیر','مدیر عمومی بودجه') }}</th>
            <th colspan="3">{{ Settings::trans('General Director','اداري او مالي معین','معین اداری و مالی') }}</th>
            <th>{{ $transfer->sending_no }}</th>
            <th>{{ $transfer->sending_date }}</th>
        </tr>
        <tr>
            <th colspan="4">{{ Settings::trans('Needs of Ministry By Letters','د وزارت تقاضا په حرفونو','تقاضا وزارت مربوط به حروف') }}</th>
            <th colspan="4">{{ Settings::trans('National Budget General Directorates','دملی بودیجی تجویز عمومي ریاست','تجویز ریاست عمومی بودجه ملی') }}</th>
        </tr>
        <tr>
            <th colspan="4">{{ $transfer->needs_in_letters }}</th>
            <th colspan="4">{{ $transfer->prescription_gnrl_drctr }}</th>
        </tr>
    </thead>
    <tbody>
        <tr class="bg-light">
            <td rowspan="2">{{ Settings::trans('Org(3)','وزارت(۳)','وزارت(۳)') }}</td>
            <td rowspan="2">{{ Settings::trans('Project(6)','پروژه(۶)','پروژه(۶)') }}</td>
            <td rowspan="2">{{ Settings::trans('Program(3)','برنامه(۳)','برنامه(۳)') }}</td>
            <td rowspan="2">{{ Settings::trans('Fund(4)','وجه(۴)','وجه(۴)') }}</td>
            <td rowspan="2">{{ Settings::trans('Province(2)','ولایت(۲)','ولایت(۲)') }}</td>
            <td rowspan="2">{{ Settings::trans('Major(2)','باب(۲)','باب(۲)') }}</td>
            <td colspan="2">{{ Settings::trans('Transfer Amount','د تعدیل مبلغ','مبلغ قابل تعدیل') }}</td>
        </tr>
        <tr class="bg-light">
            <td>{{ Settings::trans('Dr(+)','تزئید','تزئید') }}</td>
            <td>{{ Settings::trans('Cr(-)','تنقیص','تنقیص') }}</td>
        </tr>
        <tr class="text-primary">
            <td>{{ $transfer->b10_code_org_3 }}</td>
            <td>{{ $transfer->b10_code_project_6 }}</td>
            <td>{{ $transfer->b10_code_program_3 }}</td>
            <td>{{ $transfer->b10_code_fund_4 }}</td>
            <td>{{ $transfer->b10_code_loaction }}</td>
            <td>{{ $transfer->b10_code_object_2 }}</td>
            <td>{{ $transfer->dr }}</td>
            <td>{{ $transfer->cr }}</td> 
        </tr>
        <tr class="text-primary">
            <td>{{ $transfer->code_org_3 }}</td>
            <td>{{ $transfer->code_project_6 }}</td>
            <td>{{ $transfer->code_program_3 }}</td>
            <td>{{ $transfer->code_fund_4 }}</td>
            <td>{{ $transfer->code_loaction }}</td>
            <td>{{ $transfer->code_object_2 }}</td>
            <td>{{ ($transfer->dr==0) ? $transfer->cr : '0' }}</td>
            <td>{{ ($transfer->cr==0) ? $transfer->dr : '0' }}</td>
        </tr>
        <tr class="text-primary">
            <td>&nbsp;</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr class="text-primary">
            <td>&nbsp;</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr class="text-primary">
            <td>&nbsp;</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr class="font-weight-bold bg-light">
            <td colspan="6">{{ Settings::trans('Total','مجموعه','مجموع') }}</td>
            <td>{{ $transfer->dr }}</td>
            <td>{{ $transfer->cr }}</td>
        </tr>
        <tr>
            <td colspan="2">{{ Settings::trans('Job Title','دنده','وظیفه') }}</td>
            <td colspan="2">{{ Settings::trans('General Sector Manager','د سکتور آمر','امر سکتور') }}</td>
            <td colspan="2">{{ Settings::trans('CEO of National Budget','د ملي بودیجی اجرائیوي رئیس','رئیس اجرائیوی بودجه ملی') }}</td>
            <td colspan="2">{{ Settings::trans('General Director of National Budget','د ملي بودیجی عمومي رئیس','رئیس عمومی بودجه ملی') }}</td>
        </tr>
        <tr>
            <td colspan="2">{{ Settings::trans('Signature','امضا','امضا') }}</td>
            <td colspan="2"></td>
            <td colspan="2"></td>
            <td colspan="2"></td>
        </tr>
        <tr>
            <td colspan="2">{{ Settings::trans('Date','تاریخ','تاریخ') }}</td>
            <td colspan="2"></td>
            <td colspan="2"></td>
            <td colspan="2"></td>
        </tr>

        <tr>
            <td colspan="6"></td>
            <td colspan="2">{{ Settings::trans('Ministry of Finance','د مالیی وزارت مقام','مقام وزارت مالیه') }}</td>
        </tr>
    </tbody>
</table>
@endsection