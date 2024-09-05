
<x-modal id="print-modal" modal_size="modal-lg"
title="{{ Settings::trans('Budget Transfer Transaction Print','د تعدیل پرنټ','پرنت تعدیل') }}">
      <div class="modal-body pt-0">
        <div class="row">
          <form action="{{ route('finance.budget.plan.transfer.external.save.form.info') }}" id="single-print-frm">
          <input type="hidden" name="id" id="print-id">
          @csrf
          <div class="col-sm-12 border-top mt-0 pt-2">

            <div class="row m-0">
              <x-input 
                  name="afmis_reg_no"
                  id="pr_afmis_reg_no" label="{{ Settings::trans('AFMIS Reg. No','د افمس ثبت ګڼه','شماره ثبت افمس') }}"
                  placeholder="{{ Settings::trans('AFMIS Reg. No','د افمس ثبت ګڼه','شماره ثبت افمس') }}"
                  type="text" 
                  col="col-sm-4" /> 
              <x-input 
                  name="sending_no"
                  id="pr_sending_no" label="{{ Settings::trans('Sending No.','د صادره ګڼه','شماره صادره') }}"
                  placeholder="{{ Settings::trans('Sending No.','د صادره ګڼه','شماره صادره') }}"
                  type="number" 
                  col="col-sm-4" /> 
              <x-input 
                  name="sending_date"
                  id="pr_sending_date" label="{{ Settings::trans('Sending Date.','د صادره تاریخ','تاریخ صادره') }}"
                  placeholder="{{ Settings::trans('Sending Date.','د صادره تاریخ','تاریخ صادره') }}"
                  type="date" 
                  col="col-sm-4" /> 

              <x-textarea 
                  name="needs_in_letters"
                  id="pr_needs_in_letters" label="{{ Settings::trans('Needs in letters.','د وزارت تقاضا په حرفونو','تقاضا وزارت مربوط به حروف') }}"
                  placeholder="{{ Settings::trans('Needs in letters.','د وزارت تقاضا په حرفونو','تقاضا وزارت مربوط به حروف') }}"
                  col="col-sm-12">
              </x-textarea> 

              <x-textarea 
                  name="prescription_gnrl_drctr"
                  id="pr_prescription_gnrl_drctr" label="{{ Settings::trans('Prescrition of the general directorate of national budget.','د ملي بودیجی عمومي ریاست تجویز','تجویز ریاست عمومی بودجه ملی') }}"
                  placeholder="{{ Settings::trans('Prescrition of the general directorate of national budget.','د ملي بودیجی عمومي ریاست تجویز','تجویز ریاست عمومی بودجه ملی') }}"
                  col="col-sm-12">
              </x-textarea> 
              
            </div>
          </div>

          <div class="col-sm-12 px-4 pt-4 border-top">
            <button class="btn btn-primary" onclick="print_page()" type="button">
              <i class="fa fa-print"></i> {{ Settings::trans('Print','پرنټ','پرنت') }}
              <div class="spinner-border text-white spinner-border-sm d-none loader" role="status">
                <span class="sr-only"></span>
              </div>
            </button>
            <button class="btn btn-secondary" type="button" data-dismiss="modal" aria-label="Close"> 
              <i class="fa fa-times"></i> {{ Settings::trans('Close','بندول','بندکردن') }}
            </button>
          </div>
          </form>
        </div>
      </div>
  </x-modal>

  @push('scripts')
  <script>
    function load_print_modal(id){
      loader('show');
      $.ajax({
          url: "{{ route('finance.budget.plan.transfer.internal.get.form.info') }}",
          type: "GET",
          data:{'id':id},
          success: function (data) {
            loader('hide');
            if(data.result==200){
              $('#print-id').val(id);
              $('#pr_afmis_reg_no').val(data.data.afmis_reg_no);
              $('#pr_sending_no').val(data.data.sending_no);
              $('#pr_sending_date').val(data.data.sending_date);
              $('#pr_needs_in_letters').val(data.data.needs_in_letters);
              $('#pr_prescription_gnrl_drctr').val(data.data.prescription_gnrl_drctr);
              $('#print-modal').modal('show');
            }
          },
          error: function (jqXHR, textStatus, errorThrown) {
              console.log(errorThrown);
              loader('hide');
          }
      });
    }

    function print_page(){
      loader('show');
      $.ajax({
          url: "{{ route('finance.budget.plan.transfer.internal.save.form.info') }}",
          type: "POST",
          data:$('#single-print-frm').serialize(),
          success: function (data) {
            loader('hide');
            if(data.result==200){
              $('#print-modal').modal('show');
              window.location.replace('{{ route("finance.budget.plan.transfer.internal.print.single.form.info") }}?id='+data.id);
            }
          },
          error: function (jqXHR, textStatus, errorThrown) {
              console.log(errorThrown);
              loader('hide');
          }
      });
    }

  </script>
  @endpush