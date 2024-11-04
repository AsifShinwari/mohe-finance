<table class="table table-sm table-bordered mb-0" id="main-tbl">
    <thead id="tbl-head">
      <tr>
        <td class="bg-light">{{ Settings::trans('NO.','ګڼه','شماره') }}</td>
        <td class="bg-light">{{ Settings::trans('Code','د پروژی کوډ','کود پروژه') }}</td>
        <td class="bg-light">{{ Settings::trans('Project Name','د پروژی نوم','اسم پروژه') }}</td>
        <td class="bg-light">{{ Settings::trans('Start Year','د شروع کال','سال آغاز') }}</td>
        <td class="bg-light">{{ Settings::trans('Donor','تمویلونکئ','تمویل کننده') }}</td>
        <td class="bg-light">{{ Settings::trans('Intentional','اختیاري/غیراختیاري','اختیاری/غیراختیاری') }}</td>
        <td class="bg-light">{{ Settings::trans('Employees','داخلي حمایوي تخنیکي کارمندانو تعداد','کارمندان حمایوی تخنیکی داخلی تعداد') }}</td>
        <td class="bg-light">{{ Settings::trans('Budget Amount','بودیجه','بودجه') }}</td>
        <td class="bg-light text-center">{{ Settings::trans('Action','کړنی','عملیات') }}</td>
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
      <td class="text-center">
        @if(!$item->is_finalized)
          @hasDirectPermission('Approved Budget (Development) - Delete')
            <button type="button" class="btn btn-sm btn-danger delete-btn" data-id="{{ $item->id }}"><i class="fa fa-trash"></i></button>
          @endhasDirectPermission
        @endif
      </td>
    </tr>
  @endforeach
</tbody>

@if($data->lastPage() > 1)
<tfoot id="tbl-foot">
  <th colspan="10">
    {{ $data->links() }}
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
              url: "{{ route('finance.budget.dev.plan.delete') }}",
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