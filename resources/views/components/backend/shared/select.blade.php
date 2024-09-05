@props([
    'name'=>'default_name',    
    'id'=>'default_id',    
    'list'=>[],    
    'value'=>'value',    
    'selected_value'=>'selected_value',    
    'text'=>'text',    
    'text2'=>'text2',    
    'default'=>'default',    
    'label'=>'default',    
    'col'=>'col-sm-12',    
    'required'=>'0',  
    'disabled'=>'0',  
    'readonly'=>'0',  
    'classes'=>'form-control',  
    'display'=>'',  
    'is_livewire'=>true,  
])
<div class="{{ $col }} {{ $display }}">
    <div class="form-group">
        @if($label!='default')<label for="{{$id}}" class="mb-0 text-secondary">{{ $label }} {!! $required==1 ? '<i class="text-danger">*</i>' : '' !!}</label>@endif
        <select {{ $attributes }} name="{{ $name }}" id="{{ $id }}" 
        class="{{ $classes }} @error($name) is-invalid @enderror" @if($disabled) disabled @endif @if($readonly) readonly @endif >
            <option value="">{{ $default }}</option>
            @foreach($list as $item)
                <option value="{{ $item->$value }}" @if($item->$value==$selected_value) selected @endif>{{ $item->$text }} {{ ($text2!='text2') ? ' - '.$item->$text2 : '' }}</option>
            @endforeach
        </select>
        @error($name)
            <span id="{{ $id == '' ? $name : $id }}-error" 
            class="error invalid-feedback">{{ $message }}</span>
        @enderror
    </div>
</div>


@push('scripts')
@if($is_livewire==true)
<script>

    function select2(){
        $(function(){
            $('#{{ $id }}').select2();
            $('#{{ $id }}').on('change', function (e) {
                var data = $('#{{ $id }}').select2("val");
                @this.set('{{ $id }}', data);
            });
        });
    }
    
    select2();

    document.addEventListener('livewire:init', () => {
        Livewire.hook('request', ({ uri, options, payload, respond, succeed, fail }) => {
            respond(({ status, response }) => {});
            succeed(({ status, json }) => {
                $('#{{ $id }}').select2("destroy").select2();
            });
            fail(({ status, content, preventDefault }) => {});
        });
    });
    </script>
@else
    <script>
        $('#{{ $id }}').select2();
    </script>
@endif
@endpush
