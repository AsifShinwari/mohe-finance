<table class="table table-sm table-bordered" id="main-tbl">
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
@foreach($b10_transfers as $item)
    <tr>
      <td>{{ $item->sending_no }}</td>
      <td>{{ $item->sending_date }}</td>
      <td>{{ $item->afmis_reg_no }}</td>
      <td class="text-success" title="{{ Settings::trans('Org(3) - Project(6) - Program(3) - Fund(4) - Location(2) - Object(2)','وزارت(3) - پروژه(6) - برنامه(3) - وجه(4) - ولایت(2) - باب(2)','وزارت(3) - پروژه(6) - برنامه(3) - وجه(4) - ولایت(2) - باب(2)') }}">
         @if($item->dr!=0)
           {{ $item->b10_code_org_3 }} - {{ $item->b10_code_project_6 }} 
          - {{ $item->b10_code_program_3 }} - {{ $item->b10_code_fund_4 }} -
          {{ ($item->b10_code_loaction<9) ? '0'.$item->b10_code_loaction : $item->b10_code_loaction }}
          - {{ $item->b10_code_object_2 }}
         @else
         {{ $item->code_org_3 }} - {{ $item->code_project_6 }}
          - {{ $item->code_program_3 }} - {{ $item->code_fund_4 }}
          - {{ ($item->code_loaction<9) ? '0'.$item->code_loaction : $item->code_loaction }} - {{ $item->code_object_2 }}
         @endif
      </td>
      <td class="text-danger">
        @if($item->dr!=0)
          {{ $item->code_org_3 }} - {{ $item->code_project_6 }}
          - {{ $item->code_program_3 }} - {{ $item->code_fund_4 }}
          - {{ ($item->code_loaction<9) ? '0'.$item->code_loaction : $item->code_loaction }} - {{ $item->code_object_2 }}
         @else
         {{ $item->b10_code_org_3 }} - {{ $item->b10_code_project_6 }} 
          - {{ $item->b10_code_program_3 }} - {{ $item->b10_code_fund_4 }} -
          {{ ($item->b10_code_loaction<9) ? '0'.$item->b10_code_loaction : $item->b10_code_loaction }}
          - {{ $item->b10_code_object_2 }}
         @endif
      </td>
      <td>{{ $item->dr }}</td>
      <td>{{ $item->cr }}</td>
      <td class="text-center">

        @hasDirectPermission('B.E.Transfer (Development) - Delete')
          @if(!$is_finalized)
            <button type="button" class="btn btn-sm btn-danger delete-btn" data-id="{{ $item->id }}"><i class="fa fa-trash"></i></button>
          @endif
        @endhasDirectPermission

        <button type="button" class="btn btn-sm btn-secondary print-btn" onclick="load_print_modal({{ $item->id }})"><i class="fa fa-print"></i></button>
      </td>
    </tr>
  @endforeach
</tbody>

  @if($b10_transfers->lastPage() > 1)
    <tfoot id="tbl-foot">
      <th colspan="8">
        {{ $b10_transfers->links() }}
      </th>
    </tfoot>
  @endif

</table>