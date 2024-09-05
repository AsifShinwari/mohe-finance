@foreach($budget_approveds as $b_app)
@php 
  $spent_per_code = App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::calculate_code_remaining($budget_plan->id,$b_app->code_object_2);
@endphp
<div title="{{ ($b_app->amount - $spent_per_code) }}">
  <span class="px-1 bg-light text-success">
    <span class="text-danger" id="code-{{$b_app->code_object_2}}-spent">{{ $spent_per_code }}</span>
    /<span id="code-{{$b_app->code_object_2}}-amount">{{ $b_app->amount }}</span>
  </span>
  <span class="border-left px-1 bg-secondary">{{ $b_app->code_object_2 }}</span>
</div>
@endforeach