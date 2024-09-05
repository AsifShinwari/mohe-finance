<?php

namespace App\Livewire\Backend\Users;

use Livewire\Component;
use App\Models\User; 
use App\Models\Departement;
use App\Models\Employee;
use App\Models\Role;
use Livewire\WithFileUploads;
use Illuminate\Support\Facades\Hash;

class Edit extends Component
{
    use WithFileUploads;
    
    public $user_id;
    public $old_image;

    public $image;
    public $name;
    public $pa_name;
    public $email;
    public $password;
    public $departement_id;

    public function mount($user_id){
        $this->user_id = $user_id;
        $user = User::where('id',$user_id)->first();
        $this->name = $user->name;
        $this->pa_name = $user->pa_name;
        $this->email = $user->email;
        $this->employee_id = $user->employee_id;
        $emp = Employee::where('email',$user->email)->first();
        if($emp){
            $this->departement_id = $emp->departement_id;
        }
        $this->old_image = $user->image;
    }

    #[Computed]
    public function departements(){
        return Departement::get();
    }

    public function update(){
        $user_id = $this->user_id;
        $this->validate([
            'image'=>'max:1024'
        ]);
        $this->validate([
            'image'=>'max:1024',
            'name'=>'required',
            'pa_name'=>'required',
            'departement_id'=>'required',
            'email'=>'required',
        ]);  
        
        if($this->image){
            $image_name = date('Y-m-d-h-i-s-m').'.'.$this->image->getClientOriginalExtension();
            $img_url = 'storage/users-images/'.$image_name;
            $image_uploaded = $this->image->storeAs('public/users-images', $image_name);
        
            User::where('id',$user_id)->update([
                'image'=>$img_url,
            ]);
        }

        if($this->password){
            User::where('id',$user_id)->update([
                'password'=>Hash::make($this->password)
            ]);
        }

        User::where('id',$user_id)->update([
            'name'=>$this->name,
            'pa_name'=>$this->pa_name,
            'email'=>$this->email
        ]);

        if(Employee::where('email',$this->email)->first()){
            Employee::where('email',$this->email)->update([
                'en_name'=>$this->name,
                'pa_name'=>$this->pa_name,
                'departement_id'=>$this->departement_id,
                'email'=>$this->email
            ]);
        }else{
            Employee::create([
                'en_name'=>$this->name,
                'pa_name'=>$this->pa_name,
                'departement_id'=>$this->departement_id,
                'email'=>$this->email
            ]);
        }
        session()->flash('success',\Settings::trans('Added Successfully!','چاره په بریالیتوب ترسره شوه.','کار با موفقیت انجام شد'));
    }

    public function render()
    {
        return view('livewire.backend.users.edit')
        ->layout('backend.livewire-layout.base');
    }
}
