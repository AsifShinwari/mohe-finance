@foreach($budget_approveds as $b_app)
@php 
  $spent_per_code = App\Http\Controllers\Backend\Finance\DevelopmentBudget\BudgetDevB3Controller::calculate_code_total($b_app->id);
@endphp
<div title="{{ ($b_app->budget_amount - $spent_per_code) }}">
  <span class="px-1 bg-light text-success">
    <span class="text-danger" id="code-{{$b_app->code}}-spent">{{ $spent_per_code }}</span>
    /<span id="code-{{$b_app->code}}-amount">{{ $b_app->budget_amount }}</span>
  </span>
  <span class="border-left px-1 bg-secondary">AFG/{{ $b_app->code }}</span>
</div>
@endforeach