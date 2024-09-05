@if(app()->getLocale()=='en')
    <script src="{{ asset('assets/backend/plugins/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('assets/backend/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/backend/dist/js/adminlte.min.js') }}"></script>
    <script src="{{ asset('assets/backend/plugins/summernote/summernote-bs4.min.js') }}"></script>
    <!-- <script> document.getElementsByClassName('content-wrapper')[1].classList=''; </script> -->
@else
    <script src="{{ asset('assets/backend/rtl-assets/plugins/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('assets/backend/rtl-assets/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/backend/rtl-assets/plugins/summernote/summernote-bs4.min.js') }}"></script>
    <script src="{{ asset('assets/backend/rtl-assets/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') }}"></script>
    <script src="{{ asset('assets/backend/rtl-assets/dist/js/adminlte.js') }}"></script>
    <script src="{{ asset('assets/backend/rtl-assets/dist/js/demo.js') }}"></script>

@endif
    <script src="{{asset('shamsi_calendars/js/persianDatepicker.min.js')}}"> </script>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="{{ asset('assets/backend/toastr/toastr.min.js') }}"></script>
    <script src="{{ asset('assets/backend/toastr/toastr.init.js') }}"></script>

<script>
    $(function(){
        document.addEventListener('closeModal', (obj) => {
            $(`#${obj.detail.modal_id}`).modal('hide');
        });
    });
    
    document.addEventListener('success', (obj) => {
        toastr['success'](obj.detail.msg);
    });

    document.addEventListener('error', (obj) => {
        toastr['error'](obj.detail.msg);
    });

    document.addEventListener('errors', (obj) => {
        toastr['error']('Validation Error!');
    });

    @if($errors->any())
        @php $error_msgs=''; @endphp
        @foreach($errors->all() as $error)
            @php $error_msgs.=$error; @endphp
        @endforeach
        toastr['error']('{{ $error_msgs }}');
    @endif

    document.addEventListener('warning', (obj) => {
        toastr['warning'](obj.detail.msg);
    });
    function ifNaN(value){
        if(Number.isNaN(value)){value=0;}
        return value;
    }

    function loader(status){
       if(status=='show'){
          $('.loader').removeClass('d-none');
       }else if(status=='hide'){
          $('.loader').addClass('d-none');
       }
    }

    function validate_field(id){
      var val=$('#'+id).val();
      var is_valid=0;
      if(val==''){
         $('#'+id).addClass('border border-danger');
         $('#select2-'+id+'-container').closest('.selection').find('.select2-selection').addClass('border border-danger');
         is_valid=1;
      }else{
         $('#'+id).removeClass('border border-danger');
         $('#select2-'+id+'-container').closest('.selection').find('.select2-selection').removeClass('border border-danger');
         is_valid=0;
      }
      return is_valid;
    }
</script>

