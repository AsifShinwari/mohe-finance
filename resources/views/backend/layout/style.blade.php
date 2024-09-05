@if(app()->getLocale()=='en')
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="{{ asset('assets/backend/plugins/fontawesome-free/css/all.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/backend/dist/css/adminlte.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/backend/custom.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/backend/plugins/summernote/summernote-bs4.min.css') }}">
@else
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="{{ asset('assets/backend/plugins/fontawesome-free/css/all.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/backend/rtl-assets/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/backend/rtl-assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/backend/rtl-assets/plugins/jqvmap/jqvmap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/backend/rtl-assets/dist/css/adminlte.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/backend/rtl-assets/plugins/overlayScrollbars/css/OverlayScrollbars.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/backend/rtl-assets/plugins/daterangepicker/daterangepicker.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/backend/rtl-assets/plugins/summernote/summernote-bs4.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/backend/rtl-assets/rtlcss-bootstrap-4-2-1.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/backend/rtl-assets/dist/css/custom.css') }}">
@endif
    <link  rel="stylesheet" href="{{asset('shamsi_calendars/css/persianDatepicker-default.css')}}" >
    <link href="{{ asset('assets/backend/toastr/toastr.min.css') }}" rel="stylesheet" type="text/css"  id="app-stylesheet" />

<style>
 #nprogress {
    .bar {
        z-index: 2000 !important;
    }

    .spinner {
        z-index: 2000 !important;        
    }
}
    
    /* select2 custome css */
    .select2-container{
        width: 100% !important;
    }
    .select2-selection__rendered {
        line-height: 1.5 !important;
    }
    .select2-container .select2-selection--single {
        height: calc(2.25rem + 2px) !important;
    }
    .select2-selection__arrow {
        height: calc(2.25rem + 2px) !important;
    }
    select[readonly].select2-hidden-accessible + .select2-container {
        pointer-events: none;
        touch-action: none;
        opacity:0.6;
        cursor:no-drop;
    }
</style>