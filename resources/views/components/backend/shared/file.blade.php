
<div>
    <div class="form-group">
        @if($label!='') 
        <label 
            for="{{ $id }}">{{ $label }}</label>
        @endif
        
        {{ $slot }}
        <div class="input-group {{ $slot!='' ? 'mt-1' : ''}}">
            <div class="custom-file">
              <input 
                    type="file" 
                    class="{{ $classes }}custom-file-input" 
                    id="{{ $id == '' ? $name : $id }}" 
                    name="{{ $name }}">
                <label class="custom-file-label @error($name) border-danger @enderror" for="{{ $id == '' ? $name : $id }}">Choose file</label>
            </div>
            @error($name)
                <span id="{{ $id == '' ? $name : $id }}-error" 
                class="error invalid-feedback d-block">{{ $message }}</span>
            @enderror  
        </div>
    </div>
</div>