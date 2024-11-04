       <input type="hidden" name="budget_plan_id" id="budget_plan_id" value="{{ $budget_plan->id }}">
       <x-select 
          name="f_code_project_6" 
          id="f_code_project_6" label="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}"
          col="col-sm-2"
          required="1"
          :list="$code_project_6" 
          :is_livewire='0'
          value="code"
          text="code"
          default="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}" /> 

        <x-select 
          name="f_code_program_3" 
          id="f_code_program_3" label="{{ Settings::trans('Program Code(3)','د برنامی کوډ(۳)','کود برنامه(۳)') }}"
          col="col-sm-2"
          required="1"
          :list="$code_program_3" 
          :is_livewire='0'
          value="program_code"
          text="program_code"
          default="{{ Settings::trans('Program Code(3)','د برنامی کوډ(۳)','کود برنامه(۳)') }}" /> 

        <x-select 
          name="f_code_fund_4" 
          id="f_code_fund_4" label="{{ Settings::trans('Fund Code(4)','د وجه کوډ(۴)','کود وجه(۴)') }}"
          col="col-sm-2"
          required="1"
          :list="$code_fund_4" 
          :is_livewire='0'
          value="sub_fund_code"
          text="sub_fund_code"
          default="{{ Settings::trans('Fund Code(4)','د وجه کوډ(۴)','کود وجه(۴)') }}" /> 

        <x-select 
          name="f_code_loaction" 
          id="f_code_loaction" label="{{ Settings::trans('Province Code(2)','د ولایت کوډ(۲)','کود ولایت(۲)') }}"
          col="col-sm-2" 
          required="1"
          :list="$code_location_2" 
          :is_livewire='0'
          value="prov_code"
          text2="{{Settings::trans('en_desc','pa_desc','da_desc')}}"
          text="prov_code"
          default="{{ Settings::trans('Province Code(2)','د ولایت کوډ(۲)','کود ولایت(۲)') }}" /> 

        <x-select 
          name="f_code_object_2" 
          id="f_code_object_2" label="{{ Settings::trans('Object Code(2)','د باب کوډ(۲)','کود باب(۲)') }}"
          default="{{ Settings::trans('Object Code(2)','د باب کوډ(۲)','کود باب(۲)') }}" 
          col="col-sm-2" 
          required="1"
          :list="$code_objects_2" 
          :is_livewire='0'
          value="major_code"
          text="major_code" /> 

          <div class="col-sm-2 pt-4">
            <div class="btn-group" role="group" aria-label="Search">
              <button class="btn btn-light border" id="search-btn" type="submit" title="Search">
                <i class="fa fa-search"></i>
              </button>
              {{--<a class="btn btn-danger" title="clear search"
               id="search-btn" href="{{ route('finance.budget.plan.approved.distributions.index',$budget_plan->id) }}">
                <i class="fa fa-times"></i> 
              </a>--}}
            </div>

            @hasDirectPermission('B20 (Regular) - Create')
            <button class="btn btn-primary @if($is_finalized) d-none @endif" id="add-btn" type="button" title="{{ Settings::trans('Add','اضافه کړئ','اضافه کنید') }}">
                <i class="fa fa-plus"></i>
            </button>
            @endhasDirectPermission

            <button
              type="button"
              class="btn btn-secondary" 
              id="print-btn" 
              data-toggle="modal" 
              data-target="#print-modal"
              title="{{ Settings::trans('Print','پرنټ فورم ب-۲۰','پرنت فورم ب-۲۰') }}">
              <i class="fa fa-print"></i>
            </button>

            @hasDirectPermission('B20 (Regular) - Lock')
              <button class="btn @if($is_finalized) btn-success @else btn-info @endif" id="finalize" type="button" title="{{ Settings::trans('Finalize','تکمیل کړئ','تکمیل کنید') }}">
                @if($is_finalized) <i class="fas fa-lock"></i> @else <i class="fas fa-lock-open"></i> @endif
              </button>
            @endhasDirectPermission

          </div>

        @push('scripts')
          <script>
            document.getElementById('search-frm').addEventListener('submit', function(event) {
              event.preventDefault();

              $.ajax({
                url: "{{ route('finance.budget.plan.approved.distributions.filter') }}",
                method: 'GET',
                data: $(this).serialize(),
                success: function(res) {
                  $('#tbl-body').remove();
                  $('#tbl-foot').remove();
                  $('#tbl-head').after(res.html);
                },
                error: function(error) {
                  console.log(error);
                }
              });

            });

            $('#finalize').click(function(){
              if(confirm('Are you sure, to finalize this form?')) {
                $.ajax({
                  url: "{{ route('finance.budget.plan.approved.distributions.finalize') }}",
                  method: 'POST',
                  data: {
                    _token: '{{ csrf_token() }}',
                    budget_plan_id: $('#budget_plan_id').val()
                  },
                  success: function(res) {

                    if(res.code==200){

                      $('#tbl-body').remove();
                      $('#tbl-foot').remove();
                      $('#tbl-head').after(res.html);
                      if(res.is_finalized){
                        $('#finalize').removeClass('btn-info');
                        $('#finalize').addClass('btn-success');
                        $('#finalize').html('<i class="fa fa-lock"></i>');
                        $('#add-btn').addClass('d-none');
                      }else{
                        $('#finalize').addClass('btn-info');
                        $('#finalize').removeClass('btn-success');
                        $('#finalize').html('<i class="fa fa-lock-open"></i>');
                        $('#add-btn').removeClass('d-none');
                      }
                    }

                    toastr[res.type](res.msg);
                  },
                  error: function(error) {
                    console.log(error);
                  }
                });
              }
            });
          </script>
        @endpush