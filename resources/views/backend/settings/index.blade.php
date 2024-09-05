@extends('backend.layout.base')


@section('page_title')
    Settings
@endsection

@section('page_nav')
    <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
    <li class="breadcrumb-item active">Settings</li>
@endsection

@section('contents')
<div class="row m-0">
              <div class="col-lg-4 col-md-2"></div>
                <div class="col-lg-4 col-md-8">
        <x-backend.shared.page-container>
          <x-backend.shared.form route="admin.settings.update" method="post">
            
                 
                  <x-input
                  label="Application Name (English)"
                  name="en_app_name" 
                  value="{{ $settings->en_app_name }}" />

                  <x-input
                  label="Application Name (Pashto)"
                  name="pa_app_name" 
                  value="{{ $settings->pa_app_name }}" />

                  <x-input
                  label="Application Name (Dari)"
                  name="da_app_name" 
                  value="{{ $settings->da_app_name }}" />

                  <x-input
                  label="Abbreviation"
                  name="abbr" 
                  value="{{ $settings->abbr }}" />

                  <img src="{{ asset($settings->larg_logo) }}" 
                    class="img img-fluid img-thumbnail bg-light d-block w-50" alt="Larg Logo" />
                  <x-input
                  label="Logo (Large Size)"
                  name="larg_logo" type="file" />
                  <hr>

                  <img src="{{ asset($settings->medium_logo) }}" 
                    class="img img-fluid img-thumbnail bg-light d-block w-50" alt="Medium Logo" />
                  <x-input
                  label="Logo (Medium Size)"
                  name="medium_logo" type="file" />
                    
                  <hr>
                  <img src="{{ asset($settings->small_logo) }}" 
                    class="img img-fluid img-thumbnail bg-light d-block w-50" alt="Small Logo" />
                  <x-input
                  label="Logo (Small Size)"
                  name="small_logo" type="file" />
                    
                  <hr>
                  <img src="{{ asset($settings->favicon) }}" 
                    class="img img-fluid img-thumbnail bg-light d-block w-50" alt="Favicon" />
                  <x-input
                  label="Favicon"
                  name="favicon" type="file" />
                  
                    <div class="bg-light d-flex justify-content-between">
                        <x-backend.shared.btn.back route="admin.dashboard" />
                        <x-backend.shared.btn.save />
                    </div>
                
          </x-backend.shared.form >
        </x-backend.shared.page-container>
        </div>
        <div class="col-lg-4 col-md-2"></div>
    </div>
@endsection