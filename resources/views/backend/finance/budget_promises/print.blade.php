@extends('backend.layout.print_base')
@section('contents')
<style>
    th,td{
        vertical-align: middle !important;
        text-align: center;
    }
</style>
<div class="text-center">
    <p class="mb-0 font-weight-bold">{{ Settings::trans('Budget Plan Promises List','د '.substr(Settings::change_to_hijri($budget_plan->year),0,4).' کال تعهداتو لیست','تعهدات بخش مصارفات سال مالی'.substr(Settings::change_to_hijri($budget_plan->year),0,4)) }}</p>
</div>

<table class="table table-sm table-bordered" id="main-tbl">
    <thead id="tbl-head">
        <tr>
            <td class="bg-light">{{ Settings::trans('NO.','ګڼه','شماره') }}</td>
            <td class="bg-light">{{ Settings::trans('Authority of the undertaker','تعهد اخیستونکی مرجع','مرجع تعهد ګیرنده') }}</td>
            <td class="bg-light">{{ Settings::trans('Topic','د تعهد موضوع','موضوع تعهد') }}</td>
            <td class="bg-light">{{ Settings::trans('SendingNo(Sadira No.)','د صادره ګڼه','شماره صادره') }}</td>
            <td class="bg-light">{{ Settings::trans('Date','مکتوب تاریخ','تاریخ مکتوب') }}</td>
            <td class="bg-light">{{ Settings::trans('Object Code','بودیجوي کوډ','کود بودیجوی') }}</td>
            <td class="bg-light">{{ Settings::trans('Object Code (5)','تصنیف','تصنیف') }}</td>
            <td class="bg-light">{{ Settings::trans('Promised Amount','وعده کړل شوی مبلغ','مبلغ تعهد داده شده') }}</td>
            <td class="bg-light">{{ Settings::trans('Paid Amount','ادا شوی مبلغ','مبلغ تعهدات اجرا شده') }}</td>
        </tr>
    </thead>
<tbody id="tbl-body">
    @foreach($budget_plan_promises as $item)
        <tr id="row-{{ $item->id }}">
          <td>{{ $loop->index+1 }}</td>
          <td>{{ Settings::trans($item->dept_en_name,$item->dept_pa_name,$item->dept_da_name) }}</td>
          <td>{{ $item->details }}</td>
          <td>{{ $item->sadira_no }}</td>
          <td>{{ $item->maktoob_date }}</td>
          <td>{{ substr($item->object_code_5,0,2) }}</td>
          <td>{{ $item->object_code_5 }}</td>
          <td>{{ $item->promise_amount }}</td>
          <td>{{ $item->paid_amount }}</td>
        </tr>
    @endforeach
</tbody>
</table>
@endsection

<script>
    window.print();
</script>