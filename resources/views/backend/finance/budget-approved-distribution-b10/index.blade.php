@extends('backend.layout.base')


@section('page_title')
  {{ Settings::trans('Form-B10','د ب-۱۰ فورم','فورم ب-۱۰') }} {{ $budget_plan->year }}
@endsection

@section('page_nav')
    <li class="breadcrumb-item active"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
@endsection

@section('contents')
  <x-backend.shared.page-container :show_card="true">
   
        <div class="d-flex justify-content-around" id="major-codes-container">  
            @include('backend.finance.budget-approved-distribution-b10.calculate_major_codes')
        </div>
        <hr>
        <div class="p-0 pl-1 m-2">
          <button class="btn btn-primary" id="add-btn" type="button">
            <i class="fa fa-plus"></i>
            {{ Settings::trans('Add','اضافه کړئ','اضافه کنید') }}
          </button>
          <a class="btn btn-secondary" id="print-btn" data-target="#print-modal" data-toggle="modal"
          href="#">
            <i class="fa fa-print"></i>
            {{ Settings::trans('Print','پرنټ فورم ب-۱۰','پرنت فورم ب-۱۰') }}
          </a>
        </div>

        
    <form action="#" method="get" id="create-form">
    <div class="row mb-2 d-none" id="create-box">
        <input type="hidden" name="budget_plan_id" id="budget_plan_id" value="{{ $budget_plan->id }}">
        <input type="hidden" name="edit_id" id="edit_id" value="0">
        <x-select 
          name="code_org_3" 
          id="code_org_3" label="{{ Settings::trans('Organization-Code(3)','فرعي اداره(۳)','اداره فرعی(۳)') }}"
          col="col-sm-2"
          required="1"
          :list="$code_org_3" 
          :is_livewire='0'
          value="ministry_code"
          text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}"
          text="ministry_code"
          default="{{ Settings::trans('Organization-Code(3)','فرعي اداره(۳)','اداره فرعی(۳)') }}" 
           /> 

        <x-select 
          name="code_project_6" 
          id="code_project_6" label="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}"
          col="col-sm-2"
          required="1"
          :list="$code_project_6" 
          :is_livewire='0'
          value="code"
          text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}"
          text="code"
          default="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}" /> 

        <x-select 
          name="code_program_3" 
          id="code_program_3" label="{{ Settings::trans('Program Code(3)','د برنامی کوډ(۳)','کود برنامه(۳)') }}"
          col="col-sm-2"
          required="1"
          :list="$code_program_3" 
          :is_livewire='0'
          value="program_code"
          text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}"
          text="program_code"
          default="{{ Settings::trans('Program Code(3)','د برنامی کوډ(۳)','کود برنامه(۳)') }}" /> 

        <x-select 
          name="code_fund_4" 
          id="code_fund_4" label="{{ Settings::trans('Fund Code(4)','د وجه کوډ(۴)','کود وجه(۴)') }}"
          col="col-sm-2"
          required="1"
          :list="$code_fund_4" 
          :is_livewire='0'
          value="sub_fund_code"
          text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}"
          text="sub_fund_code"
          default="{{ Settings::trans('Fund Code(4)','د وجه کوډ(۴)','کود وجه(۴)') }}" /> 

        <x-select 
          name="code_loaction" 
          id="code_loaction" label="{{ Settings::trans('Province Code(2)','د ولایت کوډ(۲)','کود ولایت(۲)') }}"
          col="col-sm-2" 
          required="1"
          :list="$code_location_2" 
          :is_livewire='0'
          value="prov_code"
          text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}"
          text="prov_code"
          default="{{ Settings::trans('Province Code(2)','د ولایت کوډ(۲)','کود ولایت(۲)') }}" /> 

        <x-select 
          name="code_object_2" 
          id="code_object_2" label="{{ Settings::trans('Object Code(2)','د باب کوډ(۲)','کود باب(۲)') }}"
          default="{{ Settings::trans('Object Code(2)','د باب کوډ(۲)','کود باب(۲)') }}" 
          col="col-sm-2" 
          required="1"
          :list="$code_objects_2" 
          :is_livewire='0'
          value="major_code"
          text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}"
          text="major_code" />

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
        <table class="table table-sm table-bordered" id="main-tbl">
            <thead id="tbl-head">
                <th class="bg-light">{{ Settings::trans('Organization (3)','اداره (۳)','اداره (۳)') }}</th>
                <th class="bg-light">{{ Settings::trans('Project Code(6)','د پروژی کوډ (۶)','کود پروژه (۶)') }}</th>
                <th class="bg-light">{{ Settings::trans('Program Code(3)','برنامه (۳)','برنامه(۳)') }}</th>
                <th class="bg-light">{{ Settings::trans('Fund Code(4)','وجه(۴)','وجه(۴)') }}</th>
                <th class="bg-light">{{ Settings::trans('Province Code','د ولایت کوډ','کود ولایت') }}</th>
                <th class="bg-light">{{ Settings::trans('Province Code','ولایت','ولایت') }}</th>
                
                @foreach($code_objects_2 as $major)
                  <th>{{ $major->major_code }}</th>
                @endforeach

                <th class="bg-light">{{ Settings::trans('Total','مجموعه','مجموعه') }}</th>
                <th class="bg-light text-center">{{ Settings::trans('Action','کړنی','عملیات') }}</th>
            </thead>
              @include('backend.finance.budget-approved-distribution-b10.table_body',[
                'b10'=>$b10  
              ])
        </table>
    </div>
  </x-backend.shared.page-container>
    
  @include('backend.finance.budget-approved-distribution-b10.print_modal')
@endsection

@push('scripts')
  <script>
    $(document).ready(function () {

      $('#close-btn').click(function () {
        $('#create-box').addClass('d-none');
        $('#add-btn').removeClass('d-none');
      });

      $('#add-btn').click(function () {

        $('#edit_id').val('0');
        $('#code_fund_4').val('').change();
        $('#code_fund_4').removeAttr('disabled');
        $('#code_loaction').val('').change();
        $('#code_loaction').removeAttr('disabled');
        $('#code_object_2').val('').change();
        $('#code_object_2').removeAttr('disabled');
        $('#code_org_3').val('').change();
        $('#code_org_3').removeAttr('disabled');
        $('#code_program_3').val('').change();
        $('#code_program_3').removeAttr('disabled');
        $('#code_project_6').val('').change();
        $('#code_project_6').removeAttr('disabled');
        $('#amount').val('');

        $('#create-box').removeClass('d-none');
        $('#add-btn').addClass('d-none');
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
            url:"{{ route('finance.budget.plan.approved.distributions.b10.store') }}",
            type:"get",
            data:$('#create-form').serialize(),
            success:function(res){
                
              if(res.result==403){
                toastr['error'](res.msg);
                loader('hide');
                return;
              }

              $('#tbl-body').remove();
              $('#tbl-foot').remove();
              $('#tbl-head').after(res.html);
              $('#major-codes-container').html(res.html_major_codes);
              $('#month').val('').change();
              $('#amount').val('');

              if($('#edit_id').val()!='0'){
                $('#create-box').addClass('d-none');
                $('#add-btn').removeClass('d-none');
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

    $('#amount').on('input', function(e){

        var code = $('#code_object_2').val();
        var amount = parseFloat($('#amount').val());

        var spent = parseFloat($('#code-'+code+'-spent').text());
        var total_amount = parseFloat($('#code-'+code+'-amount').text());
        
        var total_spent = spent + amount;

        if(total_spent > total_amount){
          $('#amount').addClass('border border-danger');
          $('#amount').val('0');
          toastr['error']('Amount exceeds the total amount!');
        } 

    });

    function delete_row(id){
      if(confirm('Are you sure you want to delete this record')){
        loader('show');
         $.ajax({
            url:"{{ route('finance.budget.plan.approved.distributions.b10.delete') }}",
            type:"get",
            data:{'id':id,'budget_plan_id':$('#budget_plan_id').val()},
            success:function(res){
              if(res.result==200){
                $('#tbl-body').remove();
                $('#tbl-foot').remove();
                $('#tbl-head').after(res.html);
                $('#major-codes-container').html(res.html_major_codes);
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

    function edit_row(id,major_code_2){
        loader('show');
         $.ajax({
            url:"{{ route('finance.budget.plan.approved.distributions.b10.edit') }}",
            type:"get",
            data:{'id':id,'major_code':major_code_2},
            success:function(res){

              $('#amount').val(res.data.amount);
              $('#edit_id').val(res.data.id);
              $('#code_fund_4').val(res.data.code_fund_4).change();
              $('#code_fund_4').attr('disabled',true);
              $('#code_loaction').val(res.data.code_loaction).change();
              $('#code_loaction').attr('disabled',true);
              $('#code_org_3').val(res.data.code_org_3).change();
              $('#code_org_3').attr('disabled',true);
              $('#code_program_3').val(res.data.code_program_3).change();
              $('#code_program_3').attr('disabled',true);
              $('#code_project_6').val(res.data.code_project_6).change();
              $('#code_project_6').attr('disabled',true);
              $('#code_object_2').val(res.data.code_object_2).change();
              $('#code_object_2').attr('disabled',true);

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

  </script>
@endpush