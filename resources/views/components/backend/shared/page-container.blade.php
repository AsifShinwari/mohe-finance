@props([
    'show_card'=>true    
])
<div>
    <div class="content">
        <div class="container-fluid">
        @if($show_card)
            <div class="row">
                <div class="col-lg-12">
                
                    <div class="card card-primary card-outline">
                        <div class="card-header" style="border:0px !important;padding:0px !important;">
                            <x-backend.shared.alert.success />
                            <x-backend.shared.alert.error />
                            <x-backend.shared.validation.all />
                        </div>
                        <div class="card-body">
                            {{ $slot }}
                        </div>
                    </div>
                </div>
            </div>
        @else
            {{ $slot }}
        @endif
        </div>
    </div>
</div>