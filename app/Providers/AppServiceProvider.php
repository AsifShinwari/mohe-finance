<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Blade;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Paginator::useBootstrapFive();
        Blade::component('components.backend.shared.btn.add', 'btn-add');
        Blade::component('components.backend.shared.btn.edit', 'btn-edit');
        Blade::component('components.backend.shared.btn.back', 'btn-back');
        Blade::component('components.backend.shared.btn.delete', 'btn-delete');
        Blade::component('components.backend.shared.btn.save', 'btn-save');
        Blade::component('components.backend.shared.btn.search', 'btn-search');
        Blade::component('components.backend.shared.btn.update', 'btn-update');

        Blade::component('components.backend.shared.checkbox', 'checkbox');
        Blade::component('components.backend.shared.radio', 'radio');
        Blade::component('components.backend.shared.textarea', 'textarea');
        Blade::component('components.backend.shared.input', 'input');
        Blade::component('components.backend.shared.select', 'select');
        Blade::component('components.backend.shared.select-simple', 'select-simple');
        Blade::component('components.backend.shared.modal', 'modal');
        Blade::component('components.backend.shared.loader', 'loader');

        Blade::if('hasDirectPermission', function ($permission) {
            return auth()->user() && auth()->user()->hasDirectPermission($permission);
        });

    }
}
