<?php

namespace App\View\Components\backend\shared;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class Input extends Component
{
    public function __construct(
        public string $id,
        public string $label,
        public string $type,
        public string $classes,
        public string $value,
        public string $name
    ){}
    
    public function render(): View|Closure|string
    {
        return view('components.backend.shared.input');
    }
        
}
