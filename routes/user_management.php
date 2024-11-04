<?php

use Illuminate\Support\Facades\Route;

Route::group([
    // 'namespace'     => 'App\Http\Controllers',
    'prefix'        => 'admin/user-management',
    'as'            => 'admin.',
    'middleware'    => ['web', 'auth:web','role:Users|Roles|Permissions']
], function () {

        Route::group([
            'prefix' => 'user',
            'as'     => 'user.',
            'middleware' => ['role:Users'],
        ], function () {
            Route::get('/index', App\Livewire\Backend\Users\Index::class)->name('index')->middleware('permission:Users - List');
            Route::get('/create', App\Livewire\Backend\Users\Create::class)->name('create')->middleware('permission:Users - Create');
            Route::get('/edit/{user_id}', App\Livewire\Backend\Users\Edit::class)->name('edit')->middleware('permission:Users - Update');
            Route::get('/delete/{user_id}', App\Livewire\Backend\Users\Delete::class)->name('delete')->middleware('permission:Users - Delete');
            Route::get('/roles/index/{user_id}', App\Livewire\Backend\UserRoleAndPermission\Assign::class)->name('roles.index')->middleware('permission:Users - Set Permissions');
        });

        Route::group([
            'prefix' => 'roles',
            'as'     => 'roles.',
            'middleware' => ['role:Roles'],
        ], function () {
            Route::get('/index', App\Livewire\Backend\Roles\Index::class)->name('index')->middleware('permission:Roles - List');
            Route::get('/create', App\Livewire\Backend\Roles\Create::class)->name('create')->middleware('permission:Roles - Create');
            Route::get('/edit/{role_id}', App\Livewire\Backend\Roles\Update::class)->name('edit')->middleware('permission:Roles - Update');
            Route::get('/assign/{role_id}', App\Livewire\Backend\RolePermissions\Assign::class)->name('assign')->middleware('permission:Roles - Can Assign Persmission');
        });
        
        Route::group([
            'prefix' => 'permission',
            'as'     => 'permission.',
            'middleware' => ['role:Permissions'],
        ], function () {
            Route::get('/index', App\Livewire\Backend\Permission\Index::class)->name('index')->middleware('permission:Permissions - List');
            Route::get('/create', App\Livewire\Backend\Permission\Create::class)->name('create')->middleware('permission:Permissions - Create');
            Route::get('/edit/{permission_id}', App\Livewire\Backend\Permission\Update::class)->name('edit')->middleware('permission:Permissions - Update');
        });
});
