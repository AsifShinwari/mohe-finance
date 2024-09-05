@if ($errors->any())
<div class="alert alert-danger alert-dismissible">
  <button type="button" class="close text-white" data-dismiss="alert" aria-hidden="true">×</button>
  <h5><i class="icon fas fa-ban"></i>{{ Settings::trans('Validation Alerts!','د تایید خبرتیا!','هشدار اعتبارسنجی') }}</h5>
        @foreach ($errors->all() as $error)
            <p class="text-white mb-0 pl-5">{{ $error }}</p>
        @endforeach
</div>
@endif