@props([
    'id' => '',
    'label' => '',
    'type' => 'text',
    'classes' => 'form-control',
    'value' => '',
    'name' => '',
    'col' => 'col-sm-12',
    'required' => '0',
    'disabled' => '0',
])

<div class="{{ $col }}">
    
    <div class="form-group">
        @if($label!='')
        <label class="mb-0 text-secondary"
            for="{{ $id == '' ? $name : $id }}">{{ $label }} {!! $required==1 ? '<i class="text-danger">*</i>' : '' !!}</label>
        @endif
        <input 
        {{ $attributes }}
        type="{{$type}}" 
        @if($disabled==1) disabled @endif
        class="{{ $classes }} @error($name) is-invalid @enderror" 
        id="{{ $id == '' ? $name : $id }}" 
        value="{{ $value }}"
        name="{{ $name }}">
        @error($name)
            <span id="{{ $id == '' ? $name : $id }}-error" 
            class="error invalid-feedback">{{ $message }}</span>
        @enderror
    </div>
</div>