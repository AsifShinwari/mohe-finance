<?php

namespace App\Livewire\Backend\Finance\Master\Locations;

use Livewire\Component;
use Livewire\Attributes\Computed;
use App\Models\CodeLocations;
use Livewire\WithPagination;

class Index extends Component
{
    use WithPagination;

    public $search; 

    #[Computed]
    public function locations(){
        return CodeLocations::get_list($this->search,true)->paginate(10);
    }

    public function render()
    {
        return view('livewire.backend.finance.master.locations.index')
        ->layout('backend.livewire-layout.base');
    }
}
