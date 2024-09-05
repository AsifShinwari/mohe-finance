@extends('backend.layout.print_base')
@section('contents')
    <style>
        td{ vertical-align: middle !important; }
    </style>
    <table class="table table-sm table-bordered mb-0">
        <thead class="text-center">
            <tr>
                
                <td colspan="2">{{ Settings::trans('Organization','بودیجوي واحد','واحد بودجوی') }}</td>
                <td colspan="2">{{ Settings::trans('Ministry of Higher Education','د لوړو ذده کړو وزارت','وزارت تحصیلات علی') }}</td>

                <td rowspan="5" class="text-center" style="border-left: 0px !important;vertical-align:middle;padding-right:40px !important;">
                    <img src="{{ asset(Settings::get()->small_logo) }}" alt="{{ Settings::get()->abbr }} Logo" 
                    class="brand-image img-circle elevation-3" style="opacity: .8;max-height: 88px !important; margin-left:0px !important;">
                </td>
                <td rowspan="5" style="border-right: 0px !important;vertical-align:middle;" class="text-center">
                    <p class="mb-0">{{ Settings::trans('Islamic Emart of Afghanistan','د افغانستان اسلامي امارت','امارت اسلامی افغانستان') }}</p>
                    <p class="mb-0">{{ Settings::trans('Ministry of Finance','د مالیی وزارت','وزارت مالیه') }}</p>
                    <p class="mb-0">{{ Settings::trans('General Direct of National Budget','د ملي بودیجی عمومي ریاست','ریاست عمومی بودیجه ملی') }}</p>
                    <p class="mb-0">{{ Settings::trans('Budget Plan Form B10','د عادي بودیجی تقسیمات په مرکز او ولایاتو کی، د ب-۱۰ فورم','فورم ب-۱۰ تقسیمات بودجه عادی در سطح مرکز و ولایات بودجه یک ماهه سال') }}</p>
                </td>

            </tr>
            <tr>
                <td>{{ Settings::trans('Position','دنده','وظیفه') }}</td>
                <td>{{ Settings::trans('General Budget Manager','د عمومي بودیجی مدیریت','مدیریت عمومی بودجه') }}</td>
                <td>{{ Settings::trans('Admin & Finance Director','مالي او حسابي رئیس','رئیس مالی و حسابی') }}</td>
                <td>{{ Settings::trans('Admin & Finance General Director','اداري او مالي معین','معین اداری و مالی') }}</td>
            </tr>
            <tr>
                <td>{{ Settings::trans('Name','نوم','اسم') }}</td>
                <td>{{ $budget_plan->b10_gnrl_bgt_mgr }}</td>
                <td>{{ $budget_plan->b10_finance_drctr }}</td>
                <td>{{ $budget_plan->b10_gnrl_drctr }}</td>
            </tr>
            <tr>
                <td>{{ Settings::trans('Sign','امضا','امضا') }}</td>
                <td><br><br></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>شماره ثبت افمس</td>
                <td colspan="3">{{ $budget_plan->b10_afmis_reg_no }}</td>
            </tr>
        </thead>
    </table>
    <table class="table table-sm table-bordered" id="main-tbl">
            <thead id="tbl-head">
                <th class="bg-light">{{ Settings::trans('Organization (3)','اداره (۳)','اداره (۳)') }}</th>
                <th class="bg-light">{{ Settings::trans('Project Code(6)','د پروژی کوډ (۶)','کود پروژه (۶)') }}</th>
                <th class="bg-light">{{ Settings::trans('Program Code(3)','برنامه (۳)','برنامه(۳)') }}</th>
                <th class="bg-light">{{ Settings::trans('Fund Code(4)','وجه(۴)','وجه(۴)') }}</th>
                <th class="bg-light">{{ Settings::trans('Province Code','د ولایت کوډ','کود ولایت') }}</th>
                <th class="bg-light">{{ Settings::trans('Province Code','ولایت','ولایت') }}</th>
                
                @foreach($code_objects_2 as $major)
                  <th>{{ $major->major_code }}</th>
                @endforeach

                <th class="bg-light">{{ Settings::trans('Total','مجموعه','مجموعه') }}</th>
            </thead>
            @php $budget_plan_id = 0; @endphp
<tbody id="tbl-body">
@foreach($b10 as $item)
  @php $budget_plan_id = $item->budget_plan_id; @endphp
    <tr>
      <td class="bg-light">{{ $item->code_org_3 }}</td>
      <td class="bg-light">{{ $item->code_project_6 }}</td>
      <td class="bg-light">{{ $item->code_program_3 }}</td>
      <td class="bg-light">{{ $item->code_fund_4 }}</td>
      <td class="bg-light">{{ ($item->code_loaction<10) ? '0'.$item->code_loaction : $item->code_loaction }}</td>
      <td class="bg-light">{{ Settings::trans($item->en_prov_name,$item->pa_prov_name,$item->da_prov_name) }}</td>
      @php $sub_total=0; @endphp
      @foreach($code_objects_2 as $major)
        @php  $amount = App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::get_major_amount($budget_plan_id,$item->code_org_3,$item->code_project_6,$item->code_program_3,$item->code_fund_4,$item->code_loaction,$major->major_code);
            if($code_object_2==null){
                $sub_total+=$amount;
            }elseif($code_object_2!=null && $code_object_2==$major->major_code){
                $sub_total+=$amount;
            }
        @endphp
        <td>
            <span class="text-primary">
                    @if($code_object_2==null)
                        {{ $amount }}
                    @elseif($code_object_2!=null && $code_object_2==$major->major_code)
                        {{ $amount }}
                    @else
                     0
                    @endif
            </span>
        </td>
      @endforeach
      <td class="bg-light font-weight-bold">{{ $sub_total }}</td>
    </tr>

@endforeach
</tbody>

    <tfoot class="bg-light" id="tbl-foot">
      <th class="text-center" colspan="6">{{ Settings::trans('Total','مجموعه','مجموعه') }}</th>

      @php $all_total = 0; @endphp
      @foreach($code_objects_2 as $code_object)
      @php $total = App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::get_major_total_amount($budget_plan_id,$code_object->major_code);
            if($code_object_2==null){
                $all_total+=$total;
            }elseif($code_object_2!=null && $code_object_2==$code_object->major_code){
                $all_total+=$total;
            }
      @endphp
      <th>
        @if($code_object_2==null)
            {{ $total }}    
        @elseif($code_object_2!=null && $code_object_2==$code_object->major_code)
            {{ $total }}
        @else
         0
        @endif
      </th>
      @endforeach
      <th>{{ $all_total }}</th>
    </tfoot>
    </table>

    <div class="row">
        <div class="col-sm-6">
            <table class="table table-sm table-bordered">
                <thead>
                    <tr>
                        <td>{{ Settings::trans('Job Title','دنده','وظیفه') }}</td>
                        <td>{{ Settings::trans('General Sector Manager of National Budget','ملي بودیجی سکتوري آمر','آمر سکتور بودجه ملی') }}</td>
                        <td>{{ Settings::trans('CEO of Nationl Budget','د ملي بودیجی اجرائیوي رئیس','رئیس اجرائیوي بودجه ملی') }}</td>
                    </tr>
                    <tr>
                        <td>{{ Settings::trans('Date','تاریخ','تاریخ') }}</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>{{ Settings::trans('Sign','امضا','امضا') }}</td>
                        <td></td>
                        <td></td>
                    </tr>
                </thead>
            </table>
        </div>
        <div class="col-sm-3"></div>
        <div class="col-sm-3">
            <table class="table table-sm table-bordered">
                <thead>
                    <tr>
                        <td colspan="2">{{ Settings::trans('AFMIA Registrar','مسول ثبت کننده افمس','د افمس ثبت کوونکی') }}</td>
                    </tr>
                    <tr>
                        <td width="20%">{{ Settings::trans('Date','تاریخ','تاریخ') }}</td>
                        <td width="80%"></td>
                    </tr>
                    <tr>
                        <td>{{ Settings::trans('Sign','امضا','امضا') }}</td>
                        <td></td>
                    </tr>
                </thead>
            </table>
        </div>
    </div>

@endsection