<div style="display:inline-block">
    <button type="submit" {{ $attributes }} class="btn btn-primary">
    @if(app()->getLocale()=='en') <i class="fa fa-save"></i> &nbsp; @endif
        {{ Settings::trans('Save','ثبت','ثبت') }}
    @if(app()->getLocale()!='en') <i class="fa fa-save"></i> &nbsp; @endif
    </button>
</div>