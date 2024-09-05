<?php

namespace App\Livewire\Backend\Users;

use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\Attributes\Computed;
use App\Models\Departement;
use App\Models\Role;
use App\Models\User;
use App\Models\Employee;
use App\Models\RoleUser;
use Illuminate\Support\Facades\Hash;

class Create extends Component
{
    use WithFileUploads;

    public $image;
    public $name;
    public $pa_name;
    public $departement_id;
    public $email;
    public $password;
    public $password_confirmation;

    #[Computed]
    public function departements(){
        return Departement::get();
    }

    public function store(){
        $this->validate([
            'image'=>'required|image|max:1024',
            'name'=>'required',
            'pa_name'=>'required',
            'departement_id'=>'required',
            'email'=>'required|email|unique:users,email',
            'password'=>'required|confirmed|min:8',
            'password_confirmation'=>'required',
        ]);        
        $image_name = date('Y-m-d-h-i-s-m').'.'.$this->image->getClientOriginalExtension();
        $img_url = 'storage/users-images/'.$image_name;
        $image_uploaded = $this->image->storeAs('public/users-images', $image_name);

        //add employee from here for temprory
        Employee::create([
            'email'=>$this->email,
            'en_name'=>$this->name,
            'pa_name'=>$this->pa_name,
            'departement_id'=>$this->departement_id
        ]);

        $emp = Employee::where('en_name',$this->name)
        ->where('email',$this->email)
        ->where('pa_name',$this->pa_name)
        ->where('departement_id',$this->departement_id)
        ->first();
        //end add employee from here for temprory

        User::create([
            'name'=>$this->name,
            'pa_name'=>$this->pa_name,
            'email'=>$this->email,
            'image'=>$img_url,
            'password'=>Hash::make($this->password)
        ]);

        session()->flash('success',\Settings::trans('Added Successfully!','چاره په بریالیتوب ترسره شوه.','کار با موفقیت انجام شد'));
        $this->reset();
     }

    public function render()
    {
        return view('livewire.backend.users.create')
        ->layout('backend.livewire-layout.base');
    }
}
