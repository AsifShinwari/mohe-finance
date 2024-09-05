<?php
    
    use Illuminate\Support\Facades\Route;


    Route::group([
        // 'namespace'     => 'App\Http\Controllers',
        'prefix'        => 'finance/',
        'as'            => 'finance.',
        'middleware'    => ['web', 'auth:web']
    ], function () {

            Route::group([
                'prefix' => 'master',
                'as'     => 'master.'
            ], function () {        
            
            Route::get('/code-funds/index', \App\Livewire\Backend\Finance\Master\Funds\Index::class)->name('funds.index');
            Route::get('/create', \App\Livewire\Backend\Finance\Master\Funds\Create::class)->name('funds.create');
            Route::get('/edit/{id}', \App\Livewire\Backend\Finance\Master\Funds\Edit::class)->name('funds.edit');
            

            Route::get('/code-objects/index', \App\Livewire\Backend\Finance\Master\Objects\Index::class)->name('objects.index');
            Route::get('/code-objects/create', \App\Livewire\Backend\Finance\Master\Objects\Create::class)->name('objects.create');
            Route::get('/code-objects/edit/{id}', \App\Livewire\Backend\Finance\Master\Objects\Edit::class)->name('objects.edit');

            Route::get('/code-orgs/index', \App\Livewire\Backend\Finance\Master\Organization\Index::class)->name('orgs.index');
            Route::get('/code-orgs/create', \App\Livewire\Backend\Finance\Master\Organization\Create::class)->name('orgs.create');
            Route::get('/code-orgs/edit/{id}', \App\Livewire\Backend\Finance\Master\Organization\Update::class)->name('orgs.edit');

            Route::get('/code-program/index', \App\Livewire\Backend\Finance\Master\Programs\Index::class)->name('program.index');
            Route::get('/code-program/create', \App\Livewire\Backend\Finance\Master\Programs\Create::class)->name('program.create');
            Route::get('/code-program/edit/{id}', \App\Livewire\Backend\Finance\Master\Programs\Update::class)->name('program.edit');

            Route::get('/code-projects/index', \App\Livewire\Backend\Finance\Master\Projects\Index::class)->name('project.index');
            Route::get('/code-projects/create', \App\Livewire\Backend\Finance\Master\Projects\Create::class)->name('project.create');
            Route::get('/code-projects/edit/{id}', \App\Livewire\Backend\Finance\Master\Projects\Update::class)->name('project.edit');

            Route::get('/measurements/index', \App\Livewire\Backend\Finance\Master\Measurements\Index::class)->name('measurement.index');
            Route::get('/measurements/create', \App\Livewire\Backend\Finance\Master\Measurements\Create::class)->name('measurement.create');
            Route::get('/measurements/edit/{id}', \App\Livewire\Backend\Finance\Master\Measurements\Update::class)->name('measurement.edit');

            Route::get('/code-locations/index', \App\Livewire\Backend\Finance\Master\Locations\Index::class)->name('location.index');

        });

            Route::group([
                'prefix' => 'budget',
                'as'     => 'budget.'
            ], function () {        
            
            Route::get('/plan/index', \App\Livewire\Backend\Finance\Budget\Plan\Index::class)->name('plan.index');
            Route::get('/plan/create', \App\Livewire\Backend\Finance\Budget\Plan\Create::class)->name('plan.create');
            Route::get('/plan/update/{id}', \App\Livewire\Backend\Finance\Budget\Plan\Update::class)->name('plan.update');


            Route::get('/plan/approved/major/codes/{id}', \App\Livewire\Backend\Finance\Budget\Plan\Approved\Update::class)->name('plan.approved.major.codes');
            Route::get('/plan/approved/distributions/b20/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::class,'index'])->name('plan.approved.distributions.index');
            Route::get('/plan/approved/distributions/b20-store', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::class,'store'])->name('plan.approved.distributions.store');
            Route::get('/plan/approved/distributions/b20-delete', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::class,'delete'])->name('plan.approved.distributions.delete');
            Route::get('/plan/approved/distributions/b20-edit', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::class,'edit'])->name('plan.approved.distributions.edit');
            Route::get('/plan/approved/distributions/b20-get-month-amount', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::class,'get_month_amount'])->name('plan.approved.distributions.get_month_amount');
            Route::get('/plan/approved/distributions/b20-print', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::class,'print'])->name('plan.approved.distributions.print');
            Route::get('/plan/approved/distributions/b10-get-code-amount', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::class,'get_b10_code_amount'])->name('plan.approved.distributions.get_b10_code_amount');

            
            Route::get('/plan/approved/distributions/b10/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::class,'index'])->name('plan.approved.distributions.b10.index');
            Route::get('/plan/approved/distributions/b10-store', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::class,'store'])->name('plan.approved.distributions.b10.store');
            Route::get('/plan/approved/distributions/b10-edit', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::class,'edit'])->name('plan.approved.distributions.b10.edit');
            Route::get('/plan/approved/distributions/b10-delete', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::class,'delete'])->name('plan.approved.distributions.b10.delete');
            Route::get('/plan/approved/distributions/b10-print', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::class,'print'])->name('plan.approved.distributions.b10.print');
            Route::get('/plan/approved/distributions/b10-print-info', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::class,'print_get_info'])->name('plan.approved.distributions.b10.get_info');
            Route::get('/plan/approved/distributions/b10-save-print-info', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::class,'save_get_info'])->name('plan.approved.distributions.b10.save-print-info');


            Route::get('/plan/transfer/external/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\BudgetTransfer\External::class,'index'])->name('plan.transfer.external.index');
            Route::get('/plan/transfer/external/single/get-code-amount', [App\Http\Controllers\Backend\Finance\BudgetTransfer\External::class,'get_code_amount'])->name('plan.transfer.external.get.code.amount');
            Route::get('/plan/transfer/external/single/save', [App\Http\Controllers\Backend\Finance\BudgetTransfer\External::class,'store'])->name('plan.transfer.external.save');
            Route::get('/plan/transfer/external/single/get/form/info', [App\Http\Controllers\Backend\Finance\BudgetTransfer\External::class,'get_form_info'])->name('plan.transfer.external.get.form.info');
            Route::post('/plan/transfer/external/single/save/form/info', [App\Http\Controllers\Backend\Finance\BudgetTransfer\External::class,'save_form_info'])->name('plan.transfer.external.save.form.info');
            Route::get('/plan/transfer/external/single/print/form/info', [App\Http\Controllers\Backend\Finance\BudgetTransfer\External::class,'print_single_form_info'])->name('plan.transfer.external.print.single.form.info');
            Route::get('/plan/transfer/external/all/print/form/info/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\BudgetTransfer\External::class,'print_all'])->name('plan.transfer.external.print.all');

            Route::get('/plan/transfer/internal/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'index'])->name('plan.transfer.internal.index');
            Route::get('/plan/transfer/internal/single/get-code-amount', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'get_code_amount'])->name('plan.transfer.internal.get.code.amount');
            Route::get('/plan/transfer/internal/single/save', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'store'])->name('plan.transfer.internal.save');
            Route::get('/plan/transfer/internal/single/delete/{id}', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'delete'])->name('plan.transfer.internal.delete');
            Route::get('/plan/transfer/internal/single/get/form/info', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'get_form_info'])->name('plan.transfer.internal.get.form.info');
            Route::post('/plan/transfer/internal/single/save/form/info', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'save_form_info'])->name('plan.transfer.internal.save.form.info');
            Route::get('/plan/transfer/internal/single/print/form/info', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'print_single_form_info'])->name('plan.transfer.internal.print.single.form.info');
            Route::get('/plan/transfer/internal/all/print/form/info/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'print_all'])->name('plan.transfer.internal.print.all');






        });
    });