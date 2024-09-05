<?php

namespace App\Http\Controllers\Backend\Settings;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\Backend\SettingsService;
use App\Http\Requests\Backend\SettingUpdateRequest;
use App\Models\Setting;

class SettingsController extends Controller
{
    private SettingsService $setService;
    public function __construct(SettingsService $setService) {
        $this->setService = $setService;
    }

    public function index(){
        return view('backend.settings.index',[
            'settings'=>Setting::first()
        ]);
    }

    public function update(SettingUpdateRequest $req){
        
        $this->setService->update($req);

        return redirect()->back();
    }
}
