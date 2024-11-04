
<x-modal id="add-modal" modal_size="modal-lg"
title="{{ Settings::trans('Budget Transfer','د داخلي واحدونو بودیجی تعدیل','تعدیل بودجه در واحدهای داخلی') }}">
      <div class="modal-body pt-0"> 
        <form action="{{ route('finance.budget.dev.plan.transfers.internal.print.info') }}" method="get" id="add-frm">
        <div class="row">
          
          <div class="col-sm-4 py-4">
            <h6 class="text-primary mb-0">
              <div class="custom-control custom-radio">
                <input class="custom-control-input" checked name="chk_transfers" type="radio" id="chk-transfers-primary" value="primary">
                <label for="chk-transfers-primary" class="custom-control-label">{{ Settings::trans('Primary Transfers','تعدیل اصل منظوری','تعدیل در اصل منظوری') }}</label>
              </div>
            </h6>
          </div>
          <div class="col-sm-4 py-4">
            <h6 class="text-primary mb-0">
              <div class="custom-control custom-radio">
                <input class="custom-control-input" name="chk_transfers" type="radio" id="chk-transfers-category" value="category">
                <label for="chk-transfers-category" class="custom-control-label">{{ Settings::trans('Category Transfers','کتګوري تعدیل','تعدیل در کتګوری') }}</label>
              </div>
            </h6>
          </div>
          <div class="col-sm-4 py-4">
            <h6 class="text-primary mb-0">
              <div class="custom-control custom-radio">
                <input class="custom-control-input" name="chk_transfers" type="radio" id="chk-transfers-month" value="month">
                <label for="chk-transfers-month" class="custom-control-label">{{ Settings::trans('Month Transfers','دمیاشت تعدیل','تعدیل در ماه') }}</label>
              </div>
            </h6>
          </div>

          <div class="col-sm-12 border-bottom"></div>

          <input type="hidden" name="budget_plan_id" id="budget_plan_id" value="{{ $budget_plan->id }}">
          <div class="col-sm-6 border-lef mt-0 pt-2">
            <div class="row m-0">
                <h6 class="col-sm-12 mb-4 text-secondary">{{ Settings::trans('Code (Cr-)','د تنقیص کوډ','کود تنقیص') }}</h5>

                <x-select 
                  name="cr_code_org_5" 
                  id="cr_code_org_5" label="{{ Settings::trans('Organization(5)','اداره(۵)','اداره(۵)') }}"
                  col="col-sm-6"
                  required="1"
                  :list="$code_org_5" 
                  :is_livewire='0'
                  onchange="get_code_amount()"
                  value="sub_org_code"
                  text="sub_org_code"
                  default="{{ Settings::trans('Organization(5)','اداره(۵)','اداره(۵)') }}" /> 

                <x-select 
                  name="cr_code_project_6" 
                  id="cr_code_project_6" label="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}"
                  col="col-sm-6"
                  required="1"
                  onchange="get_code_amount()"
                  :list="$code_project_6" 
                  :is_livewire='0'
                  value="code"
                  text="code"
                  default="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}" /> 

                <x-select 
                  name="cr_code_program_3" 
                  id="cr_code_program_3" label="{{ Settings::trans('Program Code(3)','د برنامی کوډ(۳)','کود برنامه(۳)') }}"
                  col="col-sm-6"
                  onchange="get_code_amount()"
                  required="1"
                  :list="$code_program_3" 
                  :is_livewire='0'
                  value="program_code"
                  text="program_code"
                  default="{{ Settings::trans('Program Code(3)','د برنامی کوډ(۳)','کود برنامه(۳)') }}" /> 

                <x-select 
                  name="cr_code_fund_4" 
                  id="cr_code_fund_4" label="{{ Settings::trans('Fund Code(4)','د وجه کوډ(۴)','کود وجه(۴)') }}"
                  col="col-sm-6"
                  required="1"
                  onchange="get_code_amount()"
                  :list="$code_fund_4" 
                  :is_livewire='0'
                  value="sub_fund_code"
                  text="sub_fund_code"
                  default="{{ Settings::trans('Fund Code(4)','د وجه کوډ(۴)','کود وجه(۴)') }}" /> 

                <x-select 
                  name="cr_code_loaction" 
                  id="cr_code_loaction" label="{{ Settings::trans('Province Code(2)','د ولایت کوډ(۲)','کود ولایت(۲)') }}"
                  col="col-sm-6" 
                  required="1"
                  onchange="get_code_amount()"
                  :list="$code_location_2" 
                  :is_livewire='0'
                  value="prov_code"
                  text="prov_code"
                  default="{{ Settings::trans('Province Code(2)','د ولایت کوډ(۲)','کود ولایت(۲)') }}" /> 

                  <x-select 
                  name="cr_code_cate_1" 
                  id="cr_code_cate_1" label="{{ Settings::trans('Category Code(1)','(۱)کټګوری کوډ(۱)','کود کتګوری') }}"
                  default="{{ Settings::trans('Category Code(1)','(۱)کټګوری کوډ(۱)','کود کتګوری') }}" 
                  col="col-sm-6" 
                  required="1"
                  onchange="get_code_amount()"
                  :list="$code_category" 
                  :is_livewire='0'
                  value="code"
                  text="code" />

                <x-select 
                  name="cr_code_object_2" 
                  id="cr_code_object_2" label="{{ Settings::trans('Object Code(2)','د باب کوډ(۲)','کود باب(۲)') }}"
                  default="{{ Settings::trans('Object Code(2)','د باب کوډ(۲)','کود باب(۲)') }}" 
                  col="col-sm-6" 
                  onchange="get_code_amount()"
                  required="1"
                  :list="$code_objects_2" 
                  :is_livewire='0'
                  value="major_code"
                  text="major_code" />

                <x-select 
                  name="cr_month" 
                  id="cr_month" label="{{ Settings::trans('Month','میاشت','ماه') }}"
                  default="{{ Settings::trans('Month','میاشت','ماه') }}" 
                  col="col-sm-6" 
                  required="1"
                  onchange="get_code_amount()"
                  :list="Settings::months()" 
                  :is_livewire='0'
                  value="value_col"
                  text="{{ Settings::trans('en_name','pa_name','da_name') }}" />

                <x-input 
                  name="cr_amount" 
                  readonly="1"
                  id="cr_amount" label="{{ Settings::trans('Total Coding Amount(Remaining)','د کوډ باقي ارقام','ارقام باقی مانده کود') }}"
                  placeholder="{{ Settings::trans('Total Coding Amount','د کوډ مجموعي ارقام','ارقام مجموعی کود') }}"
                  type="number" 
                  col="col-sm-12" /> 
            </div>
          </div>
          <div class="col-sm-6 border-left mt-0 pt-2">
            <div class="row m-0">
          
                <h5 class="col-sm-12 mb-4 text-secondary">{{ Settings::trans('Code (Dr+)','د تزئید کوډ','کود تزئید') }}</h5>
                {{--<x-select 
                  name="dr_code_org_5" 
                  id="dr_code_org_5" label="{{ Settings::trans('Organization(5)','اداره(۵)','اداره(۵)') }}"
                  col="col-sm-6"
                  required="1"
                  readonly
                  :list="$code_org_5" 
                  :is_livewire='0'
                  value="sub_org_code"
                  text="sub_org_code"
                  default="{{ Settings::trans('Organization(5)','اداره(۵)','اداره(۵)') }}" /> 

                <x-select 
                  name="dr_code_project_6" 
                  id="dr_code_project_6" label="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}"
                  col="col-sm-6"
                  required="1"
                  :list="$code_project_6" 
                  :is_livewire='0'
                  value="code"
                  text="code"
                  default="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}" /> 

                <x-select 
                  name="dr_code_program_3" 
                  id="dr_code_program_3" label="{{ Settings::trans('Program Code(3)','د برنامی کوډ(۳)','کود برنامه(۳)') }}"
                  col="col-sm-6"
                  :list="$code_program_3" 
                  :is_livewire='0'
                  value="program_code"
                  text="program_code"
                  default="{{ Settings::trans('Program Code(3)','د برنامی کوډ(۳)','کود برنامه(۳)') }}" /> 

                <x-select 
                  name="dr_code_fund_4" 
                  id="dr_code_fund_4" label="{{ Settings::trans('Fund Code(4)','د وجه کوډ(۴)','کود وجه(۴)') }}"
                  col="col-sm-6"
                  required="1"
                  :list="$code_fund_4" 
                  :is_livewire='0'
                  value="sub_fund_code"
                  text="sub_fund_code"
                  default="{{ Settings::trans('Fund Code(4)','د وجه کوډ(۴)','کود وجه(۴)') }}" /> --}}

                <x-select 
                  name="dr_code_loaction" 
                  id="dr_code_loaction" label="{{ Settings::trans('Province Code(2)','د ولایت کوډ(۲)','کود ولایت(۲)') }}"
                  col="col-sm-12" 
                  required="1"
                  :list="$code_location_2" 
                  :is_livewire='0'
                  value="prov_code"
                  text="prov_code"
                  default="{{ Settings::trans('Province Code(2)','د ولایت کوډ(۲)','کود ولایت(۲)') }}" /> 

                <x-select 
                  name="dr_code_cate_1" 
                  id="dr_code_cate_1" label="{{ Settings::trans('Category Code(1)','(۱)کټګوری کوډ(۱)','کود کتګوری') }}"
                  default="{{ Settings::trans('Category Code(1)','(۱)کټګوری کوډ(۱)','کود کتګوری') }}" 
                  col="col-sm-12" 
                  required="1"
                  :list="$code_category" 
                  :is_livewire='0'
                  value="code"
                  text="code" />
                <x-select 
                  name="dr_month" 
                  id="dr_month" label="{{ Settings::trans('Month','میاشت','ماه') }}"
                  default="{{ Settings::trans('Month','میاشت','ماه') }}" 
                  col="col-sm-12" 
                  required="1"
                  :list="Settings::months()" 
                  :is_livewire='0'
                  value="value_col"
                  text="{{ Settings::trans('en_name','pa_name','da_name') }}" />

                <x-input 
                  name="dr_amount" 
                  required="1"
                  id="dr_amount" label="{{ Settings::trans('Amount (Dr+)','د تزئید ارقام','ارقام تزئید') }}"
                  placeholder="{{ Settings::trans('Amount (Dr+)','د تزئید ارقام','ارقام تزئید') }}"
                  type="number" 
                  col="col-sm-12" /> 

            </div>

          </div>
          
          <div class="col-sm-12 border-top mt-0 pt-2">

            <h5 class="text-secondary">
              <div class="custom-control custom-checkbox">
                <input class="custom-control-input" name="chk_form_info" type="checkbox" id="chk-form-info">
                <label for="chk-form-info" class="custom-control-label">{{ Settings::trans('Form Information','د فورم معلومات','معلومات فورم') }}</label>
              </div>
            </h5>

            <div class="row m-0 d-none" id="form-info-container">
              <x-input 
                  name="afmis_reg_no"
                  id="afmis_reg_no" label="{{ Settings::trans('AFMIS Reg. No','د افمس ثبت ګڼه','شماره ثبت افمس') }}"
                  placeholder="{{ Settings::trans('AFMIS Reg. No','د افمس ثبت ګڼه','شماره ثبت افمس') }}"
                  type="text" 
                  col="col-sm-4" /> 
              <x-input 
                  name="sending_no"
                  id="sending_no" label="{{ Settings::trans('Sending No.','د صادره ګڼه','شماره صادره') }}"
                  placeholder="{{ Settings::trans('Sending No.','د صادره ګڼه','شماره صادره') }}"
                  type="number" 
                  col="col-sm-4" /> 
              <x-input 
                  name="sending_date"
                  id="sending_date" label="{{ Settings::trans('Sending Date.','د صادره تاریخ','تاریخ صادره') }}"
                  placeholder="{{ Settings::trans('Sending Date.','د صادره تاریخ','تاریخ صادره') }}"
                  type="date" 
                  col="col-sm-4" /> 

              <x-textarea 
                  name="needs_in_letters"
                  id="needs_in_letters" label="{{ Settings::trans('Needs in letters.','د وزارت تقاضا په حرفونو','تقاضا وزارت مربوط به حروف') }}"
                  placeholder="{{ Settings::trans('Needs in letters.','د وزارت تقاضا په حرفونو','تقاضا وزارت مربوط به حروف') }}"
                  col="col-sm-12">
              </x-textarea> 

              <x-textarea 
                  name="prescription_gnrl_drctr"
                  id="prescription_gnrl_drctr" label="{{ Settings::trans('Prescrition of the general directorate of national budget.','د ملي بودیجی عمومي ریاست تجویز','تجویز ریاست عمومی بودجه ملی') }}"
                  placeholder="{{ Settings::trans('Prescrition of the general directorate of national budget.','د ملي بودیجی عمومي ریاست تجویز','تجویز ریاست عمومی بودجه ملی') }}"
                  col="col-sm-12">
              </x-textarea> 
              
            </div>
          </div>

          <div class="col-sm-12 px-4 pt-4 border-top">
            <button class="btn btn-primary" onclick="save()" type="button">
              <i class="fa fa-save"></i> {{ Settings::trans('Save','ثبت','ثبت') }}
              <div class="spinner-border text-white spinner-border-sm d-none loader" role="status">
                <span class="sr-only"></span>
              </div>
            </button>
            <button class="btn btn-secondary" type="button" data-dismiss="modal" aria-label="Close"> 
              <i class="fa fa-times"></i> {{ Settings::trans('Close','بندول','بندکردن') }}
            </button>
          </div>
        </div>
        </form>
      </div>
  </x-modal>

  @push('scripts')
  <script>
    $(document).ready(function () {
        
      function updateValueIfReadonly(source, target) {
        if ($(target).is('[readonly]')) {
          $(target).val($(source).val()).change();
        }
      }

      $(document).ready(function() {
        $('#cr_month').change(function () {
          updateValueIfReadonly(this, '#dr_month');
        });

        $('#cr_code_cate_1').change(function () {
          updateValueIfReadonly(this, '#dr_code_cate_1');
        });

        $('#cr_code_loaction').change(function () {
          updateValueIfReadonly(this, '#dr_code_loaction');
        });
      });

        $("#add-b10-info").click(function() {
          loader('show');

            $.ajax({
                url: "{{ route('finance.budget.dev.plan.transfers.internal.get.info') }}",
                type: "GET",
                data:{'budget_plan_id':$('#budget_plan_id').val()},
                success: function (data) {
                  loader('hide');
                    $('#b10_afmis_reg_no').val(data.b10_afmis_reg_no);
                    $('#b10_finance_drctr').val(data.b10_finance_drctr);
                    $('#b10_gnrl_bgt_mgr').val(data.b10_gnrl_bgt_mgr);
                    $('#b10_gnrl_drctr').val(data.b10_gnrl_drctr);

                    $("#add-b10-info-container").removeClass("d-none");
                    $("#add-b10-info").addClass("d-none");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(errorThrown);
                    loader('hide');
                }
            });
            
        });

        $('#dr_amount').on('input',function(e){
          var total_val = parseFloat($('#cr_amount').val());
          var val = parseFloat($(e.target).val());
          if(val > total_val){
            $(e.target).val(total_val);
            toastr['error']('Amount exceeds the total amount!');
          }
        });

        var show_form_info_container = false;

            $('#chk-form-info').click(function(){
              show_form_info_container = !show_form_info_container;
              if(show_form_info_container){
                $('#form-info-container').removeClass("d-none");
              }else{
                $('#form-info-container').addClass("d-none");
              }
            });
    });

    function get_code_amount(){
    
      if($('#cr_code_loaction').val()!=''&&
        $('#cr_code_fund_4').val()!='' &&
        $('#cr_code_object_2').val()!='' &&
        $('#cr_code_program_3').val()!='' &&
        $('#cr_code_cate_1').val()!='' &&
        $('#cr_code_project_6').val()!=''){
          loader('show');

        $.ajax({
            url: "{{ route('finance.budget.dev.plan.transfers.internal.get.code.amount') }}",
            type: "GET",
            data:$('#add-frm').serialize(),
            success: function (data) {
              console.log(data);
              loader('hide');
              $('#cr_amount').val(data.remaining_amount);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(errorThrown);
              loader('hide');
            }
        });
      }
    }

    function save(){
      if(validate_field('dr_code_fund_4') 
      || validate_field('dr_code_loaction') 
      || validate_field('dr_code_object_2')
      || validate_field('dr_code_org_5') 
      || validate_field('dr_code_project_6') 
      || validate_field('dr_amount') 
      || validate_field('dr_code_program_3')
      || validate_field('dr_code_cate_1') 
      || validate_field('dr_month')){
          toastr['error']('Validation Failed!');
          return;
      }
      $.ajax({
            url: "{{ route('finance.budget.dev.plan.transfers.internal.save') }}",
            type: "GET",
            data:$('#add-frm').serialize(),
            success: function (data) {
              
              loader('hide');
              
              toastr[data.msg_type](data.msg);
              
              if(data.result==200){
                
                $('#tbl-container').html('');
                $('#tbl-container').html(data.tbl_html);
                $('#add-modal').modal('hide');
                clear_all();
              }

              $('#cr_amount').val(data.remaining_amount);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(errorThrown);
              loader('hide');
            }
        });
    }

    function clear_all(){
      $('#dr_code_program_3').val('').change();
      $('#dr_code_fund_4').val('').change();
      $('#dr_code_loaction').val('').change();
      $('#dr_code_object_2').val('').change();
      $('#dr_code_org_5').val('').change();
      $('#dr_code_project_6').val('').change();
      $('#dr_amount').val('');

      $('#cr_code_org_5').val('').change();
      $('#cr_code_project_6').val('').change();
      $('#cr_code_program_3').val('').change();
      $('#cr_code_fund_4').val('').change();
      $('#cr_code_object_2').val('').change();
      $('#cr_code_loaction').val('').change();
      $('#cr_amount').val('');

      $('#prescription_gnrl_drctr').val('');
      $('#needs_in_letters').val('');
      $('#sending_date').val('');
      $('#sending_no').val('');
      $('#afmis_reg_no').val('');
    }




    //===================Form Type Changed====================//
    $(document).ready(function() {
      // Trigger the function when any of the radio buttons change
      $('input[name="chk_transfers"]').change(function() {
        // Get the id of the selected radio button
        var selectedRadioId = $(this).attr('id');
        
        // Execute different code based on the selected radio button
        switch (selectedRadioId) {
          case 'chk-transfers-primary':
            // Code to execute when "Primary Transfers" is selected
            $('#dr_month').attr('readonly', true);
            $('#dr_code_cate_1').attr('readonly', true);
            $('#dr_code_loaction').removeAttr('readonly');
            break;
            
          case 'chk-transfers-category':
            // Code to execute when "Category Transfers" is selected
            $('#dr_month').attr('readonly', true);
            $('#dr_code_loaction').attr('readonly', true);
            $('#dr_code_cate_1').removeAttr('readonly');
            break;
            
          case 'chk-transfers-month':
            // Code to execute when "Month Transfers" is selected
            $('#dr_code_cate_1').attr('readonly', true);
            $('#dr_code_loaction').attr('readonly', true);
            $('#dr_month').removeAttr('readonly');
            break;
            
          default:
            // Default action (if any)
            $('#dr_code_cate_1').removeAttr('readonly', true);
            $('#dr_code_loaction').removeAttr('readonly', true);
            $('#dr_month').removeAttr('readonly');
            break;
        }
      });
      $('input[name="chk_transfers"]:checked').trigger('change');
    });
    
  </script>
  @endpush