
       
        @php 
            $notifi = App\Models\Notification::get_count();
        @endphp
        
       <!-- Notifications Dropdown Menu -->
       <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          @if($notifi->total)
            <span class="badge badge-danger navbar-badge">{{ $notifi->total }}</span>
          @endif
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="min-width:300px !important;">
          <span class="dropdown-header">{{ $notifi->total }} {{ Settings::trans('Notifications','خبرتیاوې','اطلاعیه ها') }}</span>
          
            @foreach (App\Models\Notification::get_notif() as $item)
            <div class="dropdown-divider"></div>
            <a href="{{ route('notification.seen',str_replace('/', '*',$item->link)) }}" class="dropdown-item">
              <i class="fas fa-envelope mr-2 {{ ($item->seen) ? 'text-muted' : '' }}"></i>
              <span class="{{ ($item->seen) ? 'text-muted text-sm' : '' }}">
                {{ Settings::trans($item->title,$item->pa_title,$item->da_title) }}
              </span>
              <span class="float-right text-muted text-sm" style="direction:ltr !important;">
                {{ Settings::get_times($item->created_at,true) }} 
              </span>
            </a>
            @endforeach
          
          {{--<div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer text-center">Settings::trans('See All Notifications','ټولی خبرتیاوې','تمام اطلاعیه ها') </a>--}}
        </div>
      </li>