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

          @hasanyrole('Admin|Finance')
          <li class="nav-item {{ Settings::check_in_routes(['finance.master.funds.index','finance.master.objects.index','finance.master.orgs.index','finance.master.program.index','finance.master.project.index','finance.master.location.index','finance.master.measurement.index']) }}">
            <a href="#" class="nav-link {{ Settings::check_in_routes(['finance.master.funds.index','finance.master.objects.index','finance.master.orgs.index','finance.master.program.index','finance.master.project.index','finance.master.location.index','finance.master.measurement.index'])!='' ? 'active' : '' }}">
              <i class="nav-icon fas fa-database"></i>
              <p>
                {{ __('leftbar.master_data') }}
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              
              <li class="nav-item">
                <a  href="{{ route('finance.master.funds.index') }}" class="nav-link {{Settings::check_current_route('finance.master.funds.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.funds') }}</p>
                </a>
              </li>
              <li class="nav-item">
                <a  href="{{ route('finance.master.objects.index') }}" class="nav-link {{Settings::check_current_route('finance.master.objects.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.code_objects') }}</p>
                </a>
              </li>
              <li class="nav-item">
                <a  href="{{ route('finance.master.orgs.index') }}" class="nav-link {{Settings::check_current_route('finance.master.orgs.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.code_orgs') }}</p>
                </a>
              </li>
              
              <li class="nav-item">
                <a  href="{{ route('finance.master.program.index') }}" class="nav-link {{Settings::check_current_route('finance.master.program.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.code_programs') }}</p>
                </a>
              </li>

              <li class="nav-item">
                <a  href="{{ route('finance.master.project.index') }}" class="nav-link {{Settings::check_current_route('finance.master.project.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.code_projects') }}</p>
                </a>
              </li>

              <li class="nav-item">
                <a  href="{{ route('finance.master.location.index') }}" class="nav-link {{Settings::check_current_route('finance.master.location.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.code_locations') }}</p>
                </a>
              </li>

              <li class="nav-item">
                <a  href="{{ route('finance.master.measurement.index') }}" class="nav-link {{Settings::check_current_route('finance.master.measurement.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.measurements') }}</p>
                </a>
              </li>

            </ul>
          </li>
          @endhasanyrole

          @hasanyrole('Admin|Finance')
          <li class="nav-item {{ Settings::check_in_routes(['finance.budget.plan.index']) }}">
            <a href="#" class="nav-link {{ Settings::check_in_routes(['finance.budget.plan.index'])!='' ? 'active' : '' }}">
              <i class="nav-icon fas fa-coins"></i>
              <p>
                {{ __('leftbar.budget_plan') }}
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              
              <li class="nav-item">
                <a  href="{{ route('finance.budget.plan.index') }}" class="nav-link {{Settings::check_current_route('finance.budget.plan.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.budget_plan_regular') }}</p>
                </a>
              </li>

              <li class="nav-item">
                <a  href="{{ route('finance.budget.plan.index') }}" class="nav-link {{Settings::check_current_route('finance.budget.plan.index')}}">
                  <i class="far fa-circle nav-icon"></i>
                  <p>{{ __('leftbar.budget_plan_dev') }}</p>
                </a>
              </li>

            </ul>
          </li>
          @endhasanyrole

          @hasanyrole('Admin|Finance')
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

          @hasanyrole('Admin|HR')
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

          @hasanyrole('Admin')
          <li class="nav-item {{ Settings::check_in_routes(['admin.user.index','admin.user.create','admin.user.edit','admin.roles.index','admin.permission.index']) }}">
            <a href="#" class="nav-link {{ Settings::check_in_routes(['admin.user.index','admin.user.create','admin.user.edit','admin.roles.index','admin.permission.index'])!='' ? 'active' : '' }}">
              <i class="nav-icon fa fa-users"></i>
              <p>
              {{ __('leftbar.users') }}
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">

              @hasDirectPermission('Users Roles - Can View')
              <li class="nav-item">
                <a  href="{{ route('admin.roles.index') }}" class="nav-link {{Settings::check_current_route('admin.roles.index')}}">
                  <i class="fa fa-gavel nav-icon"></i>
                  <p>{{ __('leftbar.roles') }}</p>
                </a>
              </li>
              @endcan

              @hasDirectPermission('Users Permission - Can View')
              <li class="nav-item">
                <a  href="{{ route('admin.permission.index') }}" class="nav-link {{Settings::check_current_route('admin.permission.index')}}">
                  <i class="fa fa-lock nav-icon"></i>
                  <p>{{ __('leftbar.permissions') }}</p>
                </a>
              </li>
              @endcan
              
              @hasDirectPermission('Users - Can View')
              <li class="nav-item">
                <a  href="{{ route('admin.user.index') }}" class="nav-link {{Settings::check_current_route('admin.user.index')}}">
                  <i class="fa fa-user nav-icon"></i>
                  <p>{{ __('leftbar.users') }}</p>
                </a>
              </li>
              @endcan

            </ul>
          </li>
          @endhasanyrole

          @hasanyrole('Admin|Settings')
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