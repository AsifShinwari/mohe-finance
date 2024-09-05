<?php

use Illuminate\Support\Facades\Route;


Route::controller(App\Http\Controllers\Auth\LoginController::class)->group(function(){
    route::get('/login', 'login')->name('login');
    route::post('/login', 'authenticate')->name('authenticate');    
});

