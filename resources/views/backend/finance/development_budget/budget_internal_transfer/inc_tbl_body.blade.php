<table class="table table-sm table-bordered mb-0" id="main-tbl">
    <thead id="tbl-head">
      <tr>
        <th class="bg-light">{{ Settings::trans('Sending#','صادره ګڼه','نمبر صادره') }}</th>
        <th class="bg-light">{{ Settings::trans('Sending Date','د صادره تاریخ','تاریخ صادره') }}</th>
        <th class="bg-light">{{ Settings::trans('AFMIS-Reg-#','افمس ثبت ګڼه','شماره ثبت افمس') }}</th>
        <th class="bg-light" title="{{ Settings::trans('Org(3) - Project(6) - Program(3) - Fund(4) - Location(2) - Object(2)','وزارت(3) - پروژه(6) - برنامه(3) - وجه(4) - ولایت(2) - باب(2)','وزارت(3) - پروژه(6) - برنامه(3) - وجه(4) - ولایت(2) - باب(2)') }}">
          {{ Settings::trans('Code (Dr+)','تزئید شوی کوډ','کود (تزئید شده)') }}</th>
        <th class="bg-light" title="{{ Settings::trans('Org(3) - Project(6) - Program(3) - Fund(4) - Location(2) - Object(2)','وزارت(3) - پروژه(6) - برنامه(3) - وجه(4) - ولایت(2) - باب(2)','وزارت(3) - پروژه(6) - برنامه(3) - وجه(4) - ولایت(2) - باب(2)') }}">
          {{ Settings::trans('Code (Cr-)','تنقیص شوی کوډ','کود تنقیص شده') }}</th>
        <th class="bg-light">{{ Settings::trans('Amount(Dr+)','تزئید شوی رقم','مقدار تزئید شده') }}</th>
        <th class="bg-light">{{ Settings::trans('Amount(Cr-)','تنقیص شوی ارقام','مقدار تنقیص شده') }}</th>
        <th class="bg-light text-center">{{ Settings::trans('Action','کړنی','عملیات') }}</th>
      </tr>
    </thead>
<tbody id="tbl-body">
@foreach($b20_transfers as $item)
    <tr>
      <td>{{ $item->sending_no }}</td>
      <td>{{ $item->sending_date }}</td>
      <td>{{ $item->afmis_reg_no }}</td>
      <td class="text-success" title="{{ Settings::trans('Org(3) - Project(6) - Program(3) - Fund(4) - Location(2) - Object(2)','وزارت(3) - پروژه(6) - برنامه(3) - وجه(4) - ولایت(2) - باب(2)','وزارت(3) - پروژه(6) - برنامه(3) - وجه(4) - ولایت(2) - باب(2)') }}">
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
      <td class="text-center">
        
        @hasDirectPermission('B.I.Transfer (Development) - Delete')
          @if(!$is_finalized)
            <a class="btn btn-sm btn-danger delete-btn" onclick="return confirm('Are You Sure, To Delete This Record?')" href="{{ route('finance.budget.dev.plan.transfers.internal.delete',$item->id) }}"><i class="fa fa-trash"></i></a>
          @endif
        @endhasDirectPermission

        @if($item->frm_type == 'primary')
          <button type="button" class="btn btn-sm btn-secondary print-btn" onclick="load_print_modal({{ $item->id }},'FB-B23')"><i class="fa fa-print"></i> FB</button>
          <button type="button" class="btn btn-sm btn-secondary print-btn" onclick="load_print_modal({{ $item->id }},'A1-B23')"><i class="fa fa-print"></i> A1</button>
        @elseif($item->frm_type == 'month')
          <button type="button" class="btn btn-sm btn-secondary print-btn" onclick="load_print_modal({{ $item->id }},'Month')"><i class="fa fa-print"></i> Month</button>
        @elseif($item->frm_type == 'category')
          <button type="button" class="btn btn-sm btn-secondary print-btn" onclick="load_print_modal({{ $item->id }},'FB-B23')"><i class="fa fa-print"></i> Category</button>
        @endif
      </td>
    </tr>
  @endforeach
</tbody>
  @if($b20_transfers->lastPage()>1)
    <tfoot id="tbl-foot">
      <th colspan="8">
        {{ $b20_transfers->links() }}
      </th>
    </tfoot>
  @endif
</table>