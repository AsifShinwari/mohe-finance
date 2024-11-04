@extends('backend.layout.print_base') @section('contents') @php $all_total = 0;
$t_m_1 = 0; $t_m_2 = 0; $t_m_3 = 0; $t_m_4 = 0; $t_m_5 = 0; $t_m_6 = 0; $t_m_7 =
0; $t_m_8 = 0; $t_m_9 = 0; $t_m_10 = 0; $t_m_11 = 0; $t_m_12 = 0; @endphp

<style>
    th,
    td {
        vertical-align: middle !important;
        text-align: center;
    }
</style>
<div class="text-center">
    <table class="table table-sm table-bordered mb-0">
        <tr>
            <td colspan="6" rowspan="3">
                <div class="row">
                    <div class="col-sm-6">
                        <h4 class="text-left">{{ Settings::trans('Islamic Emirate of Afghanistan','د افغانستان اسلامي امارت','امارت اسلامی افغانستان') }}</h4>
                        <h5 class="text-left">{{ Settings::trans('Ministry of Finance','د مالی وزارت-د ملي بودیجی عمومي ریاست','وزارت مالیه-ریاست عمومی بودجه ملی') }}</h5>
                    </div>
                    <div class="col-sm-6">
                        <img src="{{ asset(Settings::get()->small_logo) }}" alt="{{ Settings::get()->abbr }} Logo"
                        class="brand-image img-circle elevation-3" style="opacity:.8;max-height: 88px!important; margin-left:0px!important;">
                    </div>
                </div>
            </td>
            <td>
                {{ Settings::trans('Year:',
                    'مالي کال:',
                    'سال مالی') }}

                {{ substr(Settings::change_to_hijri($budget_plan->year),0,4) }}
            </td>
        </tr>
        <tr>
            <td>{{ Settings::trans('CF Form','د CF ثبت فورم','فورم ثبت تعهد (CF)') }}</td>
        </tr>
        <tr>
            <td>{{ $cf_list->cf_name }}</td>
        </tr>

        <tr>
            <td>{{ Settings::trans('Budget Unit','بودیجوي واحد','واحد بودجوی') }}</td>
            <td>{{ Settings::trans('Date','تاریخ','تاریخ') }}</td>
            <td>{{ Settings::trans('Sending#(Sadira)','صادره ګڼه','شماره صادره') }}</td>
            <td>{{ Settings::trans('Payment Location','تعهد تادیی محل','محل تادیه تعهد') }}</td>
            <td>{{ Settings::trans('Location Name','محل نوم','نام محل') }}</td>
            <td>{{ Settings::trans('Currency','د تعهد اسعار','اسعار تعهد') }}</td>
            <td>{{ Settings::trans('AFMIS-Reg#','د آفمس ثبت ګڼه','شماره تعهد افمس') }}</td>
        </tr>
        <tr>
            <td>{{ Settings::trans('Ministry of Higher Education','د لوړو زده کړو وزارت','وزارت تحصیلات عالی') }}</td>
            <td>{{ $cf_list->date }}</td>
            <td>{{ $cf_list->sending_no }}</td>
            <td>{{ $cf_list->payment_location }}</td>
            <td>{{ $cf_list->location_name }}</td>
            <td>{{ $cf_list->currency }}</td>
            <td>{{ $cf_list->afmis_no }}</td>
        </tr>
        <tr>
            <td colspan="4">{{ Settings::trans('Description','تشریح','تشریح') }}</td>
            <td colspan="2">{{ Settings::trans('Prepared By','ترتیب شوی','ترتیب شده توسط') }}</td>
            <td>{{ Settings::trans('Approved By Unit','د بودیجوي واحد په واسطه تصدیق شوی','تصدیق شده توسط واحد بودجوی') }}</td>
        </tr>
        <tr>
            <td colspan="4"><p>{{ $cf_list->description }}</p></td>
            <td colspan="2">{{ $cf_list->prepared_by }}</td>
            <td>{{ $cf_list->approved_by }}</td>
        </tr>
    </table>
</div>

<table class="table table-sm table-bordered" id="main-tbl">
    <thead id="tbl-head">
        <tr>
            <td class="bg-light">{{ Settings::trans('NO.','ګڼه','شماره') }}</td>
            <td class="bg-light">
                {{ Settings::trans('Organization(5)','بودیجوي واحد(۵)','واحد بودجوی(۵)')
                }}
            </td>
            <td class="bg-light">
                {{ Settings::trans('Project(6)','پروژه(۶)','پروژه(۶)') }}
            </td>
            <td class="bg-light">
                {{ Settings::trans('Activity(5)','فعالیت(۵)','فعالیت(۵)') }}
            </td>
            <td class="bg-light">
                {{ Settings::trans('Fund(4)','وجه(۴)','وجه(۴)') }}
            </td>
            <td class="bg-light">
                {{ Settings::trans('District(4)','ولسوالي(۴)','ولسوالی(۴)') }}
            </td>
            <td class="bg-light">
                {{ Settings::trans('Category(1)','نوع(۱)','نوع(۱)') }}
            </td>
            <td class="bg-light">
                {{ Settings::trans('Object(2)','باب(۲)','باب(۲)') }}
            </td>
            <th class="bg-light">{{ Settings::trans('Hamal-01','وری','حمل') }}</th>
            <th class="bg-light">{{ Settings::trans('Sawar-02','غویی','ثور') }}</th>
            <th class="bg-light">
                {{ Settings::trans('Jawza-02','غبرګولی','جوزا') }}
            </th>
            <th class="bg-light">
                {{ Settings::trans('Saratan-02','چینګاښ','سرطان') }}
            </th>
            <th class="bg-light">{{ Settings::trans('Asad-02','زمری','اسد') }}</th>
            <th class="bg-light">
                {{ Settings::trans('Sunbula-02','وږی','سنبله') }}
            </th>
            <th class="bg-light">{{ Settings::trans('Mezan-02','تله','میزان') }}</th>
            <th class="bg-light">{{ Settings::trans('Aqrab-02','لړم','عقرب') }}</th>
            <th class="bg-light">{{ Settings::trans('Qaous-02','لیندۍ','قوس') }}</th>
            <th class="bg-light">{{ Settings::trans('Jadi-02','مرغومی','جدی') }}</th>
            <th class="bg-light">
                {{ Settings::trans('Dalwa-02','سلواغه','دلوه') }}
            </th>
            <th class="bg-light">{{ Settings::trans('Hoot-02','کب','حوت') }}</th>
            <th class="bg-light">{{ Settings::trans('Total','مجموعه','مجموعه') }}</th>
            <th class="bg-light">
                {{ Settings::trans('AFMS-REG#','آفمس ګڼه','نمبر آفمس') }}
            </th>
        </tr>
    </thead>
    <tbody id="tbl-body">
        @foreach($cfs as $item) @php $total_months =
        ($item->m_1+$item->m_2+$item->m_3+$item->m_4+$item->m_5+$item->m_6+$item->m_7+$item->m_8+$item->m_9+$item->m_10+$item->m_11+$item->m_12);
        $all_total += $total_months; $t_m_1 += $item->m_1; $t_m_2 += $item->m_2;
        $t_m_3 += $item->m_3; $t_m_4 += $item->m_4; $t_m_5 += $item->m_5; $t_m_6 +=
        $item->m_6; $t_m_7 += $item->m_7; $t_m_8 += $item->m_8; $t_m_9 +=
        $item->m_9; $t_m_10 += $item->m_10; $t_m_11 += $item->m_11; $t_m_12 +=
        $item->m_12; @endphp
        <tr id="row-{{ $item->id }}">
            <td>{{ $loop->index+1 }}</td>
            <td>{{ $item->code_org_5 }}</td>
            <td>{{ $item->code_project_6 }}</td>
            <td>{{ $item->code_program_5 }}</td>
            <td>{{ $item->code_fund_4 }}</td>
            <td>{{ $item->code_location_4 }}</td>
            <td>{{ $item->code_cate_1 }}</td>
            <td>{{ $item->code_object_2 }}</td>
            <td>
                <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Hamal')">
                    {{ $item->m_1 }}
                </button>
            </td>
            <td>
                <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Sawar')">
                    {{ $item->m_2 }}
                </button>
            </td>
            <td>
                <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Jawza')">
                    {{ $item->m_3 }}
                </button>
            </td>
            <td>
                <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Saratan')">
                    {{ $item->m_4 }}
                </button>
            </td>
            <td>
                <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Asad')">
                    {{ $item->m_5 }}
                </button>
            </td>
            <td>
                <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Sunbula')">
                    {{ $item->m_6 }}
                </button>
            </td>
            <td>
                <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Mezan')">
                    {{ $item->m_7 }}
                </button>
            </td>
            <td>
                <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Aqrab')">
                    {{ $item->m_8 }}
                </button>
            </td>
            <td>
                <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Qaous')">
                    {{ $item->m_9 }}
                </button>
            </td>
            <td>
                <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Jadi')">
                    {{ $item->m_10 }}
                </button>
            </td>
            <td>
                <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Dalwa')">
                    {{ $item->m_11 }}
                </button>
            </td>
            <td>
                <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Hoot')">
                    {{ $item->m_12 }}
                </button>
            </td>
            <td class="bg-light">{{ $total_months }}</td>
            <td class="bg-light">{{ $item->afmis_reg_no }}</td>
        </tr>
        @endforeach
        <tr class="bg-light" id="tbl-foot">
            <th class="text-center" colspan="8">
                {{ Settings::trans('Total','مجموعه','مجموعه') }}
            </th>
            <th>{{ $t_m_1 }}</th>
            <th>{{ $t_m_2 }}</th>
            <th>{{ $t_m_3 }}</th>
            <th>{{ $t_m_4 }}</th>
            <th>{{ $t_m_5 }}</th>
            <th>{{ $t_m_6 }}</th>
            <th>{{ $t_m_7 }}</th>
            <th>{{ $t_m_8 }}</th>
            <th>{{ $t_m_9 }}</th>
            <th>{{ $t_m_10 }}</th>
            <th>{{ $t_m_11 }}</th>
            <th>{{ $t_m_12 }}</th>
            <th colspan="3">{{ $all_total }}</th>
        </tr>
    </tbody>
</table>
@endsection

<script>
    // window.print();
</script>