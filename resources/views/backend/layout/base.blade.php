<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title> MOHE | Dashboard</title>
  @include('backend.layout.style')
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  @include('backend.layout.nav')
  @include('backend.layout.leftbar')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">@yield('page_title')</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                @yield('page_nav')
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
        @yield('contents')
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  @include('backend.layout.rightbar')
  @include('backend.layout.footer')
</div>
<!-- ./wrapper -->
    @include('backend.layout.script')
    @stack('scripts')
</body>
</html>
