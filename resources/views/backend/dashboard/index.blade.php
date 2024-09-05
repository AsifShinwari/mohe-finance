@extends('backend.layout.base')


@section('page_title')
  {{ Settings::trans('Dashboard','دشبورډ','دشبورد') }}
@endsection

@section('page_nav')
    <li class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
@endsection

@section('contents')
  <x-backend.shared.page-container :show_card="false">
    
  </x-backend.shared.page-container>
@endsection

