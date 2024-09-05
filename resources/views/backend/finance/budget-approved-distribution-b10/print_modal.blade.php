
<x-modal id="print-modal" title="{{ Settings::trans('Print B10','د ب-۱۰ فورم پرنټ','پرنت فورم ب-۱۰') }}">
      <div class="modal-body">
        <form action="{{ route('finance.budget.plan.approved.distributions.b10.print') }}" method="get" id="print-frm">
        <div class="row">
          <input type="hidden" name="budget_plan_id" id="budget_plan_id" value="{{ $budget_plan->id }}">
          <x-select 
            name="code_project_6" 
            id="print_code_project_6" label="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}"
            col="col-sm-6"
            required="1"
            :list="$code_project_6" 
            :is_livewire='0'
            value="code"
            text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}"
            text="code"
            default="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}" /> 

          <x-select 
            name="code_program_3" 
            id="print_code_program_3" label="{{ Settings::trans('Program Code(3)','د برنامی کوډ(۳)','کود برنامه(۳)') }}"
            col="col-sm-6"
            required="1"
            :list="$code_program_3" 
            :is_livewire='0'
            value="program_code"
            text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}"
            text="program_code"
            default="{{ Settings::trans('Program Code(3)','د برنامی کوډ(۳)','کود برنامه(۳)') }}" /> 

          <x-select 
            name="code_fund_4" 
            id="print_code_fund_4" label="{{ Settings::trans('Fund Code(4)','د وجه کوډ(۴)','کود وجه(۴)') }}"
            col="col-sm-6"
            required="1"
            :list="$code_fund_4" 
            :is_livewire='0'
            value="sub_fund_code"
            text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}"
            text="sub_fund_code"
            default="{{ Settings::trans('Fund Code(4)','د وجه کوډ(۴)','کود وجه(۴)') }}" /> 

          <x-select 
            name="code_loaction" 
            id="print_code_loaction" label="{{ Settings::trans('Province Code(2)','د ولایت کوډ(۲)','کود ولایت(۲)') }}"
            col="col-sm-6" 
            required="1"
            :list="$code_location_2" 
            :is_livewire='0'
            value="prov_code"
            text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}"
            text="prov_code"
            default="{{ Settings::trans('Province Code(2)','د ولایت کوډ(۲)','کود ولایت(۲)') }}" /> 

          <x-select 
            name="code_object_2" 
            id="print_code_object_2" label="{{ Settings::trans('Object Code(2)','د باب کوډ(۲)','کود باب(۲)') }}"
            default="{{ Settings::trans('Object Code(2)','د باب کوډ(۲)','کود باب(۲)') }}" 
            col="col-sm-12" 
            required="1"
            :list="$code_objects_2" 
            :is_livewire='0'
            value="major_code"
            text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}"
            text="major_code" />

          <div class="col-sm-12">

            <button class="btn btn-s btn-secondary" id="print-btn-2" type="submit">
              {{ Settings::trans('Print','پرنټ','پرنت') }} <i class="fa fa-print"></i>
            </button>

            <button class="btn btn-primary" id="add-b10-info" type="button">
              {{ Settings::trans('B10 Info','د فورم معلومات','معلومات فورم') }} <i class="fa fa-info"></i>
            </button>
          </div>

          <div class="col-sm-12 border-top mt-4 pt-4 d-none" id="add-b10-info-container">
            <div class="row m-0">
                
                <x-input 
                  name="b10_gnrl_bgt_mgr" 
                  id="b10_gnrl_bgt_mgr" label="{{ Settings::trans('Budget General Manager','د بودجی عمومي مدیر','مدیر عمومی بودجه') }}"
                  placeholder="{{ Settings::trans('Budget General Manager','د بودجی عمومي مدیر','مدیر عمومی بودجه') }}"
                  type="text" 
                  col="col-sm-6" /> 
                <x-input 
                  name="b10_finance_drctr" 
                  id="b10_finance_drctr" label="{{ Settings::trans('Admin & Finance Director','مالي او اداري رئیس','رئیس مالی و اداری') }}"
                  placeholder="{{ Settings::trans('Admin & Finance Director','مالي او اداري رئیس','رئیس مالی و اداری') }}"
                  type="text" 
                  col="col-sm-6" /> 
                <x-input 
                  name="b10_gnrl_drctr" 
                  id="b10_gnrl_drctr" label="{{ Settings::trans('Admin & Finance General Director','اداري او مالي معین','معین مالی و اداری') }}"
                  placeholder="{{ Settings::trans('Admin & Finance General Director','اداري او مالي معین','معین مالی و اداری') }}"
                  type="text" 
                  col="col-sm-6" /> 
                <x-input 
                  name="b10_afmis_reg_no" 
                  id="b10_afmis_reg_no" label="{{ Settings::trans('AFMIS Registration No.','د افمس ثبت ګڼه','شماره ثبت افمس') }}"
                  placeholder="{{ Settings::trans('AFMIS Registration No.','د افمس ثبت ګڼه','شماره ثبت افمس') }}"
                  type="text" 
                  col="col-sm-6" /> 
                <div class="col-sm-6">

                  <button class="btn btn-s btn-info" id="save-b10-info" type="button">
                    {{ Settings::trans('Save','ثبت','ثبت') }} <i class="fa fa-save"></i>
                  </button>

                  <button class="btn btn-s btn-secondary" id="cncl-b10-info" type="button">
                    {{ Settings::trans('Cancel','بندول','بندکردن') }} <i class="fa fa-times"></i>
                  </button>
                </div>
            </div>
          </div>

        </div>
        </form>
      </div>
  </x-modal>

  @push('scripts')
  <script>
    $(document).ready(function () {
        $("#add-b10-info").click(function() {
            $.ajax({
                url: "{{ route('finance.budget.plan.approved.distributions.b10.get_info') }}",
                type: "GET",
                data:{'budget_plan_id':$('#budget_plan_id').val()},
                success: function (data) {

                    $('#b10_afmis_reg_no').val(data.b10_afmis_reg_no);
                    $('#b10_finance_drctr').val(data.b10_finance_drctr);
                    $('#b10_gnrl_bgt_mgr').val(data.b10_gnrl_bgt_mgr);
                    $('#b10_gnrl_drctr').val(data.b10_gnrl_drctr);

                    $("#add-b10-info-container").removeClass("d-none");
                    $("#add-b10-info").addClass("d-none");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(errorThrown);
                }
            });
        });

        $("#cncl-b10-info").click(function() {
          $("#add-b10-info-container").addClass("d-none");
          $("#add-b10-info").removeClass("d-none");
        });

        $("#save-b10-info").click(function() {
            $.ajax({
                url: "{{ route('finance.budget.plan.approved.distributions.b10.save-print-info') }}",
                type: "GET",
                data:$('#print-frm').serialize(),
                success: function (data) {
                    
                    $('#b10_afmis_reg_no').val(data.b10_afmis_reg_no);
                    $('#b10_finance_drctr').val(data.b10_finance_drctr);
                    $('#b10_gnrl_bgt_mgr').val(data.b10_gnrl_bgt_mgr);
                    $('#b10_gnrl_drctr').val(data.b10_gnrl_drctr);

                    $("#add-b10-info-container").addClass("d-none");
                    $("#add-b10-info").removeClass("d-none");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(errorThrown);
                }
            });
        });
    });
  </script>
  @endpush