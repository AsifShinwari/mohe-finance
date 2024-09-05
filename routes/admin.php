<?php
    
    use Illuminate\Support\Facades\Route;


    Route::group([
        // 'namespace'     => 'App\Http\Controllers',
        'prefix'        => 'admin/',
        'as'            => 'admin.',
        'middleware'    => ['web', 'auth:web']
    ], function () {

        Route::get('/dashboard', [App\Http\Controllers\Backend\Dashboard\IndexController::class,'dashboard'])->name('dashboard');
        Route::get('/logout', [App\Http\Controllers\Auth\LoginController::class,'logout'])->name('logout');

            Route::group([
                'prefix' => 'settings',
                'as'     => 'settings.'
            ], function () {        
            
            Route::get('/index', [App\Http\Controllers\Backend\Settings\SettingsController::class,'index'])->name('index')->middleware('permission:Settings - View');;
            Route::post('/update', [App\Http\Controllers\Backend\Settings\SettingsController::class,'update'])->name('update')->middleware('permission:Settings - Update');;

        });
    });