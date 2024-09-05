<?php
    
    use Illuminate\Support\Facades\Route;


    Route::group([
        'namespace'     => 'App\Livewire\Backend\Hr',
        'prefix'        => 'hr',
        'as'            => 'admin.hr.',
        'middleware'    => ['web', 'auth:web','role:HR']
    ], function () {

            Route::group([
                'prefix' => 'departments',
                'as'     => 'dep.'
            ], function () {        
                Route::get('/index', \Departments\Index::class)->name('index')->middleware('permission:HR Department - Can View');
                Route::get('/create/{department_id?}', \Departments\Create::class)->name('create')->middleware('permission:HR Department - Can Add');
                Route::get('/update/{id}', \Departments\Update::class)->name('update')->middleware('permission:HR Department - Can Delete');
            });

            
    });
    
