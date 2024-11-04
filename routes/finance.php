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
                'as'     => 'master.',
                'middleware' => ['role:Funds|Object Codes|Organizations|Programs|Projects']
            ], function () {        
            
            Route::get('/code-funds/index', \App\Livewire\Backend\Finance\Master\Funds\Index::class)->name('funds.index')->middleware('permission:Funds - List');
            Route::get('/create', \App\Livewire\Backend\Finance\Master\Funds\Create::class)->name('funds.create')->middleware('permission:Funds - Create');
            Route::get('/edit/{id}', \App\Livewire\Backend\Finance\Master\Funds\Edit::class)->name('funds.edit')->middleware('permission:Funds - Update');
            

            Route::get('/code-objects/index', \App\Livewire\Backend\Finance\Master\Objects\Index::class)->name('objects.index')->middleware('permission:Object Codes - List');
            Route::get('/code-objects/create', \App\Livewire\Backend\Finance\Master\Objects\Create::class)->name('objects.create')->middleware('permission:Object Codes - Create');
            Route::get('/code-objects/edit/{id}', \App\Livewire\Backend\Finance\Master\Objects\Edit::class)->name('objects.edit')->middleware('permission:Object Codes - Update');

            Route::get('/code-orgs/index', \App\Livewire\Backend\Finance\Master\Organization\Index::class)->name('orgs.index')->middleware('permission:Organizations - List');
            Route::get('/code-orgs/create', \App\Livewire\Backend\Finance\Master\Organization\Create::class)->name('orgs.create')->middleware('permission:Organizations - Create');
            Route::get('/code-orgs/edit/{id}', \App\Livewire\Backend\Finance\Master\Organization\Update::class)->name('orgs.edit')->middleware('permission:Organizations - Update');

            Route::get('/code-program/index', \App\Livewire\Backend\Finance\Master\Programs\Index::class)->name('program.index')->middleware('permission:Programs - List');
            Route::get('/code-program/create', \App\Livewire\Backend\Finance\Master\Programs\Create::class)->name('program.create')->middleware('permission:Programs - Create');
            Route::get('/code-program/edit/{id}', \App\Livewire\Backend\Finance\Master\Programs\Update::class)->name('program.edit')->middleware('permission:Programs - Update');

            Route::get('/code-projects/index', \App\Livewire\Backend\Finance\Master\Projects\Index::class)->name('project.index')->middleware('permission:Projects - List');
            Route::get('/code-projects/create', \App\Livewire\Backend\Finance\Master\Projects\Create::class)->name('project.create')->middleware('permission:Projects - Create');
            Route::get('/code-projects/edit/{id}', \App\Livewire\Backend\Finance\Master\Projects\Update::class)->name('project.edit')->middleware('permission:Projects - Update');

            Route::get('/measurements/index', \App\Livewire\Backend\Finance\Master\Measurements\Index::class)->name('measurement.index')->middleware('permission:Measurements - List');
            Route::get('/measurements/create', \App\Livewire\Backend\Finance\Master\Measurements\Create::class)->name('measurement.create')->middleware('permission:Measurements - Create');
            Route::get('/measurements/edit/{id}', \App\Livewire\Backend\Finance\Master\Measurements\Update::class)->name('measurement.edit')->middleware('permission:Measurements - Update');

            Route::get('/code-locations/index', \App\Livewire\Backend\Finance\Master\Locations\Index::class)->name('location.index')->middleware('permission:Locations - List');;

        });


            Route::group([
                'prefix' => 'budget',
                'as'     => 'budget.'
            ], function () {        
            
            Route::get('/plan/index', \App\Livewire\Backend\Finance\Budget\Plan\Index::class)->name('plan.index')->middleware('permission:Budget Plan - List');
            Route::get('/plan/create', \App\Livewire\Backend\Finance\Budget\Plan\Create::class)->name('plan.create')->middleware('permission:Budget Plan - Create');
            Route::get('/plan/update/{id}', \App\Livewire\Backend\Finance\Budget\Plan\Update::class)->name('plan.update')->middleware('permission:Budget Plan - Update');


            Route::get('/plan/approved/major/codes/{id}', \App\Livewire\Backend\Finance\Budget\Plan\Approved\Update::class)->name('plan.approved.major.codes')->middleware('permission:Approved Budget (Regular) - List');
            Route::get('/plan/approved/distributions/b20/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::class,'index'])->name('plan.approved.distributions.index')->middleware('permission:B20 (Regular) - List');
            Route::get('/plan/approved/distributions/b20-store', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::class,'store'])->name('plan.approved.distributions.store')->middleware('permission:B20 (Regular) - Create');
            Route::get('/plan/approved/distributions/b20-delete', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::class,'delete'])->name('plan.approved.distributions.delete')->middleware('permission:B20 (Regular) - Delete');
            Route::get('/plan/approved/distributions/b20-edit', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::class,'edit'])->name('plan.approved.distributions.edit')->middleware('permission:B20 (Regular) - Update');
            Route::get('/plan/approved/distributions/b20-get-month-amount', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::class,'get_month_amount'])->name('plan.approved.distributions.get_month_amount');
            Route::get('/plan/approved/distributions/b20-print', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::class,'print'])->name('plan.approved.distributions.print');
            Route::get('/plan/approved/distributions/b10-get-code-amount', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::class,'get_b10_code_amount'])->name('plan.approved.distributions.get_b10_code_amount');
            Route::get('/plan/approved/distributions/b20-get-code-amount', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::class,'filter'])->name('plan.approved.distributions.filter');
            Route::post('/plan/approved/distributions/b20-finalize', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\Index::class,'finalize'])->name('plan.approved.distributions.finalize')->middleware('permission:B20 (Regular) - Lock');

            
            Route::get('/plan/approved/distributions/b10/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::class,'index'])->name('plan.approved.distributions.b10.index')->middleware('permission:B10 (Regular) - List');
            Route::get('/plan/approved/distributions/b10-store', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::class,'store'])->name('plan.approved.distributions.b10.store')->middleware('permission:B10 (Regular) - Create');
            Route::get('/plan/approved/distributions/b10-edit', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::class,'edit'])->name('plan.approved.distributions.b10.edit')->middleware('permission:B10 (Regular) - Update');
            Route::get('/plan/approved/distributions/b10-delete', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::class,'delete'])->name('plan.approved.distributions.b10.delete')->middleware('permission:B10 (Regular) - Delete');
            Route::get('/plan/approved/distributions/b10-print', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::class,'print'])->name('plan.approved.distributions.b10.print');
            Route::get('/plan/approved/distributions/b10-print-info', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::class,'print_get_info'])->name('plan.approved.distributions.b10.get_info');
            Route::get('/plan/approved/distributions/b10-save-print-info', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::class,'save_get_info'])->name('plan.approved.distributions.b10.save-print-info');
            Route::get('/plan/approved/distributions/b10-filter', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::class,'filter'])->name('plan.approved.distributions.b10.filter');
            Route::post('/plan/approved/distributions/finalize', [App\Http\Controllers\Backend\Finance\BudgetApprovedDistribution\B10Controller::class,'finalize'])->name('plan.approved.distributions.b10.finalize')->middleware('permission:B10 (Regular) - Lock');


            Route::get('/plan/transfer/external/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\BudgetTransfer\External::class,'index'])->name('plan.transfer.external.index')->middleware('permission:B.External Transfer (Regular) - List');
            Route::get('/plan/transfer/external/single/get-code-amount', [App\Http\Controllers\Backend\Finance\BudgetTransfer\External::class,'get_code_amount'])->name('plan.transfer.external.get.code.amount');
            Route::get('/plan/transfer/external/single/save', [App\Http\Controllers\Backend\Finance\BudgetTransfer\External::class,'store'])->name('plan.transfer.external.save')->middleware('permission:B.External Transfer (Regular) - Create');
            Route::get('/plan/transfer/external/single/get/form/info', [App\Http\Controllers\Backend\Finance\BudgetTransfer\External::class,'get_form_info'])->name('plan.transfer.external.get.form.info');
            Route::post('/plan/transfer/external/single/save/form/info', [App\Http\Controllers\Backend\Finance\BudgetTransfer\External::class,'save_form_info'])->name('plan.transfer.external.save.form.info');
            Route::get('/plan/transfer/external/single/print/form/info', [App\Http\Controllers\Backend\Finance\BudgetTransfer\External::class,'print_single_form_info'])->name('plan.transfer.external.print.single.form.info');
            Route::get('/plan/transfer/external/all/print/form/info/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\BudgetTransfer\External::class,'print_all'])->name('plan.transfer.external.print.all');
            Route::post('/plan/transfer/external/mark-as-final', [App\Http\Controllers\Backend\Finance\BudgetTransfer\External::class,'finalized'])->name('plan.transfer.external.finalized')->middleware('permission:B.External Transfer (Regular) - Lock');

            Route::get('/plan/transfer/internal/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'index'])->name('plan.transfer.internal.index')->middleware('permission:B.Internal Transfer (Regular) - List');
            Route::get('/plan/transfer/internal/single/get-code-amount', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'get_code_amount'])->name('plan.transfer.internal.get.code.amount');
            Route::get('/plan/transfer/internal/single/save', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'store'])->name('plan.transfer.internal.save')->middleware('permission:B.Internal Transfer (Regular) - Create');
            Route::get('/plan/transfer/internal/single/delete/{id}', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'delete'])->name('plan.transfer.internal.delete')->middleware('permission:B.Internal Transfer (Regular) - Delete');
            Route::get('/plan/transfer/internal/single/get/form/info', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'get_form_info'])->name('plan.transfer.internal.get.form.info');
            Route::post('/plan/transfer/internal/single/save/form/info', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'save_form_info'])->name('plan.transfer.internal.save.form.info');
            Route::get('/plan/transfer/internal/single/print/form/info', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'print_single_form_info'])->name('plan.transfer.internal.print.single.form.info');
            Route::get('/plan/transfer/internal/all/print/form/info/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'print_all'])->name('plan.transfer.internal.print.all');
            Route::post('/plan/transfer/internal/mark-as-final', [App\Http\Controllers\Backend\Finance\BudgetTransfer\Internal::class,'finalized'])->name('plan.transfer.internal.finalized')->middleware('permission:B.Internal Transfer (Regular) - Lock');

            //promises
            Route::get('/plan/promises/index/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\BudgetPromises\BudgetPromisesController::class,'index'])->name('plan.promises.index')->middleware('permission:B.Promises (Regular) - List');
            Route::get('/plan/promises/create/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\BudgetPromises\BudgetPromisesController::class,'create'])->name('plan.promises.create')->middleware('permission:B.Promises (Regular) - Create');
            Route::get('/plan/promises/get-code-object-3', [App\Http\Controllers\Backend\Finance\BudgetPromises\BudgetPromisesController::class,'get_object_code_3'])->name('plan.promises.get.code.object.3');
            Route::get('/plan/promises/get-code-object-5', [App\Http\Controllers\Backend\Finance\BudgetPromises\BudgetPromisesController::class,'get_object_code_5'])->name('plan.promises.get.code.object.5');
            Route::post('/plan/promises/store', [App\Http\Controllers\Backend\Finance\BudgetPromises\BudgetPromisesController::class,'store'])->name('plan.promises.store')->middleware('permission:B.Promises (Regular) - Create');
            Route::post('/plan/promises/delete', [App\Http\Controllers\Backend\Finance\BudgetPromises\BudgetPromisesController::class,'delete'])->name('plan.promises.delete')->middleware('permission:B.Promises (Regular) - Delete');
            Route::get('/plan/promises/print/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\BudgetPromises\BudgetPromisesController::class,'print'])->name('plan.promises.print');
            Route::get('/plan/promises/edit/{promise_id}', [App\Http\Controllers\Backend\Finance\BudgetPromises\BudgetPromisesController::class,'edit'])->name('plan.promises.edit')->middleware('permission:B.Promises (Regular) - Update');
            Route::post('/plan/promises/finalized', [App\Http\Controllers\Backend\Finance\BudgetPromises\BudgetPromisesController::class,'finalized'])->name('plan.promises.finalized')->middleware('permission:B.Promises (Regular) - Lock');
            
        });

        Route::group([
            'prefix' => 'budget/dev/plan/',
            'as'     => 'budget.dev.plan.',
            'middleware' => 'role:Approved Budget (Development)'
        ], function () {   
            Route::get('/approved/{plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\ApprovedBudgetController::class,'index'])->name('edit')->middleware('permission:Approved Budget (Development) - List');
            Route::get('/approved/add/{plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\ApprovedBudgetController::class,'create'])->name('create')->middleware('permission:Approved Budget (Development) - Create');
            Route::post('/approved/add/{plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\ApprovedBudgetController::class,'store'])->name('store')->middleware('permission:Approved Budget (Development) - Create');
            Route::post('/approved/delete', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\ApprovedBudgetController::class,'delete'])->name('delete')->middleware('permission:Approved Budget (Development) - Delete');
            Route::get('/approved/print/{plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\ApprovedBudgetController::class,'print'])->name('print');
            Route::post('/approved/finalized', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\ApprovedBudgetController::class,'finalized'])->name('finalized')->middleware('permission:Approved Budget (Development) - Lock');
        });

        Route::group([
            'prefix' => 'budget/dev/plan/b3/',
            'as'     => 'budget.dev.plan.b3.'
        ], function () {   
            Route::get('/index/{plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\BudgetDevB3Controller::class,'index'])->name('index')->middleware('permission:B3 (Development) - List');
            Route::get('/create/{plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\BudgetDevB3Controller::class,'create'])->name('create')->middleware('permission:B3 (Development) - Create');
            Route::post('/create/{plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\BudgetDevB3Controller::class,'store'])->name('store')->middleware('permission:B3 (Development) - Create');
            Route::get('/print/{plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\BudgetDevB3Controller::class,'print'])->name('print');
            Route::get('/finalized/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\BudgetDevB3Controller::class,'finalized'])->name('finalized')->middleware('permission:B3 (Development) - Lock');
            Route::post('/delete', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\BudgetDevB3Controller::class,'delete'])->name('delete')->middleware('permission:B3 (Development) - Delete');
        });

        Route::group([
            'prefix' => 'budget/dev/plan/b20/',
            'as'     => 'budget.dev.plan.b20.'
        ], function () {   
            Route::get('/index/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\B20::class,'index'])->name('index')->middleware('permission:B20 (Development) - List');
            Route::get('/store', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\B20::class,'store'])->name('store')->middleware('permission:B20 (Development) - Create');
            Route::get('/delete', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\B20::class,'delete'])->name('delete')->middleware('permission:B20 (Development) - Delete');
            Route::get('/edit', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\B20::class,'edit'])->name('edit')->middleware('permission:B20 (Development) - Update');
            Route::get('/get-month-amount', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\B20::class,'get_month_amount'])->name('get_month_amount');
            Route::get('/print', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\B20::class,'print'])->name('print');
            Route::get('/get-code-amount', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\B20::class,'get_b3_code_amount'])->name('get_b3_code_amount');
            Route::get('/filter/get-code-amount', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\B20::class,'filter'])->name('filter');
            Route::get('/b20-print-info', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\B20::class,'print_get_info'])->name('get_info');
            Route::get('/b20-save-print-info', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\B20::class,'save_get_info'])->name('save-print-info');
            Route::get('/finalized/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\B20::class,'finalized'])->name('finalized')->middleware('permission:B20 (Development) - Lock');
        });

        Route::group([
            'prefix' => 'budget/dev/plan/transfers/internal/',
            'as'     => 'budget.dev.plan.transfers.internal.'
        ], function () { 
            Route::get('/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\InternalTransfers::class,'index'])->name('index')->middleware('permission:B.E.Transfer (Development) - List');
            Route::get('/b20-trans/get-code-amount', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\InternalTransfers::class,'get_code_amount'])->name('get.code.amount');
            Route::get('/b20-trans/save', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\InternalTransfers::class,'store'])->name('save')->middleware('permission:B.I.Transfer (Development) - Create');
            Route::get('/delete/{id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\InternalTransfers::class,'delete'])->name('delete')->middleware('permission:B.I.Transfer (Development) - Delete');
            Route::get('/get/info', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\InternalTransfers::class,'get_form_info'])->name('get.info');
            Route::post('/save/info', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\InternalTransfers::class,'save_form_info'])->name('save.info');
            Route::get('/print/info', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\InternalTransfers::class,'print_single_form_info'])->name('print.info');
            Route::get('/all/print/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\InternalTransfers::class,'print_all'])->name('print.all');
            Route::get('/finalized/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\InternalTransfers::class,'finalized'])->name('finalized')->middleware('permission:B.I.Transfer (Development) - Lock');
        
        });

        Route::group([
            'prefix' => 'budget/dev/plan/transfers/external/',
            'as'     => 'budget.dev.plan.transfers.external.'
        ], function () { 
            Route::get('/index/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\ExternalTransfers::class,'index'])->name('index')->middleware('permission:B.E.Transfer (Development) - List');
            Route::get('/single/get-code-amount', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\ExternalTransfers::class,'get_code_amount'])->name('get.code.amount');
            Route::get('/single/save', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\ExternalTransfers::class,'store'])->name('save')->middleware('permission:B.E.Transfer (Development) - Create');
            Route::get('/single/get/form/info', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\ExternalTransfers::class,'get_form_info'])->name('get.form.info');
            Route::post('/save/form/info', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\ExternalTransfers::class,'save_form_info'])->name('save.form.info');
            Route::get('/print/form/info', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\ExternalTransfers::class,'print_single_form_info'])->name('single.form.info');
            Route::get('/form/info/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\ExternalTransfers::class,'print_all'])->name('print.all');
            Route::get('/finalized/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\ExternalTransfers::class,'finalized'])->name('finalized')->middleware('permission:B.E.Transfer (Development) - Lock');
        });

        Route::group([
            'prefix' => 'budget/dev/plan/promises/',
            'as'     => 'budget.dev.plan.promises.'
        ], function () { 
            //promises
            Route::get('/index/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\DevBudgetPromiseController::class,'index'])->name('index')->middleware('permission:B.Promises (Development) - List');
            Route::get('/create/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\DevBudgetPromiseController::class,'create'])->name('create')->middleware('permission:B.Promises (Development) - Create');
            Route::get('/get-code-object-3', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\DevBudgetPromiseController::class,'get_object_code_3'])->name('get.code.object.3');
            Route::get('/get-code-object-5', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\DevBudgetPromiseController::class,'get_object_code_5'])->name('get.code.object.5');
            Route::post('/store', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\DevBudgetPromiseController::class,'store'])->name('store')->middleware('permission:B.Promises (Development) - Create');
            Route::post('/delete', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\DevBudgetPromiseController::class,'delete'])->name('delete')->middleware('permission:B.Promises (Development) - Delete');
            Route::get('/print/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\DevBudgetPromiseController::class,'print'])->name('print');
            Route::get('/edit/{promise_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\DevBudgetPromiseController::class,'edit'])->name('edit');
            Route::get('/finalized/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\DevBudgetPromiseController::class,'finalized'])->name('finalized')->middleware('permission:B.Promises (Development) - Lock');
        });

        Route::group([
            'prefix' => 'budget/dev/plan/cf/list/',
            'as'     => 'budget.dev.plan.cf.list.'
        ], function () { 
            Route::get('/index/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\CFListController::class,'index'])->name('index')->middleware('permission:CF (Development) - List');
            Route::get('/create/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\CFListController::class,'create'])->name('create')->middleware('permission:CF (Development) - Create');
            Route::post('/store', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\CFListController::class,'store'])->name('store')->middleware('permission:CF (Development) - Create');
            Route::get('/finalized/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\CFListController::class,'finalized'])->name('finalized')->middleware('permission:CF (Development) - Lock');
            
            // Route::post('/delete', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\CFListController::class,'delete'])->name('delete');
            // Route::get('/print/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\CFListController::class,'print'])->name('print');
            // Route::get('/edit/{cf_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\CFListController::class,'edit'])->name('edit');
            // Route::post('/update/{cf_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\CFListController::class,'update'])->name('update');
        });

        Route::group([
            'prefix' => 'budget/dev/plan/cf/',
            'as'     => 'budget.dev.plan.cf.'
        ], function () { 
            Route::get('/index/{budget_plan_id}/{cf_list_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\CFController::class,'index'])->name('index')->middleware('permission:CF (Development) - Show Details');
            Route::get('/create/{budget_plan_id}/{cf_list_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\CFController::class,'create'])->name('create')->middleware('permission:CF (Development) - Create Details');
            Route::post('/store', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\CFController::class,'store'])->name('store')->middleware('permission:CF (Development) - Create Details');
            Route::post('/delete', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\CFController::class,'delete'])->name('delete')->middleware('permission:CF (Development) - Delete Details');
            Route::get('/print/{budget_plan_id}/{cf_list_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\CFController::class,'print'])->name('print');
            Route::get('/edit/{cf_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\CFController::class,'edit'])->name('edit');
            Route::post('/update/{cf_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\CFController::class,'update'])->name('update')->middleware('permission:CF (Development) - Update Details');
            Route::get('/finalized/{budget_plan_id}', [App\Http\Controllers\Backend\Finance\DevelopmentBudget\CFController::class,'finalized'])->name('finalized')->middleware('permission:CF (Development) - Lock Details');
        });
    });