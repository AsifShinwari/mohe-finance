@extends('backend.layout.base')


@section('page_title')
  {{ Settings::trans('Form-B20','د ب-۲۰ فورم','فورم ب-۲۰') }} {{ substr(Settings::change_to_hijri($budget_plan->year),0,4) }}
@endsection

@section('page_nav')
    <li class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
@endsection

@section('contents')
  <x-backend.shared.page-container :show_card="true">
   
        <div class="d-flex justify-content-end" id="b10-coding-block-container">  
            
        </div>

        <form id="search-frm">
          <div class="row bg-light border py-4 m-0" id="filter-container">  
              @include('backend.finance.development_budget.b20.filter')
          </div>
        </form>

        
    <form action="#" method="get" id="create-form">
    <div class="row mb-2 d-none" id="create-box">
        <input type="hidden" name="budget_plan_id" id="budget_plan_id" value="{{ $budget_plan->id }}">
        <input type="hidden" name="budget_dev_b3_id" id="budget_dev_b3_id" value="0">
        <input type="hidden" name="edit_month" id="edit_month" value="0">
        <input type="hidden" name="edit_id" id="edit_id" value="0">
        <x-select 
          name="code_org_4" 
          id="code_org_4" label="{{ Settings::trans('Sub-Organization-Code(4)','فرعي اداره(۴)','اداره فرعی(۴)') }}"
          col="col-sm-2"
          required="1"
          :list="$code_org_4" 
          :is_livewire='0'
          value="sub_org_code"
          text="sub_org_code"
          default="{{ Settings::trans('Sub-Organization-Code(4)','فرعي اداره(۴)','اداره فرعی(۴)') }}" 
           /> 

        <x-select 
          name="code_project_6" 
          id="code_project_6" label="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}"
          col="col-sm-2"
          required="1"
          onchange="get_b10_code_block_amount()"
          :list="$code_project_6" 
          :is_livewire='0'
          value="code"
          text="code"
          default="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}" /> 

        <x-select 
          name="code_program_3" 
          id="code_program_3" label="{{ Settings::trans('Program Code(3)','د برنامی کوډ(۳)','کود برنامه(۳)') }}"
          col="col-sm-2"
          required="1"
          onchange="get_b10_code_block_amount()"
          :list="$code_program_3" 
          :is_livewire='0'
          value="program_code"
          text="program_code"
          default="{{ Settings::trans('Program Code(3)','د برنامی کوډ(۳)','کود برنامه(۳)') }}" /> 

        <x-select 
          name="code_fund_4" 
          id="code_fund_4" label="{{ Settings::trans('Fund Code(4)','د وجه کوډ(۴)','کود وجه(۴)') }}"
          col="col-sm-2"
          required="1"
          onchange="get_b10_code_block_amount()"
          :list="$code_fund_4" 
          :is_livewire='0'
          value="sub_fund_code"
          text="sub_fund_code"
          default="{{ Settings::trans('Fund Code(4)','د وجه کوډ(۴)','کود وجه(۴)') }}" /> 

        <x-select 
          name="code_loaction" 
          id="code_loaction" label="{{ Settings::trans('Province Code(2)','د ولایت کوډ(۲)','کود ولایت(۲)') }}"
          col="col-sm-2" 
          required="1"
          onchange="get_b10_code_block_amount()"
          :list="$code_location_2" 
          :is_livewire='0'
          value="prov_code"
          text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}"
          text="prov_code"
          default="{{ Settings::trans('Province Code(2)','د ولایت کوډ(۲)','کود ولایت(۲)') }}" /> 

        <x-select 
          name="code_cate_1" 
          id="code_cate_1" label="{{ Settings::trans('Category Code(1)','د کټګوری کوډ(۱)','کود کتګوری(۱)') }}"
          col="col-sm-2"
          required="1"
          :list="$code_category_1" 
          :is_livewire='0'
          value="code"
          text="code" 
          default="{{ Settings::trans('Category Code(1)','د کټګوری کوډ(۱)','کود کتګوری(۱)') }}" /> 

        <x-select 
          name="code_object_2" 
          id="code_object_2" label="{{ Settings::trans('Object Code(2)','د باب کوډ(۲)','کود باب(۲)') }}"
          default="{{ Settings::trans('Object Code(2)','د باب کوډ(۲)','کود باب(۲)') }}" 
          col="col-sm-2" 
          onchange="get_b10_code_block_amount()"
          required="1"
          :list="$code_objects_2" 
          :is_livewire='0'
          value="major_code" 
          text="major_code" />

        <x-select 
          name="month" 
          id="month" label="{{ Settings::trans('Month','میاشت','ماه') }}"
          default="{{ Settings::trans('Month','میاشت','ماه') }}" 
          col="col-sm-2" 
          required="1"
          :list="Settings::months()" 
          :is_livewire='0'
          value="value"
          text="{{Settings::trans('en_name','pa_name','da_name')}}" /> 

        <x-input 
            required="1"
            name="amount" 
            id="amount" label="{{ Settings::trans('Amount (AFN)','اندازه (افغانی)','مقدار (افغانی)') }}"
            placeholder="{{ Settings::trans('Amount (AFN)','اندازه (افغانی)','مقدار (افغانی)') }}"
            type="number" 
            col="col-sm-3" /> 

        <div class="col-sm-1 p-0">
          <label for="save-row" class="m-0">&nbsp;</label>
          <button class="btn btn-primary form-control" id="save-row" form="create-form" type="submit">
            {{ Settings::trans('Save','ثبت','ثبت') }} <i class="fa fa-save"></i>

            <div class="spinner-border text-secondary spinner-border-sm d-none loader" role="status">
               <span class="sr-only"></span>
            </div>

          </button>
        </div>

        <div class="col-sm-1 p-0 pl-1">
          <label for="close-btn" class="m-0">&nbsp;</label>
          <button class="btn btn-secondary form-control" id="close-btn" type="button">
            <i class="fa fa-times"></i>
          </button>
        </div>

      </form>
    </div>

    <div class="table-responsive">
        <table class="table table-sm table-bordered mb-0" id="main-tbl">
            <thead id="tbl-head">
                <th class="bg-light">{{ Settings::trans('Sub-Organization (4)','فرعي اداره (۴)','اداره فرعی (۴)') }}</th>
                <th class="bg-light">{{ Settings::trans('Project Code(6)','د پروژی کوډ (۶)','کود پروژه (۶)') }}</th>
                <th class="bg-light">{{ Settings::trans('Program Code(3)','برنامه (۳)','برنامه(۳)') }}</th>
                <th class="bg-light">{{ Settings::trans('Fund Code(4)','وجه(۴)','وجه(۴)') }}</th>
                <th class="bg-light">{{ Settings::trans('Province Code','ولایت','ولایت') }}</th>
                <th class="bg-light">{{ Settings::trans('Type(1)','نوع(۱)','نوع(۱)') }}</th>
                <th class="bg-light">{{ Settings::trans('Major(2)','باب(۲)','باب(۲)') }}</th>
                <th>{{ Settings::trans('Hamal-01','وری','حمل') }}</th>
                <th>{{ Settings::trans('Sawar-02','غویی','ثور') }}</th>
                <th>{{ Settings::trans('Jawza-02','غبرګولی','جوزا') }}</th>
                <th>{{ Settings::trans('Saratan-02','چینګاښ','سرطان') }}</th>
                <th>{{ Settings::trans('Asad-02','زمری','اسد') }}</th>
                <th>{{ Settings::trans('Sunbula-02','وږی','سنبله') }}</th>
                <th>{{ Settings::trans('Mezan-02','تله','میزان') }}</th>
                <th>{{ Settings::trans('Aqrab-02','لړم','عقرب') }}</th>
                <th>{{ Settings::trans('Qaous-02','لیندۍ','قوس') }}</th>
                <th>{{ Settings::trans('Jadi-02','مرغومی','جدی') }}</th>
                <th>{{ Settings::trans('Dalwa-02','سلواغه','دلوه') }}</th>
                <th>{{ Settings::trans('Hoot-02','کب','حوت') }}</th>
                <th class="bg-light">{{ Settings::trans('Total','مجموعه','مجموعه') }}</th>
                <th class="bg-light text-center">{{ Settings::trans('Action','کړنی','عملیات') }}</th>
            </thead>
              @include('backend.finance.development_budget.b20.table_body',[
                'b20'=>$b20  
              ])
        </table>
    </div>
  </x-backend.shared.page-container>
  @include('backend.finance.development_budget.b20.print_modal')

@endsection

@push('scripts')
  <script>
    $(document).ready(function () {

      $('#close-btn').click(function () {
        $('#create-box').addClass('d-none');
        $('#add-btn').removeClass('d-none');
        $('#b10-coding-block-container').html('');
        $('#budget_dev_b3_id').val('0');
        $('#search-frm').removeClass('d-none');
      });

      $('#add-btn').click(function () {

        $('#edit_id').val('0');
        $('#code_cate_1').val('').change();
        $('#code_cate_1').removeAttr('disabled');
        $('#code_fund_4').val('').change();
        $('#code_fund_4').removeAttr('disabled');
        $('#code_loaction').val('').change();
        $('#code_loaction').removeAttr('disabled');
        $('#code_object_2').val('').change();
        $('#code_object_2').removeAttr('disabled');
        $('#code_org_4').val('').change();
        $('#code_org_4').removeAttr('disabled');
        $('#code_program_3').val('').change();
        $('#code_program_3').removeAttr('disabled');
        $('#code_project_6').val('').change();
        $('#code_project_6').removeAttr('disabled');
        $('#month').val('').change();
        $('#edit_month').val('');
        $('#month').removeAttr('disabled');
        $('#amount').val('');
        $('#b10-coding-block-container').html('');
        $('#budget_dev_b3_id').val('0');
        $('#create-box').removeClass('d-none');
        $('#add-btn').addClass('d-none');
        $('#search-frm').addClass('d-none');
      });

      $('#create-form').submit(function(e){
        e.preventDefault();

        if(validate_field('amount') || validate_field('month') || validate_field('code_object_2') || validate_field('code_cate_1')
        || validate_field('code_loaction') || validate_field('code_fund_4') || validate_field('code_program_3') || validate_field('code_project_6')
        || validate_field('code_org_4')){
          toastr['error']('Validation Failed!');
          return;
        }

        loader('show');

         $.ajax({
            url:"{{ route('finance.budget.dev.plan.b20.store') }}",
            type:"get",
            data:$('#create-form').serialize(),
            success:function(res){
                console.log(res);
              if(res.result==403){
                toastr['error'](res.msg);
                loader('hide');
                return;
              }

              $('#tbl-body').remove();
              $('#tbl-foot').remove();
              $('#tbl-head').after(res.html);
              if($('#edit_id').val()=='0'){
                $('#month').val('').change();
                $('#edit_month').val('');
                $('#amount').val('');
              }

              toastr['success']('Record Added Successfully!');
              loader('hide');
            },
            error:function(err){
              console.log(err);
              loader('hide');
            }

        });

      });
      
    });

    $('#amount').on('input', function(e){
        var amount = parseFloat($('#amount').val());

        var spent = parseFloat($('#code-spent').text());
        var total_amount = parseFloat($('#code-amount').text());
        
        var total_spent = spent + amount;

        if(total_spent > total_amount){
          $('#amount').addClass('border border-danger');
          $('#amount').val('0');
          toastr['error']('Amount exceeds the total amount!');
          return;
        } 

        if(ifNaN(spent)==0 && ifNaN(total_amount)==0){
          $('#amount').addClass('border border-danger');
          $('#amount').val('');
          toastr['error']('Please Add Amount for the coding block in B10, then you can add here!');
          return;
        }
    });

    function delete_row(id){
      if(confirm('Are you sure you want to delete this record')){
        loader('show');
         $.ajax({
            url:"{{ route('finance.budget.plan.approved.distributions.delete') }}",
            type:"get",
            data:{'id':id,'budget_plan_id':$('#budget_plan_id').val()},
            success:function(res){
              if(res.result==200){
                $('#tbl-body').remove();
                $('#tbl-foot').remove();
                $('#tbl-head').after(res.html);
                toastr['success'](res.msg);

              }else if(res.result==403){
                toastr['error'](res.msg);
              }
              loader('hide');
            },
            error:function(err){
              console.log(err);
              loader('hide');
            }

        });
      }
    }

    function edit_row(id,month){
        loader('show');
         $.ajax({
            url:"{{ route('finance.budget.dev.plan.b20.edit') }}",
            type:"get",
            data:{'id':id,'month':month},
            success:function(res){
  
              $('#amount').val(res.amount);
              $('#search-frm').addClass('d-none');
              $('#edit_id').val(res.data.id);
              $('#month').val(res.month).change();
              $('#edit_month').val(res.month);
              $('#code_cate_1').val(res.data.code_cate_1).change();
              $('#code_fund_4').val(res.data.code_fund_4).change();
              $('#code_loaction').val(res.data.code_province_2).change();
              $('#code_object_2').val(res.data.code_object_2).change();
              $('#code_org_4').val(res.data.code_org_5).change();
              $('#code_program_3').val(res.data.code_program_3).change();
              $('#code_project_6').val(res.data.code_project_6).change();

              $('#month').attr('disabled',true);
              $('#code_cate_1').attr('disabled',true);
              $('#code_fund_4').attr('disabled',true);
              $('#code_loaction').attr('disabled',true);
              $('#code_object_2').attr('disabled',true);
              $('#code_org_4').attr('disabled',true);
              $('#code_program_3').attr('disabled',true);
              $('#code_project_6').attr('disabled',true);

              $('#b10-coding-block-container').html(res.b10_codeing_block_html);
              $('#budget_dev_b3_id').val(res.budget_dev_b3_id);

              $('#create-box').removeClass('d-none');
              $('#add-btn').addClass('d-none');
              loader('hide');
            },
            error:function(err){
              console.log(err);
              loader('hide');
            }
        });
    }

    function get_b10_code_block_amount(){
      if($('#edit_id').val()!='0'){
        return;
      }
        loader('show');
         $.ajax({
            url:"{{ route('finance.budget.dev.plan.b20.get_b3_code_amount') }}",
            type:"get",
            data:$('#create-form').serialize(),
            success:function(res){
              console.log(res);
              if(res.result==200){
                $('#budget_dev_b3_id').val(res.budget_dev_b3_id);
                $('#b10-coding-block-container').html(res.html);
              }else{
                $('#b10-coding-block-container').html('');
                $('#budget_dev_b3_id').val('0');
              }
              loader('hide');
            },
            error:function(err){
              console.log(err);
              loader('hide');
            }
        });
    }
  </script>
@endpush