@php $budget_plan_id = 0; @endphp
<tbody id="tbl-body"> 
@foreach($b10 as $item)
  @php $budget_plan_id = $item->budget_plan_id; @endphp
    <tr>
      <td class="bg-light">{{ $item->code_org_3 }}</td>
      <td class="bg-light">{{ $item->code_project_6 }}</td>
      <td class="bg-light">{{ $item->code_program_3 }}</td>
      <td class="bg-light">{{ $item->code_fund_4 }}</td>
      <td class="bg-light">{{ $item->code_loaction }}</td>
      <td class="bg-light">{{ Settings::trans($item->en_prov_name,$item->pa_prov_name,$item->da_prov_name) }}</td>
      @php $sub_total=0; @endphp
      @foreach($code_objects_2 as $major)
        @php  $amount = App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::get_major_amount($budget_plan_id,$item->code_org_3,$item->code_project_6,$item->code_program_3,$item->code_fund_4,$item->code_loaction,$major->major_code);
          $sub_total+=$amount;
        @endphp
        <td>
          @if(isset($is_object_code_filterd) && $is_object_code_filterd != null && $is_object_code_filterd!=$major->major_code)
            <button class="btn btn-lin btn-sm" title="Edit Amount">
              0
            </button>    
          @else
            @if(!$item->is_finalized)
              
                <button class="btn btn-link btn-sm" 
                  @hasDirectPermission('B10 (Regular) - Update')
                    onclick="edit_row({{ $item->id.','.$major->major_code }})"
                  @endhasDirectPermission
                 title="Edit Amount">
                  {{ $amount }}
                </button>
              
            @else
            <span class="text-info p-2">  {{ $amount }} </span>
            @endif
          @endif
        </td> 
      @endforeach
      <td class="bg-light">{{ $sub_total }}</td>
      <td class="bg-light text-center">
        @if(!$item->is_finalized)
          @hasDirectPermission('B10 (Regular) - Delete')
            <button class="btn btn-link btn-sm text-danger" onclick="delete_row({{ $item->id }})">
              <i class="fa fa-trash"></i>
            </button>
          @endhasDirectPermission
        @endif
      </td>
    </tr>
@endforeach
  <tr class="bg-light">
      <th class="text-center" colspan="6">{{ Settings::trans('Total','مجموعه','مجموعه') }}</th>
      @php $all_total = 0; @endphp
      @foreach($code_objects_2 as $code_object)
      @php $total = App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::get_major_total_amount($budget_plan_id,$code_object->major_code);
           $all_total+=$total;
      @endphp
      <th>
        {{ $total }}
      </th>
      @endforeach
      <th>{{ $all_total }}</th>
      <th></th>
  </tr>
</tbody>
    @if($b10->lastPage() > 1)
    <tfoot id="tbl-foot">
      <td colspan="13">{{ $b10->links() }}</td>
    </tfoot>
    @endif