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
            <button class="btn btn-info" id="search-btn" type="submit">
              <i class="fa fa-search"></i>
            </button>
            
            {{--<a class="btn btn-danger" id="search-btn" href="{{ route('finance.budget.dev.plan.b20.index',$budget_plan->id) }}">
              <i class="fa fa-times"></i> 
            </a>--}}
            
            @hasDirectPermission('B20 (Development) - Create')
              @if(!$is_finalized)
                <button class="btn btn-primary" id="add-btn" type="button" title="{{ Settings::trans('Add','اضافه کړئ','اضافه کنید') }}">
                  <i class="fa fa-plus"></i>
                </button>
              @endif
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

            @hasDirectPermission('B20 (Development) - Lock')
            <a class="btn @if($is_finalized) btn-success @else btn-info @endif" id="finalize" href="{{ route('finance.budget.dev.plan.b20.finalized',$budget_plan->id) }}" title="{{ Settings::trans('Finalize','تکمیل کړئ','تکمیل کنید') }}">
              @if($is_finalized) <i class="fas fa-lock"></i> @else <i class="fas fa-lock-open"></i> @endif
            </a>
            @endhasDirectPermission

          </div>

        @push('scripts')
          <script>
            document.getElementById('search-frm').addEventListener('submit', function(event) {
              event.preventDefault();

              $.ajax({
                url: "{{ route('finance.budget.dev.plan.b20.filter') }}",
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
          </script>
        @endpush