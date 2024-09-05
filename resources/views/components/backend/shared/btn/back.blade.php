<div style="display:inline-block">
    @props([
        'route'=>'default',    
        'param'=>'0'    
    ])

    <a @if($param=='0') href="{{ route($route) }}" @else href="{{ route($route,$param) }}" @endif {{ $attributes }} class="btn btn-secondary">
         <i class="fa fa-arrow-{{ (app()->getLocale()=='en') ? 'left' :'right'}}"></i> &nbsp; 
        {{ Settings::trans('Back','وروسته','بازګشت') }}
    </a>
</div>