
@php 
  $all_total = 0;
  $t_m_1 = 0; $t_m_2 = 0; $t_m_3 = 0; $t_m_4 = 0; $t_m_5 = 0; $t_m_6 = 0; $t_m_7 = 0; $t_m_8 = 0; $t_m_9 = 0; $t_m_10 = 0; $t_m_11 = 0; $t_m_12 = 0;
@endphp
<table class="table table-sm table-bordered mb-0" id="main-tbl">
    <thead id="tbl-head">
      <tr>
        <td class="bg-light">{{ Settings::trans('NO.','ګڼه','شماره') }}</td>
        <td class="bg-light">{{ Settings::trans('Organization(5)','بودیجوي واحد(۵)','واحد بودجوی(۵)') }}</td>
        <td class="bg-light">{{ Settings::trans('Project(6)','پروژه(۶)','پروژه(۶)') }}</td>
        <td class="bg-light">{{ Settings::trans('Activity(5)','فعالیت(۵)','فعالیت(۵)') }}</td>
        <td class="bg-light">{{ Settings::trans('Fund(4)','وجه(۴)','وجه(۴)') }}</td>
        <td class="bg-light">{{ Settings::trans('District(4)','ولسوالي(۴)','ولسوالی(۴)') }}</td>
        <td class="bg-light">{{ Settings::trans('Category(1)','نوع(۱)','نوع(۱)') }}</td>
        <td class="bg-light">{{ Settings::trans('Object(2)','باب(۲)','باب(۲)') }}</td>
        <th class="bg-light">{{ Settings::trans('Hamal-01','وری','حمل') }}</th>
        <th class="bg-light">{{ Settings::trans('Sawar-02','غویی','ثور') }}</th>
        <th class="bg-light">{{ Settings::trans('Jawza-02','غبرګولی','جوزا') }}</th>
        <th class="bg-light">{{ Settings::trans('Saratan-02','چینګاښ','سرطان') }}</th>
        <th class="bg-light">{{ Settings::trans('Asad-02','زمری','اسد') }}</th>
        <th class="bg-light">{{ Settings::trans('Sunbula-02','وږی','سنبله') }}</th>
        <th class="bg-light">{{ Settings::trans('Mezan-02','تله','میزان') }}</th>
        <th class="bg-light">{{ Settings::trans('Aqrab-02','لړم','عقرب') }}</th>
        <th class="bg-light">{{ Settings::trans('Qaous-02','لیندۍ','قوس') }}</th>
        <th class="bg-light">{{ Settings::trans('Jadi-02','مرغومی','جدی') }}</th>
        <th class="bg-light">{{ Settings::trans('Dalwa-02','سلواغه','دلوه') }}</th>
        <th class="bg-light">{{ Settings::trans('Hoot-02','کب','حوت') }}</th>
        <th class="bg-light">{{ Settings::trans('Total','مجموعه','مجموعه') }}</th>
        <th class="bg-light">{{ Settings::trans('AFMS-REG#','آفمس ګڼه','نمبر آفمس') }}</th>
        <td class="bg-light text-center">{{ Settings::trans('Action','کړنی','عملیات') }}</td>
      </tr>
    </thead>
<tbody id="tbl-body">
  @foreach($cfs as $item)
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
    <tr id="row-{{ $item->id }}">
      <td>{{ $loop->index+1 }}</td>
      <td>{{ $item->code_org_5 }}</td>
      <td>{{ $item->code_project_6 }}</td>
      <td>{{ $item->code_program_5 }}</td>
      <td>{{ $item->code_fund_4 }}</td>
      <td>{{ $item->code_location_4 }}</td>
      <td>{{ $item->code_cate_1 }}</td>
      <td>{{ $item->code_object_2 }}</td>

      @if(!$is_finalized && auth()->user()->hasDirectPermission('CF (Development) - Update Details'))
      <td> <a href="{{ route('finance.budget.dev.plan.cf.edit',$item->id) }}">{{ $item->m_1 }}</a></td>
      <td> <a href="{{ route('finance.budget.dev.plan.cf.edit',$item->id) }}">{{ $item->m_2 }} </a></td>
      <td> <a href="{{ route('finance.budget.dev.plan.cf.edit',$item->id) }}">{{ $item->m_3 }} </a></td>
      <td> <a href="{{ route('finance.budget.dev.plan.cf.edit',$item->id) }}">{{ $item->m_4 }} </a></td>
      <td> <a href="{{ route('finance.budget.dev.plan.cf.edit',$item->id) }}">{{ $item->m_5 }} </a></td>
      <td> <a href="{{ route('finance.budget.dev.plan.cf.edit',$item->id) }}">{{ $item->m_6 }} </a></td>
      <td> <a href="{{ route('finance.budget.dev.plan.cf.edit',$item->id) }}">{{ $item->m_7 }} </a></td>
      <td> <a href="{{ route('finance.budget.dev.plan.cf.edit',$item->id) }}">{{ $item->m_8 }} </a></td>
      <td> <a href="{{ route('finance.budget.dev.plan.cf.edit',$item->id) }}">{{ $item->m_9 }} </a></td>
      <td> <a href="{{ route('finance.budget.dev.plan.cf.edit',$item->id) }}">{{ $item->m_10 }} </a></td>
      <td> <a href="{{ route('finance.budget.dev.plan.cf.edit',$item->id) }}">{{ $item->m_11 }} </a></td>
      <td> <a href="{{ route('finance.budget.dev.plan.cf.edit',$item->id) }}">{{ $item->m_12 }} </a></td>
      @else
      <td class="text-info"> {{ $item->m_1 }} </td>
      <td class="text-info"> {{ $item->m_2 }} </td>
      <td class="text-info"> {{ $item->m_3 }} </td>
      <td class="text-info"> {{ $item->m_4 }} </td>
      <td class="text-info"> {{ $item->m_5 }} </td>
      <td class="text-info"> {{ $item->m_6 }} </td>
      <td class="text-info"> {{ $item->m_7 }} </td>
      <td class="text-info"> {{ $item->m_8 }} </td>
      <td class="text-info"> {{ $item->m_9 }} </td>
      <td class="text-info"> {{ $item->m_10 }} </td>
      <td class="text-info"> {{ $item->m_11 }} </td>
      <td class="text-info"> {{ $item->m_12 }} </td>
      @endif

      <td class="bg-light">{{ $total_months }}</td>
      <td class="bg-light">{{ $item->afmis_reg_no }}</td>
      <td class="text-center">
        @if(!$is_finalized)
          
          @hasDirectPermission('CF (Development) - Update Details')
            <a class="btn btn-sm btn-primary edit-btn" href="{{ route('finance.budget.dev.plan.cf.edit',$item->id) }}"><i class="fa fa-edit"></i></a>
          @endhasDirectPermission

          @hasDirectPermission('CF (Development) - Delete Details')
            <button type="button" class="btn btn-sm btn-danger delete-btn" data-id="{{ $item->id }}"><i class="fa fa-trash"></i></button>
          @endhasDirectPermission

        @endif 
      </td>
    </tr>
  @endforeach
  <tr class="bg-light" id="tbl-foot">
  <th class="text-center" colspan="8">{{ Settings::trans('Total','مجموعه','مجموعه') }}</th>
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
@if($cfs->lastPage() > 1)
<tfoot id="tbl-foot">
  <th colspan="23">
    {{ $cfs->links() }}
  </th>
</tfoot>
@endif
</table>

@push('scripts')

<script>
  $(document).ready(function() {
      $('.delete-btn').click(function(){
        if(confirm('Are You Sure To Delete This Record?')){
          var id = $(this).attr('data-id');
          var _token = "{{ csrf_token() }}";

          $.ajax({
              url: "{{ route('finance.budget.dev.plan.cf.delete') }}",
              type: 'POST',
              data: { '_token':_token, 'id':id },
              success: function(response){
                  if(response.result==200){
                      toastr['success']('Deleted Successfully');
                      $('#row-'+id).remove();
                  }else if(response.result==500){
                      toastr['error'](response.msg);
                  }
              }
          });
        }
      });
  });
</script>

@endpush