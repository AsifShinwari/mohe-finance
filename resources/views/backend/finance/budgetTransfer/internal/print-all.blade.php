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
    <p class="mb-0 font-weight-bold">{{ $budget_plan->year }}</p>
    <p class="mb0 font-weight-bold">{{ Settings::trans('Budget Plan Transfers','داخلي تعدیلات','تعدیلات داخلي') }}</p>
</div>

<table class="table table-sm table-bordered" id="main-tbl">
    <thead id="tbl-head">
      <tr>
        <th class="bg-light">{{ Settings::trans('Sending#','صادره ګڼه','نمبر صادره') }}</th>
        <th class="bg-light">{{ Settings::trans('Sending Date','د صادره تاریخ','تاریخ صادره') }}</th>
        <th class="bg-light">{{ Settings::trans('AFMIS-Reg-#','افمس ثبت ګڼه','شماره ثبت افمس') }}</th>
        <th class="bg-light" title="{{ Settings::trans('Org(5) - Project(6) - Program(3) - Fund(4) - Location(2) - Object(2)','وزارت(3) - پروژه(6) - برنامه(3) - وجه(4) - ولایت(2) - باب(2)','وزارت(3) - پروژه(6) - برنامه(3) - وجه(4) - ولایت(2) - باب(2)') }}">
          {{ Settings::trans('Code (Dr+)','تزئید شوی کوډ','کود (تزئید شده)') }}</th>
        <th class="bg-light" title="{{ Settings::trans('Org(5) - Project(6) - Program(3) - Fund(4) - Location(2) - Object(2)','وزارت(3) - پروژه(6) - برنامه(3) - وجه(4) - ولایت(2) - باب(2)','وزارت(3) - پروژه(6) - برنامه(3) - وجه(4) - ولایت(2) - باب(2)') }}">
          {{ Settings::trans('Code (Cr-)','تنقیص شوی کوډ','کود تنقیص شده') }}</th>
        <th class="bg-light">{{ Settings::trans('Amount(Dr+)','تزئید شوی رقم','مقدار تزئید شده') }}</th>
        <th class="bg-light">{{ Settings::trans('Amount(Cr-)','تنقیص شوی ارقام','مقدار تنقیص شده') }}</th>
      </tr>
    </thead>
<tbody id="tbl-body">
@php $total_dr = 0; $total_cr = 0; @endphp
@foreach($transfers as $item)
    <tr>
      <td>{{ $item->sending_no }}</td>
      <td>{{ $item->sending_date }}</td>
      <td>{{ $item->afmis_reg_no }}</td>
      <td class="text-success" title="{{ Settings::trans('Org(5) - Project(6) - Program(3) - Fund(4) - Location(2) - Object(2)','وزارت(3) - پروژه(6) - برنامه(3) - وجه(4) - ولایت(2) - باب(2)','وزارت(3) - پروژه(6) - برنامه(3) - وجه(4) - ولایت(2) - باب(2)') }}">
        @if($item->dr!=0)
           {{ $item->b20_code_org_4 }} - {{ $item->b20_code_project_6 }} 
          - {{ $item->b20_code_program_3 }} - {{ $item->b20_code_fund_4 }} -
          {{ ($item->b20_code_loaction<9) ? '0'.$item->b20_code_loaction : $item->b20_code_loaction }}
          - {{ $item->b20_code_object_2 }} - {{ Settings::get_month_col($item->from_month)}}
         @else
         {{ $item->code_org_4 }} - {{ $item->code_project_6 }}
          - {{ $item->code_program_3 }} - {{ $item->code_fund_4 }}
          - {{ ($item->code_loaction<9) ? '0'.$item->code_loaction : $item->code_loaction }} - {{ $item->code_object_2 }}
          - {{ Settings::get_month_col($item->to_month)}}
         @endif
      </td>
      <td class="text-danger">
       @if($item->dr!=0)
          {{ $item->code_org_4 }} - {{ $item->code_project_6 }}
          - {{ $item->code_program_3 }} - {{ $item->code_fund_4 }}
          - {{ ($item->code_loaction<9) ? '0'.$item->code_loaction : $item->code_loaction }} - {{ $item->code_object_2 }} - {{ Settings::get_month_col($item->to_month)}}
         @else
         {{ $item->b20_code_org_4 }} - {{ $item->b20_code_project_6 }} 
          - {{ $item->b20_code_program_3 }} - {{ $item->b20_code_fund_4 }} -
          {{ ($item->b20_code_loaction<9) ? '0'.$item->b20_code_loaction : $item->b20_code_loaction }}
          - {{ $item->b20_code_object_2 }} - {{ Settings::get_month_col($item->from_month)}}
         @endif
      </td>
      <td>{{ $item->dr }}</td>
      <td>{{ $item->cr }}</td>
        @php $total_dr += $item->dr; $total_cr += $item->cr; @endphp
    </tr>
  @endforeach

  <tr class="bg-light font-weight-bold">
    <td colspan="5">Total</td>
    <td>{{ $total_dr }}</td>
    <td>{{ $total_cr }}</td>
  </tr>
</tbody>
</table>

@endsection

<script>
    window.print();
</script>