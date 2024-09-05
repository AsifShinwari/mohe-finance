<?php
    
    use Illuminate\Support\Facades\Route;


    Route::group([
        'namespace'     => 'App\Http\Controllers\Backend\Notifications',
        'controller'     => \NotificationController::class,
        'prefix'        => 'notification',
        'as'            => 'notification.',
        'middleware'    => ['web', 'auth:web']
    ], function () {

        Route::get('/seen/{link?}', 'seen')->name('seen');  
        
    });
