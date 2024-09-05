  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light"> 
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item">
        <a class="nav-link">
          {{ Settings::trans(auth()->user()->dep()->name,auth()->user()->dep()->pa_name,auth()->user()->dep()->da_name) }}
        </a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav" style="{{ (app()->getLocale()!='en') ? 'margin-right: auto !important;' : 'margin-left: auto !important;' }}">
      
      @include('backend.layout.inc_nav_notification')

      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="fa fa-language"></i>
          <span class="badge badge-warning navbar-badge">{{ __('lang.abbr') }}</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="{{ route('change.locale','pa') }}" class="dropdown-item">
            <div class="media">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  {{ Settings::trans('Pashto','پښتو','پشتو') }}
                </h3>
              </div>
            </div>
          </a>
          <div class="dropdown-divider"></div>
          <a href="{{ route('change.locale','da') }}" class="dropdown-item">
            <div class="media">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                {{ Settings::trans('Dari','دري','دری') }}

                </h3>
              </div>
            </div>
          </a>
          <div class="dropdown-divider"></div>
          <a href="{{ route('change.locale','en') }}" class="dropdown-item">
            <div class="media">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                {{ Settings::trans('English','انګلیسي','انګلیسی') }}

                </h3>
              </div>
            </div>
          </a>
          <div class="dropdown-divider"></div>
          <!-- <a href="#" class="dropdown-item dropdown-footer">See All Messages</a> -->
        </div>
      </li>
     
      <li class="nav-item">
        <a class="nav-link" href="{{ route('admin.logout') }}">
          <i class="fas fa-power-off text-danger"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->