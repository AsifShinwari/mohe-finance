@extends('backend.layout.base')


@section('page_title')
  {{ Settings::trans('Form B 3: Distributions of the development budget at the level of the center and provinces',
    'ب 3 فورم: د مرکز او ولایتونو په کچه د پراختیایي بودیجې ویش',
    'فورم ب ۳: تقسیمات بودجه انکشافی در سطح مرکز و ولایات'
    ) }} {{ substr(Settings::change_to_hijri($budget_plan->year),0,4) }}
@endsection

@section('page_nav')
    <li class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
@endsection

@section('contents')
  <x-backend.shared.page-container :show_card="true">
   
        <form id="search-frm" action="{{ route(Route::currentRouteName(),$budget_plan->id) }}">
          <div class="row bg-light border py-4 m-0" id="filter-container">  
              @include('backend.finance.development_budget.b3.index.filter')
          </div>
        </form>

    <div class="table-responsive" id="tbl-container">
      @include('backend.finance.development_budget.b3.index.inc_tbl_body')
    </div>
  </x-backend.shared.page-container>
@endsection
