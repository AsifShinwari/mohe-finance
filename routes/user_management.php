<?php

use Illuminate\Support\Facades\Route;

Route::group([
    // 'namespace'     => 'App\Http\Controllers',
    'prefix'        => 'admin/user-management',
    'as'            => 'admin.',
    'middleware'    => ['web', 'auth:web','role:Users Management|Admin']
], function () {

        Route::group([
            'prefix' => 'user',
            'as'     => 'user.'
        ], function () {
            Route::get('/index', App\Livewire\Backend\Users\Index::class)->name('index')->middleware('permission:Users - Can View');
            Route::get('/create', App\Livewire\Backend\Users\Create::class)->name('create')->middleware('permission:Users - Can Add');
            Route::get('/edit/{user_id}', App\Livewire\Backend\Users\Edit::class)->name('edit')->middleware('permission:Users - Can Add');
            Route::get('/delete/{user_id}', App\Livewire\Backend\Users\Delete::class)->name('delete')->middleware('permission:Users - Can Delete');
        });

        Route::group([
            'prefix' => 'roles',
            'as'     => 'roles.'
        ], function () {
            Route::get('/index', App\Livewire\Backend\Roles\Index::class)->name('index')->middleware('permission:Users Roles - Can View');
            Route::get('/create', App\Livewire\Backend\Roles\Create::class)->name('create')->middleware('permission:Users Roles - Can Add');
            Route::get('/edit/{role_id}', App\Livewire\Backend\Roles\Update::class)->name('edit')->middleware('permission:Users Roles - Can Add');
            Route::get('/assign/{role_id}', App\Livewire\Backend\RolePermissions\Assign::class)->name('assign')->middleware('permission:Users - Can View');
        });
        
        Route::group([
            'prefix' => 'permission',
            'as'     => 'permission.'
        ], function () {
            Route::get('/index', App\Livewire\Backend\Permission\Index::class)->name('index')->middleware('permission:Users Permission - Can View');
            Route::get('/create', App\Livewire\Backend\Permission\Create::class)->name('create')->middleware('permission:Users Permission - Can Add');
            Route::get('/edit/{permission_id}', App\Livewire\Backend\Permission\Update::class)->name('edit')->middleware('permission:Users Permission - Can Edit');
        });

        Route::group([
            'prefix' => '/user/roles',
            'as'     => 'user.roles.'
        ], function () {
            Route::get('/index/{user_id}', App\Livewire\Backend\UserRoleAndPermission\Assign::class)->name('index')->middleware('permission:Users - Can Assign Roles');
        });

});
