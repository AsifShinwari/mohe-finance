<?php

namespace App\Http\Requests\Backend; 

use Illuminate\Foundation\Http\FormRequest;

class SettingUpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'en_app_name'=>'required',
            'pa_app_name'=>'required',
            'da_app_name'=>'required',
            'abbr'=>'required',
            'larg_logo'=>'image'
        ];
    }

    public function messages(){
        return [
            'en_app_name.required'=>'Please fill the Application Name field.',
            'pa_app_name.required'=>'Please fill the Application Name field.',
            'da_app_name.required'=>'Please fill the Application Name field.',
            'abbr.required'=>'Please fill the Abbreviation field.',
            'larg_logo.imgae'=>'The logo (Large Size) field must be an image.',
        ];
    }
}
