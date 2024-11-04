<table class="table table-sm table-bordered mb-0" id="main-tbl">
<thead id="tbl-head">
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
    <th class="bg-light text-center">{{ Settings::trans('Action','کړنی','عملیات') }}</th>
</thead>
<tbody id="tbl-body">
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
      @foreach($code_objects_2 as $major)
        @php  $amount = App\Http\Controllers\Backend\Finance\DevelopmentBudget\BudgetDevB3Controller::get_major_amount($budget_plan->id,$item->code_org_3,$item->code_project_6,$item->code_program_3,$item->code_fund_4,$item->code_province_2,$major->major_code);
          $sub_total+=$amount;
        @endphp
        <td>{{ $amount }}</td>
      @endforeach
       
      <td>{{ $sub_total }}</td>
      <td class="text-center">
        @hasDirectPermission('B3 (Development) - Delete')
          @if(!$item->is_finalized)
            <button type="button" class="btn btn-sm btn-danger delete-btn"
             data-id="{{ $item->id }}"><i class="fa fa-trash"></i></button>
          @endif
        @endhasDirectPermission
      </td>
    </tr>
  @endforeach
</tbody>

  @if($b3->lastPage() > 1)
    <tfoot id="tbl-foot">
      <th colspan="{{ 9+(count($code_objects_2)) }}">
        {{ $b3->links() }}
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
              url: "{{ route('finance.budget.dev.plan.b3.delete') }}",
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