<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/storage-link',function(){
    Artisan::call('storage:link');
    dd('done');
});
Route::get('/cache-clear',function(){
    Artisan::call('cache:clear');
    dd('cache cleared');
});

Route::get('/',function(){
    return redirect()->route('admin.dashboard');
});

Route::get('/create_roles',function(){

    // $role = Spatie\Permission\Models\Role::create(['name' => 'seo']);
    // $permission = Spatie\Permission\Models\Permission::create(['name' => 'can view']);
    // Role::create(['name' => 'reader', 'team_id' => 1]);
    // $role->givePermissionTo($permission);

    // $user = App\Models\User::find(1);
    // $user->assignRole('seo');
});

Route::get('/home',function(){
    return redirect()->route('admin.dashboard');
});

//configure livewire assets
Livewire::setUpdateRoute(function ($handle) {
    return Route::post('mohe-finance/public/livewire/update', $handle);
});
//end configure livewire assets

 
Route::get('/lang/{locale}', function (string $locale) {
    if (! in_array($locale, ['en', 'pa', 'da'])) {
        abort(400);
    }
    session()->put('locale', $locale);
    return redirect()->back();
})->name('change.locale');

Route::get('/admin/user-management/user/change-password', App\Livewire\Backend\Users\ChangePassword::class)->name('admin.user.change.password');


include __DIR__.'/auth.php';
include __DIR__.'/user_management.php';
include __DIR__.'/admin.php';
include __DIR__.'/hr.php';
include __DIR__.'/notifications.php';
include __DIR__.'/finance.php';