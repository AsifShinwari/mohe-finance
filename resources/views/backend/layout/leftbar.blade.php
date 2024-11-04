  @php 
      $budget_plan = App\Models\BudgetPlan::where('is_completed',false)->first();
  @endphp
  <!-- Main Sidebar Container --> 
  <aside class="main-sidebar sidebar-light-primary elevation-2">
    <!-- Brand Logo -->
    <a href="{{ route('admin.dashboard') }}" class="brand-link">
      <img src="{{ asset(Settings::get()->larg_logo) }}" alt="{{ Settings::get()->abbr }} Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">{{ Settings::trans(Settings::get()->abbr,Settings::get()->pa_app_name,Settings::get()->da_app_name) }}</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="{{ asset(auth()->user()->image) }}" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="{{ route('admin.user.change.password') }}" class="d-block">{{ Settings::trans(auth()->user()->name,auth()->user()->pa_name,auth()->user()->pa_name) }}</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar btn-light border">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav  class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item">
            <a href="{{ route('admin.dashboard') }}" class="nav-link {{Settings::check_current_route('admin.dashboard')}}">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                {{ __('leftbar.home') }}
              </p>
            </a>
          </li>

          @hasanyrole('Funds|Object Codes|Organizations|Programs|Projects|Locations|Measurements')
          <li class="nav-item {{ Settings::check_in_routes(['finance.master.funds.index','finance.master.objects.index','finance.master.orgs.index','finance.master.program.index','finance.master.project.index','finance.master.location.index','finance.master.measurement.index']) }}">
            <a href="#" class="nav-link {{ Settings::check_in_routes(['finance.master.funds.index','finance.master.objects.index','finance.master.orgs.index','finance.master.program.index','finance.master.project.index','finance.master.location.index','finance.master.measurement.index'])!='' ? 'active' : '' }}">
              <i class="nav-icon fas fa-database"></i>
              <p>
                {{ __('leftbar.master_data') }}
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">

              @hasDirectPermission('Funds - List')
              <li class="nav-item">
                <a  href="{{ route('finance.master.funds.index') }}" class="nav-link {{Settings::check_current_route('finance.master.funds.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.funds') }}</p>
                </a>
              </li>
              @endhasDirectPermission

              @hasDirectPermission('Object Codes - List')
              <li class="nav-item">
                <a  href="{{ route('finance.master.objects.index') }}" class="nav-link {{Settings::check_current_route('finance.master.objects.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.code_objects') }}</p>
                </a>
              </li>
              @endhasDirectPermission

              @hasDirectPermission('Organizations - List')
              <li class="nav-item">
                <a  href="{{ route('finance.master.orgs.index') }}" class="nav-link {{Settings::check_current_route('finance.master.orgs.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.code_orgs') }}</p>
                </a>
              </li>
              @endhasDirectPermission
              
              @hasDirectPermission('Programs - List')
              <li class="nav-item">
                <a  href="{{ route('finance.master.program.index') }}" class="nav-link {{Settings::check_current_route('finance.master.program.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.code_programs') }}</p>
                </a>
              </li>
              @endhasDirectPermission

              @hasDirectPermission('Projects - List')
              <li class="nav-item">
                <a  href="{{ route('finance.master.project.index') }}" class="nav-link {{Settings::check_current_route('finance.master.project.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.code_projects') }}</p>
                </a>
              </li>
              @endhasDirectPermission

              @hasDirectPermission('Locations - List')
              <li class="nav-item">
                <a  href="{{ route('finance.master.location.index') }}" class="nav-link {{Settings::check_current_route('finance.master.location.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.code_locations') }}</p>
                </a>
              </li>
              @endhasDirectPermission

              @hasDirectPermission('Measurements - List')
              <li class="nav-item">
                <a  href="{{ route('finance.master.measurement.index') }}" class="nav-link {{Settings::check_current_route('finance.master.measurement.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.measurements') }}</p>
                </a>
              </li>
              @endhasDirectPermission

            </ul>
          </li>
          @endhasanyrole

          <!-- Budget Plan -->
          @hasanyrole('Budget Plan|Approved Budget (Regular)|B10 (Regular)|B20 (Regular)')
          @php 
            $is_in_bdg_routes = Settings::check_in_routes(
              [
                'finance.budget.plan.approved.major.codes',
                'finance.budget.plan.approved.distributions.b10.index',
                'finance.budget.plan.approved.distributions.index',
                'finance.budget.plan.transfer.external.index',
                'finance.budget.plan.transfer.internal.index',
                'finance.budget.plan.index',
                'finance.budget.plan.promises.index',
                'finance.budget.dev.plan.edit',
                'finance.budget.dev.plan.create',
                'finance.budget.dev.plan.b3.index',
                'finance.budget.dev.plan.b20.index',
                'finance.budget.dev.plan.transfers.internal.index',
                'finance.budget.dev.plan.transfers.external.index',
                'finance.budget.dev.plan.promises.index',
                'finance.budget.dev.plan.promises.create',
                'finance.budget.dev.plan.promises.edit',
                'finance.budget.dev.plan.cf.index',
                'finance.budget.dev.plan.cf.list.index',
                'finance.budget.dev.plan.cf.list.create',

              ])!='' ? 'active' : ''; 

            $is_in_bdg_plan_routes = Settings::check_in_routes(
              [
                'finance.budget.plan.approved.major.codes',
                'finance.budget.plan.approved.distributions.b10.index',
                'finance.budget.plan.approved.distributions.index',
                'finance.budget.plan.transfer.external.index',
                'finance.budget.plan.transfer.internal.index',
                'finance.budget.plan.promises.index',
              ]); 

            $is_in_bdg_dev_plan_routes = Settings::check_in_routes(
              [
                'finance.budget.dev.plan.edit',
                'finance.budget.dev.plan.create',
                'finance.budget.dev.plan.b3.index',
                'finance.budget.dev.plan.b20.index',
                'finance.budget.dev.plan.transfers.internal.index',
                'finance.budget.dev.plan.transfers.external.index',
                'finance.budget.dev.plan.promises.index',
                'finance.budget.dev.plan.promises.create',
                'finance.budget.dev.plan.promises.edit',
                'finance.budget.dev.plan.cf.index',
                'finance.budget.dev.plan.cf.list.index',
                'finance.budget.dev.plan.cf.list.create',
              ]); 
          @endphp
          <li class="nav-item {{ $is_in_bdg_routes!='' ? 'menu-open' : '' }}">
            <a href="#" class="nav-link {{ $is_in_bdg_routes }}">
              <i class="nav-icon fas fa-coins"></i>
              <p>
                {{ __('leftbar.budget_plan') }}
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">

              @hasanyrole('Approved Budget (Regular)')
              <!-- Regular Budget Plan -->
              <li class="nav-item {{ $is_in_bdg_plan_routes }}">
                  <a href="#" class="nav-link {{ $is_in_bdg_plan_routes!='' ? 'active':'' }}">
                      <i class="far fa-circle nav-icon"></i>
                      <p>
                        {{ __('leftbar.budget_plan_regular') }}
                          <i class="right fas fa-angle-left"></i>
                      </p>
                  </a>
                  <ul class="nav nav-treeview" style="display: {{ $is_in_bdg_plan_routes!='' ? 'block' : 'none'  }};">
                    @if($budget_plan)
                    
                      @hasDirectPermission('Approved Budget (Regular) - List')
                      <li class="nav-item">
                          <a href="{{ route('finance.budget.plan.approved.major.codes',$budget_plan->id) }}" 
                          class="nav-link {{ Settings::check_in_routes(['finance.budget.plan.approved.major.codes'])!='' ? 'active' : '' }}">
                              <i class="far fa-dot-circle nav-icon"></i>
                              <p>{{ Settings::trans('Approved Budget','منظور شوی بودیجه','بودیجه منظور شده') }}</p>
                          </a>
                      </li>
                      @endhasDirectPermission

                      @hasDirectPermission('B10 (Regular) - List')
                      <li class="nav-item">
                          <a href="{{ route('finance.budget.plan.approved.distributions.b10.index',$budget_plan->id) }}" 
                          class="nav-link {{ Settings::check_in_routes(['finance.budget.plan.approved.distributions.b10.index'])!='' ? 'active' : '' }}">
                              <i class="far fa-dot-circle nav-icon"></i>
                              <p>{{ Settings::trans('B10','ب ۱۰','ب ۱۰') }}</p>
                          </a>
                      </li>
                      @endhasDirectPermission

                      @hasDirectPermission('B20 (Regular) - List')
                      <li class="nav-item">
                          <a href="{{ route('finance.budget.plan.approved.distributions.index',$budget_plan->id) }}" 
                          class="nav-link {{ Settings::check_in_routes(['finance.budget.plan.approved.distributions.index'])!='' ? 'active' : '' }}">
                              <i class="far fa-dot-circle nav-icon"></i>
                              <p>{{ Settings::trans('B20','ب ۲۰','ب ۲۰') }}</p>
                          </a>
                      </li>
                      @endhasDirectPermission

                      @hasDirectPermission('B.External Transfer (Regular) - List')
                      <li class="nav-item">
                          <a href="{{ route('finance.budget.plan.transfer.external.index',$budget_plan->id) }}"
                          class="nav-link {{ Settings::check_in_routes(['finance.budget.plan.transfer.external.index'])!='' ? 'active' : '' }}">
                              <i class="far fa-dot-circle nav-icon"></i>
                              <p>{{ Settings::trans('Transfer Budget External','خارجي تعدیلات','تعدیلات خارجی') }}</p>
                          </a>
                      </li>
                      @endhasDirectPermission

                      @hasDirectPermission('B.Internal Transfer (Regular) - List')
                      <li class="nav-item">
                          <a href="{{ route('finance.budget.plan.transfer.internal.index',$budget_plan->id) }}" 
                          class="nav-link {{ Settings::check_in_routes(['finance.budget.plan.transfer.internal.index'])!='' ? 'active' : '' }}">
                              <i class="far fa-dot-circle nav-icon"></i>
                              <p>{{ Settings::trans('Transfer Budget Internal','داخلي تعدیلات','تعدیلات داخلی') }}</p>
                          </a>
                      </li>
                      @endhasDirectPermission

                      @hasDirectPermission('B.Promises (Regular) - List')
                      <li class="nav-item">
                          <a href="{{ route('finance.budget.plan.promises.index',$budget_plan->id) }}" 
                          class="nav-link {{ Settings::check_in_routes(['finance.budget.plan.promises.index'])!='' ? 'active' : '' }}">
                              <i class="far fa-dot-circle nav-icon"></i>
                              <p>{{ Settings::trans('Budget Promises','تعهدات','تعهدات') }}</p>
                          </a>
                      </li>
                      @endhasDirectPermission
                      @endif
                  </ul>
              </li>
              <!-- End Regular Budget Plan -->
              @endhasanyrole

              <!-- Development Budget Plan -->
              <li class="nav-item {{ $is_in_bdg_dev_plan_routes }}">
                  <a href="#" class="nav-link {{ $is_in_bdg_dev_plan_routes!='' ? 'active':'' }}">
                      <i class="far fa-circle nav-icon"></i>
                      <p>
                        {{ __('leftbar.budget_plan_dev') }}
                          <i class="right fas fa-angle-left"></i>
                      </p>
                  </a>
                  <ul class="nav nav-treeview" style="display: {{ $is_in_bdg_dev_plan_routes!='' ? 'block' : 'none'  }};">
                    @if($budget_plan)

                      @hasDirectPermission('Approved Budget (Development) - List')
                      <li class="nav-item">
                          <a href="{{ route('finance.budget.dev.plan.edit',$budget_plan->id) }}" 
                          class="nav-link {{ Settings::check_in_routes(['finance.budget.dev.plan.edit','finance.budget.dev.plan.create'])!='' ? 'active' : '' }}">
                              <i class="far fa-dot-circle nav-icon"></i>
                              <p>{{ Settings::trans('Approved Budget','منظور شوی بودیجه','بودیجه منظور شده') }}</p>
                          </a>
                      </li>
                      @endhasDirectPermission

                      @hasDirectPermission('B3 (Development) - List')
                      <li class="nav-item">
                          <a href="{{ route('finance.budget.dev.plan.b3.index',$budget_plan->id) }}" 
                          class="nav-link {{ Settings::check_in_routes(['finance.budget.dev.plan.b3.index'])!='' ? 'active' : '' }}">
                              <i class="far fa-dot-circle nav-icon"></i>
                              <p>{{ Settings::trans('B3','ب ۳','ب ۳') }}</p>
                          </a>
                      </li>
                      @endhasDirectPermission

                      @hasDirectPermission('B20 (Development) - List')
                      <li class="nav-item">
                          <a href="{{ route('finance.budget.dev.plan.b20.index',$budget_plan->id) }}" 
                          class="nav-link {{ Settings::check_in_routes(['finance.budget.dev.plan.b20.index'])!='' ? 'active' : '' }}">
                              <i class="far fa-dot-circle nav-icon"></i>
                              <p>{{ Settings::trans('B20','ب ۲۰','ب ۲۰') }}</p>
                          </a>
                      </li>
                      @endhasDirectPermission

                      @hasDirectPermission('B.E.Transfer (Development) - List')
                      <li class="nav-item">
                          <a href="{{ route('finance.budget.dev.plan.transfers.external.index',$budget_plan->id) }}"
                          class="nav-link {{ Settings::check_in_routes(['finance.budget.dev.plan.transfers.external.index'])!='' ? 'active' : '' }}">
                              <i class="far fa-dot-circle nav-icon"></i>
                              <p>{{ Settings::trans('Transfer Budget External','خارجي تعدیلات','تعدیلات خارجی') }}</p>
                          </a>
                      </li>
                      @endhasDirectPermission

                      @hasDirectPermission('B.I.Transfer (Development) - List')
                      <li class="nav-item">
                          <a href="{{ route('finance.budget.dev.plan.transfers.internal.index',$budget_plan->id) }}" 
                          class="nav-link {{ Settings::check_in_routes(['finance.budget.dev.plan.transfers.internal.index'])!='' ? 'active' : '' }}">
                              <i class="far fa-dot-circle nav-icon"></i>
                              <p>{{ Settings::trans('Transfer Budget Internal','داخلي تعدیلات','تعدیلات داخلی') }}</p>
                          </a>
                      </li>
                      @endhasDirectPermission
                      
                      <li class="nav-item">
                          <a href="{{ route('finance.budget.dev.plan.promises.index',$budget_plan->id) }}" 
                          class="nav-link {{ Settings::check_in_routes(['finance.budget.dev.plan.promises.index','finance.budget.dev.plan.promises.create','finance.budget.dev.plan.promises.edit'])!='' ? 'active' : '' }}">
                              <i class="far fa-dot-circle nav-icon"></i>
                              <p>{{ Settings::trans('Budget Promises','تعهدات','تعهدات') }}</p>
                          </a>
                      </li>
                      {{--<li class="nav-item">
                          <a href="{{ route('finance.budget.dev.plan.cf.index',$budget_plan->id) }}" 
                          class="nav-link {{ Settings::check_in_routes(['finance.budget.dev.plan.cf.index','finance.budget.dev.plan.cf.create','finance.budget.dev.plan.cf.edit','finance.budget.dev.plan.cf.index'])!='' ? 'active' : '' }}">
                              <i class="far fa-dot-circle nav-icon"></i>
                              <p>{{ Settings::trans('CF','سي اف','سی اف') }}</p>
                          </a>
                      </li>--}}
                      <li class="nav-item">
                          <a href="{{ route('finance.budget.dev.plan.cf.list.index',$budget_plan->id) }}" 
                          class="nav-link {{ Settings::check_in_routes(['finance.budget.dev.plan.cf.list.index','finance.budget.dev.plan.cf.list.create','finance.budget.dev.plan.cf.index'])!='' ? 'active' : '' }}">
                              <i class="far fa-dot-circle nav-icon"></i>
                              <p>{{ Settings::trans('CF List','سي اف لیست','سی اف لیست') }}</p>
                          </a>
                      </li>
                      @endif
                      
                  </ul>
              </li>

              @hasDirectPermission('Budget Plan - List')
              <!-- End Development Budget Plan -->
              <li class="nav-item">
                  <a href="{{ route('finance.budget.plan.index') }}" 
                  class="nav-link {{ Settings::check_in_routes(['finance.budget.plan.index'])!='' ? 'active' : '' }}">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>{{ Settings::trans('Settings','تنظیمات','تنظیمات') }}</p>
                  </a>
              </li>
              @endhasDirectPermission

            </ul>
          </li>
          @endhasanyrole


         
            
          @hasanyrole('Finance')
          <li class="nav-item {{ Settings::check_in_routes(['']) }}">
            <a href="#" class="nav-link {{ Settings::check_in_routes([''])!='' ? 'active' : '' }}">
              <i class="nav-icon fas fa-coins"></i>
              <p>
                {{ __('leftbar.spending_budget') }}
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              
              <li class="nav-item">
                <a  href="{{ route('finance.budget.plan.index') }}" class="nav-link {{Settings::check_current_route('finance.budget.plan.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.spending_budget_regular') }}</p>
                </a>
              </li>
              <li class="nav-item">
                <a  href="{{ route('finance.budget.plan.index') }}" class="nav-link {{Settings::check_current_route('finance.budget.plan.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.spending_budget_dev') }}</p>
                </a>
              </li>

            </ul>
          </li>
          @endhasanyrole

          @hasanyrole('HR')
          <li class="nav-item {{ Settings::check_in_routes(['admin.hr.dep.index']) }}">
            <a href="#" class="nav-link {{ Settings::check_in_routes(['admin.hr.dep.index'])!='' ? 'active' : '' }}">
              <i class="nav-icon fas fa-user-circle"></i>
              <p>
              {{ __('leftbar.hr') }}
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              
              @hasDirectPermission('HR Department - Can View')
              <li class="nav-item">
                <a  href="{{ route('admin.hr.dep.index') }}" class="nav-link {{Settings::check_current_route('admin.hr.dep.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.departments') }}</p>
                </a>
              </li>
              @endcan
            </ul>
          </li>
          @endhasanyrole

          @hasanyrole('Users|Roles|Permissions')
          <li class="nav-item {{ Settings::check_in_routes(['admin.user.index','admin.user.create','admin.user.edit','admin.roles.index','admin.permission.index']) }}">
            <a href="#" class="nav-link {{ Settings::check_in_routes(['admin.user.index','admin.user.create','admin.user.edit','admin.roles.index','admin.permission.index'])!='' ? 'active' : '' }}">
              <i class="nav-icon fa fa-users"></i>
              <p>
              {{ __('leftbar.users') }}
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">

              @hasanyrole('Roles')
                @hasDirectPermission('Roles - List')
                <li class="nav-item">
                  <a  href="{{ route('admin.roles.index') }}" class="nav-link {{Settings::check_current_route('admin.roles.index')}}">
                    <i class="fa fa-gavel nav-icon"></i>
                    <p>{{ __('leftbar.roles') }}</p>
                  </a>
                </li>
                @endcan
              @endhasanyrole

              @hasanyrole('Permissions')
                @hasDirectPermission('Permissions - List')
                <li class="nav-item">
                  <a  href="{{ route('admin.permission.index') }}" class="nav-link {{Settings::check_current_route('admin.permission.index')}}">
                    <i class="fa fa-lock nav-icon"></i>
                    <p>{{ __('leftbar.permissions') }}</p>
                  </a>
                </li>
                @endcan
              @endhasanyrole
              
              @hasanyrole('Users')
                @hasDirectPermission('Users - List')
                <li class="nav-item">
                  <a  href="{{ route('admin.user.index') }}" class="nav-link {{Settings::check_current_route('admin.user.index')}}">
                    <i class="fa fa-user nav-icon"></i>
                    <p>{{ __('leftbar.users') }}</p>
                  </a>
                </li>
                @endcan
              @endhasanyrole

            </ul>
          </li>
          @endhasanyrole

          @hasanyrole('Settings')
            @hasDirectPermission('Settings - View')
              <li class="nav-item">
                <a href="{{ route('admin.settings.index') }}" class="nav-link {{Settings::check_current_route('admin.settings.index')}}">
                  <i class="nav-icon fas fa-cogs"></i>
                  <p>
                  {{ __('leftbar.settings') }}
                  </p>
                </a>
              </li>
            @endcan
          @endhasanyrole

        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>