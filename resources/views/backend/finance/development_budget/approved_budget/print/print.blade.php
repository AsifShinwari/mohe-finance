@extends('backend.layout.print_base')

@section('contents')
  <style>
    td{
      vertical-align: middle !important;
    }
    th{
      vertical-align: middle;
    }
  </style>
  
  <div class="row m-0 border-bottom">
    <div class="col-sm-3 d-flex justify-content-center align-items-center my-4" style="height: 100px;">
        <img src="{{ asset('eia-logo.png') }}" alt="{{ Settings::get()->abbr }} Logo" 
        class="brand-image img-circle elevation-3" style="opacity: .8; max-height: 88px;">
    </div>
    <div class="col-sm-6 text-center my-4">
      <p class="mb-0">{{ Settings::trans('Islamic Emart of Afghanistan','د افغانستان اسلامي امارت','امارت اسلامی افغانستان') }}</p>
      <p class="mb-0">{{ Settings::trans('Ministry of Finance','د مالیی وزارت','وزارت مالیه') }}</p>
      <p class="mb-0">{{ Settings::trans('Deputy of Finance','مالي معینیت','معینیت مالی') }}</p>
      <p class="mb-0">{{ Settings::trans('General Direct of National Budget','د ملي بودیجی عمومي ریاست','ریاست عمومی بودیجه ملی') }}</p>
    </div>
    <div class="col-sm-3 d-flex justify-content-center align-items-center my-4" style="height: 100px;">
        <img src="{{ asset(Settings::get()->small_logo) }}" alt="{{ Settings::get()->abbr }} Logo" 
        class="brand-image img-circle elevation-3" style="opacity: .8; max-height: 88px;">
    </div>

  </div>

  <div class="row m-0">
    <div class="col-sm-12">
      <h6 class="my-3">{{ Settings::trans('Table 3: Development budget for the financial year '.substr(Settings::change_to_hijri($budget_plan->year),0,4).' based on the project',
        'دریم جدول: د پروژې پر بنسټ د '.substr(Settings::change_to_hijri($budget_plan->year),0,4).' مالي کال پراختیایي بودیجه',
        'جدول ۳: بودجه انکشافی سال مالی '.substr(Settings::change_to_hijri($budget_plan->year),0,4).' به اساس پروژه') }}</h6>
    </div>
    <div class="col-sm-12 bg-light p-2 border text-center">
      <b class="mb-0">{{ Settings::trans('Ministry of Higher Education','د لوړو ذده کړو وزارت','وزارت تحصیلات علی') }}</b>         
    </div>
  </div>


    <div class="table-responsive" id="tbl-container">
    <table class="table table-sm table-bordered" id="main-tbl">
    <thead id="tbl-head">
      <tr>
        <td class="bg-light text-center">{{ Settings::trans('NO.','ګڼه','شماره') }}</td>
        <td class="bg-light text-center">{{ Settings::trans('Code','د پروژی کوډ','کود پروژه') }}</td>
        <td class="bg-light text-center">{{ Settings::trans('Project Name','د پروژی نوم','اسم پروژه') }}</td>
        <td class="bg-light text-center">{{ Settings::trans('Start Year','د شروع کال','سال آغاز') }}</td>
        <td class="bg-light text-center">{{ Settings::trans('Donor','تمویلونکئ','تمویل کننده') }}</td>
        <td class="bg-light text-center">{{ Settings::trans('Intentional','اختیاري/غیراختیاري','اختیاری/غیراختیاری') }}</td>
        <td class="bg-light text-center">{{ Settings::trans('Employees','داخلي حمایوي تخنیکي کارمندانو تعداد','کارمندان حمایوی تخنیکی داخلی تعداد') }}</td>
        <td class="bg-light text-center">{{ Settings::trans('Budget Amount','بودیجه','بودجه') }}</td>
      </tr>
    </thead>
<tbody id="tbl-body">
  @foreach($data as $item)
    <tr id="row-{{ $item->id }}">
      <td>{{ $loop->index+1 }}</td>
      <td>{{ $item->code }}</td>
      <td>{{ $item->project_name }}</td>
      <td>{{ substr(Settings::change_to_hijri($item->year),0,4) }}</td>
      <td>{{ Settings::trans($item->donor_en_name,$item->donor_pa_name,$item->donor_da_name) }}</td>
      <td>
        @if($item->is_intentional)
          {{ Settings::trans('Atentional','اختیاري','اختیاری') }}
        @else
          {{ Settings::trans('Intenional','غیراختیاري','غیراختیاری') }}
        @endif
      </td>
      <td>{{ ($item->employees_count==0) ? '-' : $item->employees_count }}</td>
      <td>{{ $item->budget_amount }}</td>
    </tr>
  @endforeach
</tbody>

</table>
</div>
@endsection

@push('scripts')
    <script>
      window.print();
    </script>
@endpush  