<div style="display:inline;">
    @props([
        'route'=>'',
        'param'=>'0',
        'classes'=>'btn btn-primary',  
        'text'=>'<i class="fa fa-plus"></i><span class="d-none d-sm-inline-block">&nbsp;Add</span>'  
    ])

    @if($route!='')
    <a @if($param==0) href="{{ route($route) }}" @else href="{{ route($route,$param) }}" @endif {{ $attributes }} class="btn btn-primary {{ $classes }}">
        {!! $text !!}
    </a>
    @else
    <button {{ $attributes }} class="{{ $classes }}">
        {!! $text !!}
    </button>
    @endif
</div>