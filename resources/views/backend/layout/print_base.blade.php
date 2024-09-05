<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title> MOHE | Print</title>
  @include('backend.layout.style')
</head>
<body class="">
<div class="wrapper">
    <!-- Main content -->
        @yield('contents')
</div>
<!-- ./wrapper -->
    @include('backend.layout.script')
    @stack('scripts')
</body>
</html>
