@extends('backend.layout.print_base')
@section('contents') 
    <style>
        td{
            vertical-align: middle !important;
        }
    </style>
    <table class="table table-sm table-bordered mb-0">
        <thead class="text-center">
            <tr>
                <td rowspan="5" class="text-center" style="border-left: 0px !important;vertical-align:middle;padding-right:40px !important;">
                    <img src="{{ asset(Settings::get()->small_logo) }}" alt="{{ Settings::get()->abbr }} Logo" 
                    class="brand-image img-circle elevation-3" style="opacity: .8;max-height: 88px !important; margin-left:0px !important;">
                </td>
                <td rowspan="5" style="border-right: 0px !important;vertical-align:middle;" class="text-center">
                    <p class="mb-0">{{ Settings::trans('Islamic Emart of Afghanistan','د افغانستان اسلامي امارت','امارت اسلامی افغانستان') }}</p>
                    <p class="mb-0">{{ Settings::trans('Ministry of Finance','د مالیی وزارت','وزارت مالیه') }}</p>
                    <p class="mb-0">{{ Settings::trans('General Direct of National Budget','د ملي بودیجی عمومي ریاست','ریاست عمومی بودیجه ملی') }}</p>
                    <p class="mb-0">{{ Settings::trans('Budget Plan Form (B20)','د بودیجی پلان فورم (B20)','فورم بودجه مالی (B20)') }}</p>
                </td>
                <td>{{ Settings::trans('Organization','بودیجوي واحد','واحد بودجوی') }}</td>
                <td colspan="2">{{ Settings::trans('Ministry of Higher Education','د لوړو ذده کړو وزارت','وزارت تحصیلات علی') }}</td>
                <td>{{ Settings::trans('Form#','د فورم ګڼه','نمبر فورم') }}</td>
                <td>{{ $budget_plan->b20_form_no }}</td>
                <td>{{ Settings::trans('Year','مالي کال','سال مالی') }}</td>
                <td>{{ $budget_plan->year }}</td>
            </tr>
            <tr>
                <td>{{ Settings::trans('Created By','ترتیب شوی','ترتیب شده') }}</td>
                <td>{{ Settings::trans('','اداري او مالي معین','معین اداری و مالی') }}</td>
                <td>{{ Settings::trans('Sendings#','د صادری ګڼه','نمبر صادره') }}</td>
                <td rowspan="2" style="vertical-align:middle;">{{ Settings::trans('BEU#','BEU ګڼه','BEU نمبر') }}</td>
                <td colspan="3" rowspan="2">{{ $budget_plan->b20_beu_no }}</td>
            </tr>
            <tr>
                <td>{{ $budget_plan->b10_gnrl_bgt_mgr }}</td>
                <td>{{ $budget_plan->b10_gnrl_drctr }}</td>
                <td>{{ $budget_plan->b20_sending_no }}</td>
            </tr>
            <tr>
                <td rowspan="2" class="text-center text-light" style="vertical-align:middle;">{{ Settings::trans('Sign','امضا','امضا') }}</td>
                <td rowspan="2" class="text-center text-light" style="vertical-align:middle;">{{ Settings::trans('Sign','امضا','امضا') }}</td>
                <td>{{ Settings::trans('Date','د صدور تاریخ','تاریخ صدور') }}</td>
                <td rowspan="2" style="vertical-align:middle;">{{ Settings::trans('AFMIS Reg#','AFMIS ثبت ګڼه','AFMIS شماره ثبت') }}</td>
                <td rowspan="2" colspan="3">{{ $budget_plan->b20_afmis_no }}</td>
            </tr>
            <tr>
                <td>{{ $budget_plan->b20_sending_date }}</td>
            </tr>
        </thead>
    </table>
    <table class="table table-sm table-bordered" id="main-tbl">
        <thead id="tbl-head">
            <tr>
                <td class="text-center" colspan="3">{{ Settings::trans('Needs of Ministry By Letters','د وزارت تقاضا په حرفونو','تقاضا وزارت مربوط به حروف') }}</td>  
                <td colspan="8">{!! $budget_plan->b20_needs_in_letters !!}</td>  
                <td colspan="3" class="text-center">{{ Settings::trans('National Budget General Directorates','دملی بودیجی تجویز عمومي ریاست','تجویز ریاست عمومی بودجه ملی') }}</td>  
                <td colspan="6">{!! $budget_plan->b20_prescription_gnrl_drctr !!}</td>  
            </tr>
            <tr>
                <td colspan="7" class="text-center bg-light">{{ Settings::trans('Coding Block','د کود ګذاری بخش','بخش کود ګذاری') }}</td>
                <td colspan="12" class="text-center bg-light">{{ Settings::trans('Monthly Amount','میاشتني ارقام','مبلغ ماهوار') }}</td>
                <td class="bg-light" rowspan="2" style="vertical-align:middle;">{{ Settings::trans('Total','مجموعه','مجموعه') }}</td>
            </tr>
            <tr>
                <td class="bg-light">{{ Settings::trans('Sub-Organization (4)','فرعي اداره (۴)','اداره فرعی (۴)') }}</td>
                <td class="bg-light">{{ Settings::trans('Project Code(6)','د پروژی کوډ (۶)','کود پروژه (۶)') }}</td>
                <td class="bg-light">{{ Settings::trans('Program Code(3)','برنامه (۳)','برنامه(۳)') }}</td>
                <td class="bg-light">{{ Settings::trans('Fund Code(4)','وجه(۴)','وجه(۴)') }}</td>
                <td class="bg-light">{{ Settings::trans('Province Code','ولایت','ولایت') }}</td>
                <td class="bg-light">{{ Settings::trans('Type(1)','نوع(۱)','نوع(۱)') }}</td>
                <td class="bg-light">{{ Settings::trans('Major(2)','باب(۲)','باب(۲)') }}</td>
                <td class="bg-light">{{ Settings::trans('Hamal-01','وری','حمل') }}</td>
                <td class="bg-light">{{ Settings::trans('Sawar-02','غویی','ثور') }}</td>
                <td class="bg-light">{{ Settings::trans('Jawza-03','غبرګولی','جوزا') }}</td>
                <td class="bg-light">{{ Settings::trans('Saratan-04','چینګاښ','سرطان') }}</td>
                <td class="bg-light">{{ Settings::trans('Asad-05','زمری','اسد') }}</td>
                <td class="bg-light">{{ Settings::trans('Sunbula-06','وږی','سنبله') }}</td>
                <td class="bg-light">{{ Settings::trans('Mezan-07','تله','میزان') }}</td>
                <td class="bg-light">{{ Settings::trans('Aqrab-08','لړم','عقرب') }}</td>
                <td class="bg-light">{{ Settings::trans('Qaous-09','لیندۍ','قوس') }}</td>
                <td class="bg-light">{{ Settings::trans('Jadi-10','مرغومی','جدی') }}</td>
                <td class="bg-light">{{ Settings::trans('Dalwa-11','سلواغه','دلوه') }}</td>
                <td class="bg-light">{{ Settings::trans('Hoot-12','کب','حوت') }}</td>
            </tr>
        </thead>
          
        @php 
          $all_total = 0;
          $t_m_1 = 0; $t_m_2 = 0; $t_m_3 = 0; $t_m_4 = 0; $t_m_5 = 0; $t_m_6 = 0; $t_m_7 = 0; $t_m_8 = 0; $t_m_9 = 0; $t_m_10 = 0; $t_m_11 = 0; $t_m_12 = 0;
        @endphp
        
        <tbody id="tbl-body">
        @foreach($b20 as $item)
          @php 
            $total_months = ($item->m_1+$item->m_2+$item->m_3+$item->m_4+$item->m_5+$item->m_6+$item->m_7+$item->m_8+$item->m_9+$item->m_10+$item->m_11+$item->m_12);
            $all_total += $total_months;
            $t_m_1 += $item->m_1;
            $t_m_2 += $item->m_2;
            $t_m_3 += $item->m_3;
            $t_m_4 += $item->m_4;
            $t_m_5 += $item->m_5;
            $t_m_6 += $item->m_6;
            $t_m_7 += $item->m_7;
            $t_m_8 += $item->m_8;
            $t_m_9 += $item->m_9;
            $t_m_10 += $item->m_10;
            $t_m_11 += $item->m_11;
            $t_m_12 += $item->m_12;
          @endphp
            <tr>
              <td>{{ $item->code_org_4 }}</td>
              <td>{{ $item->code_project_6 }}</td>
              <td>{{ $item->code_program_3 }}</td>
              <td>{{ $item->code_fund_4 }}</td>
              <td>{{ $item->code_loaction }}</td>
              <td>{{ $item->code_cate_1 }}</td>
              <td>{{ $item->code_object_2 }}</td>
              <td>{{ $item->m_1 }}</td>
              <td>{{ $item->m_2 }}</td>
              <td>{{ $item->m_3 }}</td>
              <td>{{ $item->m_4 }}</td>
              <td>{{ $item->m_5 }}</td>
              <td>{{ $item->m_6 }}</td>
              <td>{{ $item->m_7 }}</td>
              <td>{{ $item->m_8 }}</td>
              <td>{{ $item->m_9 }}</td>
              <td>{{ $item->m_10 }}</td>
              <td>{{ $item->m_11 }}</td>
              <td>{{ $item->m_12 }}</td>
              <td class="bg-light">{{ $total_months }}</td>
            </tr>
        
        @endforeach
        </tbody>

        <tfoot id="tbl-foot">
            <tr>
                <td class="text-center bg-light" colspan="7">{{ Settings::trans('Total','مجموعه','مجموعه') }}</td>
                <td class="bg-light">{{ $t_m_1 }}</td>
                <td class="bg-light">{{ $t_m_2 }}</td>
                <td class="bg-light">{{ $t_m_3 }}</td>
                <td class="bg-light">{{ $t_m_4 }}</td>
                <td class="bg-light">{{ $t_m_5 }}</td>
                <td class="bg-light">{{ $t_m_6 }}</td>
                <td class="bg-light">{{ $t_m_7 }}</td>
                <td class="bg-light">{{ $t_m_8 }}</td>
                <td class="bg-light">{{ $t_m_9 }}</td>
                <td class="bg-light">{{ $t_m_10 }}</td>
                <td class="bg-light">{{ $t_m_11 }}</td>
                <td class="bg-light">{{ $t_m_12 }}</td>
                <td class="bg-light">{{ $all_total }}</td>
            </tr>
            <tr>
                <td>{{ Settings::trans('Position','دنده','وظیفه') }}</td>
                <td colspan="4" class="text-center">{{ Settings::trans('General Manager of National Budget Sector','د ملي بودیجی سکتوری امر','امر سکتور بودجه ملی') }}</td>
                <td colspan="4" class="text-center">{{ Settings::trans('General Manager of Budget Control','د ملي بودیجی اجرا او کنترول امر','امر اجرا و کنترول بودجه ملی') }}</td>
                <td colspan="4" class="text-center">{{ Settings::trans('CEO of National Budget','د ملي بودیجی اجرائیوی رئیس','رئیس اجرائیوی بوجه ملی') }}</td>
                <td colspan="4" class="text-center">{{ Settings::trans('General Manager of ...','د تخصیصاتو امر (خزاین)','امر تخصیصات (خزاین)') }}</td>
                <td colspan="4" class="text-center">{{ Settings::trans('General CEO of ...','د خزاینو عمومي رئیس','رئیس عمومی خزاین') }}</td>
            </tr>
            <tr>
                <td>{{ Settings::trans('Sign','امضا','امضا') }}</td>
                <td colspan="4"></td>
                <td colspan="4"></td>
                <td colspan="4"></td>
                <td colspan="4"></td>
                <td colspan="4"></td>
            </tr>
            <tr>
                <td>{{ Settings::trans('Date','تاریخ','تاریخ') }}</td>
                <td colspan="4"></td>
                <td colspan="4"></td>
                <td colspan="4"></td>
                <td colspan="4"></td>
                <td colspan="4"></td>
            </tr>
        </tfoot>

    </table>
@endsection