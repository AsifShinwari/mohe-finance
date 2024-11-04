<table class="table table-sm table-bordered mb-0" id="main-tbl">
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
        <td class="bg-light text-center">{{ Settings::trans('Action','کړنی','عملیات') }}</td>
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
      <td class="text-center">
          @if(!$item->is_finalized)
            
            @hasDirectPermission('B.Promises (Regular) - Update')
              <a class="btn btn-sm btn-primary edit-btn" href="{{ route('finance.budget.plan.promises.edit',$item->id) }}"><i class="fa fa-edit"></i></a>
            @endhasDirectPermission
            
            @hasDirectPermission('B.Promises (Regular) - Delete')
              <button type="button" class="btn btn-sm btn-danger delete-btn" data-id="{{ $item->id }}"><i class="fa fa-trash"></i></button>
            @endhasDirectPermission

          @endif
      </td>
    </tr>
  @endforeach
</tbody>

  @if($budget_plan_promises->lastPage()>1)
  <tfoot id="tbl-foot">
    <th colspan="10">
      {{ $budget_plan_promises->links() }}
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
              url: "{{ route('finance.budget.plan.promises.delete') }}",
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