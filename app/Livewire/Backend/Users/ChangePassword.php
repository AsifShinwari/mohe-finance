<?php

namespace App\Livewire\Backend\Users;

use Livewire\Component;
use App\Models\User;
use Livewire\Attributes\Rule;
use Livewire\WithFileUploads;
use Illuminate\Support\Facades\Hash;

class ChangePassword extends Component
{
    use WithFileUploads;
    
    public $image;
    public $name;
    public $email;
    public $password;

    public $user_id;
    public $old_image;

    public function mount(){
        $this->user_id = auth()->user()->id;
        $user = User::where('id',$this->user_id)->first();
        $this->name = $user->name;
        $this->email = $user->email;
        $this->old_image = $user->image;
    }

    public function update(){
        $this->validate([
            'name'=>'required',
            'image'=>'max:1024',
        ]);
        
        if($this->image){
            $image_name = date('Y-m-d-h-i-s-m').'.'.$this->image->getClientOriginalExtension();
            $img_url = 'storage/users-images/'.$image_name;
            $image_uploaded = $this->image->storeAs('public/users-images', $image_name);
        
            User::where('id',$this->user_id)->update([
                'image'=>$img_url,
            ]);
        }

        if($this->password){
            User::where('id',$this->user_id)->update([
                'password'=>Hash::make($this->password)
            ]);
        }

        User::where('id',$this->user_id)->update([
            'name'=>$this->name,
        ]);

        session()->flash('success', 'Changes Saved Successfully!');
    }

    public function render()
    {
        return view('livewire.backend.users.change-password')
        ->layout('backend.livewire-layout.base');
    }
}
 