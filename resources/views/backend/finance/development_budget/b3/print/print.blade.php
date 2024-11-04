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
    <div class="col-sm-4 d-fle justify-content-center align-items-center my-4" style="">
        <table class="table table-sm table-bordered">
            <tbody>
            <tr>
                <td>{{ Settings::trans('Financial Year','مالي کال','سال مالی') }}</td>
                <td>{{ substr(Settings::change_to_hijri($budget_plan->year),0,4) }}</td>
            </tr>
            <tr>
                <td>{{ Settings::trans('Ministry','وزارت','وزارت') }}</td>
                <td>{{ Settings::trans('Ministry of Higher Education','د لوړو ذده کړو وزارت','وزارت تحصیلات علی') }}</td>
            </tr>
            <tr>
                <td>{{ Settings::trans('AFMIS Reg#','د افمس ثبت ګڼه','شماره ثبت افمس') }}</td>
                <td class="p-0">
                    <input type="text" class="form-control border-0" placeholder="Please Enter AFMIS Reg#">
                </td>
            </tr>
            <tr class="no-print">
                <td colspan="2">
                    <button class="btn btn-secondary btn-sm btn-block" onclick="print_page()">
                        <i class="fa fa-print"></i>
                    </button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="col-sm-5 text-center my-4">
        <p>
            <img src="{{ asset('eia-logo.png') }}" alt="{{ Settings::get()->abbr }} Logo" 
             style="max-height: 88px;">
        </p>
      <p class="mb-0">{{ Settings::trans('Islamic Emart of Afghanistan','د افغانستان اسلامي امارت','امارت اسلامی افغانستان') }}</p>
      <p class="mb-0">{{ Settings::trans('Ministry of Finance','د مالیی وزارت','وزارت مالیه') }}</p>
      <p class="mb-0">{{ Settings::trans('General Direct of Budget','د بودیجی عمومي ریاست','ریاست عمومی بودیجه') }}</p>
      <p class="mb-0">{{ Settings::trans(
        'Form B 3: Distributions of the development budget at the level of the center and provinces',
        'ب 3 فورم: د مرکز او ولایتونو په کچه د پراختیایي بودیجې ویش',
        'فورم ب ۳: تقسیمات بودجه انکشافی در سطح مرکز و ولایات'
        ) }}</p>
    <p class="mb-0">
        {{ 
            Settings::trans('Financial Year','د بودیجی مالي کال','بودجه سال مالی')
        }}
        {{ substr(Settings::change_to_hijri($budget_plan->year),0,4) }}
    </p>
    </div>
    <div class="col-sm-3 d-fle justify-content-center align-items-center text-center my-4" style="height: 100px;">
        <p class="mb-0 font-weight-bold">{{ Settings::trans('Total Amount/Afghani',
            'مجموعه/افغانۍ',
            'ارقام مکمل به افغانی'
            ) }}</p>
        <p id="total_container" class="mb-0  font-weight-bold"></p>
    </div>

  </div>


    <div class="table-responsive" id="tbl-container">
    <table class="table table-sm table-bordered" id="main-tbl">
    <thead id="tbl-head">
      <tr>
            <th class="bg-light">{{ Settings::trans('NO.','ګڼه','شماره') }}</th>
            <th class="bg-light">{{ Settings::trans('Organization (3)','اداره (۳)','اداره (۳)') }}</th>
            <th class="bg-light">{{ Settings::trans('Project Code(6)','د پروژی کوډ (۶)','کود پروژه (۶)') }}</th>
            <th class="bg-light">{{ Settings::trans('Program Code(3)','برنامه (۳)','برنامه(۳)') }}</th>
            <th class="bg-light">{{ Settings::trans('Fund Code(4)','وجه(۴)','وجه(۴)') }}</th>
            <th class="bg-light">{{ Settings::trans('Province Code','د ولایت کوډ','کود ولایت') }}</th>
            <th class="bg-light">{{ Settings::trans('Province Code','ولایت','ولایت') }}</th>

            @foreach($code_objects_2 as $major)
              <th class="bg-light">{{ $major->major_code }}</th>
            @endforeach

            <th class="bg-light">{{ Settings::trans('Total','مجموعه','مجموعه') }}</th>
      </tr>
    </thead>
<tbody id="tbl-body">
    @php $all_total = 0; $sub_total_arr=[]; @endphp
    @foreach($b3 as $item)
    <tr id="row-{{ $item->id }}">
      <td>{{ $loop->index+1 }}</td>
      <td>{{ $item->code_org_3 }}</td>
      <td>{{ $item->code_project_6 }}</td>
      <td>{{ $item->code_program_3 }}</td>
      <td>{{ $item->code_fund_4 }}</td>
      <td>{{ ($item->code_province_2 < 10) ? '0'.$item->code_province_2 : $item->code_province_2 }}</td>
      <td>{{ Settings::trans($item->en_prov_name,$item->pa_prov_name,$item->da_prov_name) }}</td>
      @php $sub_total = 0; @endphp
      @foreach($code_objects_2 as $index => $major)
        @php  
            $amount = App\Http\Controllers\Backend\Finance\DevelopmentBudget\BudgetDevB3Controller::get_major_amount(
                $budget_plan->id,
                $item->code_org_3,
                $item->code_project_6,
                $item->code_program_3,
                $item->code_fund_4,
                $item->code_province_2,
                $major->major_code
            );

            $sub_total+=$amount;
            isset($sub_total_arr[$major->major_code])
                ?
                    $sub_total_arr[$major->major_code]+=$amount 
                        :
                            $sub_total_arr[$major->major_code]=$amount; 
        @endphp
        <td>{{ $amount }}</td>
      @endforeach
       
      <td>
        {{ $sub_total }}
        @php $all_total+=$sub_total; @endphp
      </td>
    </tr>
    @endforeach
    <tr class="bg-light font-weight-bold">
        <td colspan="7" class="text-center">
            {{ Settings::trans('Total','مجموعه','مجموعه') }}
        </td>
        
        @foreach($sub_total_arr as $sub_total2)
            <td>{{ $sub_total2 }}</td>
        @endforeach
        
        <td>{{ $all_total }}</td>
    </tr>
    <tr>
        <td colspan="7" class="border-0"></td>
        <td colspan="{{ count($code_objects_2)+1 }}" class="border-0"></td>
    </tr>
    <tr class="bg-light font-weight-bold text-center">
        <td colspan="7">{{ Settings::trans('Ministry Approval','د مربوطه وزارت منظوري','منظوری وزارت مربوطه') }}</td>
        <td colspan="{{ count($code_objects_2)+1 }}">{{ Settings::trans('Ministry of Finance Approval','د مالیی وزارت منظوري','منظوری وزارت مالیه') }}</td>
    </tr>
    <tr class="bg-light">
        <td colspan="3">{{ Settings::trans('General Manager of Development Budget','د انکشافي بودیجی عمومي مدیر','مدیر عمومی بودجه انکشافی') }}</td>
        <td colspan="4">{{ Settings::trans('Finance and Calculation Director','مالي او حسابي رئیس','ریئس مالی و حسابی') }}</td>

        <td colspan="{{ count($code_objects_2)-2 }}">{{ Settings::trans('Sector Manager of National Budget','د ملي بودیجی سکتوری آمر','آمر سکتور بودجه ملی') }}</td>
        <td colspan="3">{{ Settings::trans('National Budget Exective Director','د ملي بودیجی اجرائيوي ریاست','ریاست اجرائیوی بودجه ملی') }}</td>
    </tr>
    <tr>
        <td colspan="3">
            <p style="min-height:50px;"></p>
        </td>
        <td colspan="4"></td>
        <td colspan="{{ count($code_objects_2)-2 }}"></td>
        <td colspan="3"></td>
    </tr>
</tbody>
</table>

</div>
@endsection

@push('scripts')
    <script>
    $('#total_container').html({{$all_total}});
    function print_page(){
        window.print();
    }
    </script>
@endpush  