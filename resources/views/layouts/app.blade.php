@include('layouts.header')
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  @include('layouts.nav_sidebar')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    @yield('content')
  </div>
  <!-- /.content-wrapper -->
</div>
  @include('layouts.footer')