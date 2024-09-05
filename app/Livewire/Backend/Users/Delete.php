<?php

namespace App\Livewire\Backend\Users;

use Livewire\Component;
use App\Models\User;

class Delete extends Component
{
    public $user_id;

    public function mount($user_id){
        $this->user_id=$user_id;
    }

    public function delete(){
        try {
            User::find($this->user_id)->delete();
            session()->flash('success',\Settings::trans('Added Successfully!','چاره په بریالیتوب ترسره شوه.','کار با موفقیت انجام شد'));
            redirect()->route('users.index');
        } catch (\Throwable $th) {
            redirect()->route('users.index');
        }
        
    }

    public function render()
    {
        return view('livewire.backend.users.delete')
        ->layout('backend.livewire-layout.base');
    }
}
