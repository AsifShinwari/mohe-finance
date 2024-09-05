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
      <td class="bg-light">{{ $item->code_org_4 }}</td>
      <td class="bg-light">{{ $item->code_project_6 }}</td>
      <td class="bg-light">{{ $item->code_program_3 }}</td>
      <td class="bg-light">{{ $item->code_fund_4 }}</td>
      <td class="bg-light">{{ $item->code_loaction }}</td>
      <td class="bg-light">{{ $item->code_cate_1 }}</td>
      <td class="bg-light">{{ $item->code_object_2 }}</td>
      <td> <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Hamal')">{{ $item->m_1 }} </button></td>
      <td> <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Sawar')">{{ $item->m_2 }} </button></td>
      <td> <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Jawza')">{{ $item->m_3 }} </button></td>
      <td> <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Saratan')">{{ $item->m_4 }} </button></td>
      <td> <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Asad')">{{ $item->m_5 }} </button></td>
      <td> <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Sunbula')">{{ $item->m_6 }} </button></td>
      <td> <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Mezan')">{{ $item->m_7 }} </button></td>
      <td> <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Aqrab')">{{ $item->m_8 }} </button></td>
      <td> <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Qaous')">{{ $item->m_9 }} </button></td>
      <td> <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Jadi')">{{ $item->m_10 }} </button></td>
      <td> <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Dalwa')">{{ $item->m_11 }} </button></td>
      <td> <button class="btn btn-link btn-sm" onclick="edit_row({{ $item->id }},'Hoot')">{{ $item->m_12 }} </button></td>
      <td class="bg-light">{{ $total_months }}</td>
      <td class="bg-light text-center">
        <button class="btn btn-link btn-sm text-danger" onclick="delete_row({{ $item->id }})">
          <i class="fa fa-trash"></i>
        </button>
      </td>
    </tr>

@endforeach
</tbody>

    <tfoot class="bg-light" id="tbl-foot">
      <th class="text-center" colspan="7">{{ Settings::trans('Total','مجموعه','مجموعه') }}</th>
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
      <th colspan="2">{{ $all_total }}</th>
    </tfoot>