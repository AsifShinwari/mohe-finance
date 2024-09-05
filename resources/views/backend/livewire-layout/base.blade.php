<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title> MOHE | Dashboard</title>
  @include('backend.layout.style')
</head>
<body class="@if(app()->getLocale()=='en') hold-transition sidebar-mini @else hold-transition sidebar-mini layout-fixed @endif"> 
<div class="wrapper">
  @include('backend.layout.nav')
  @include('backend.layout.leftbar')
 
     <!-- Main content -->
        {{ $slot }}
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  @include('backend.layout.rightbar')
  @include('backend.layout.footer')
</div>
<!-- ./wrapper -->
    @include('backend.layout.script')
    @yield('script')
    @stack('scripts')
</body>
</html>
