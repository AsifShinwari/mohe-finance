       <input type="hidden" name="budget_plan_id" id="budget_plan_id" value="{{ $budget_plan->id }}">
       <x-select 
          name="code_project_6" 
          id="code_project_6" label="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}"
          col="col-sm-2"
          required="1"
          :list="$code_project_6" 
          :is_livewire='0'
          :selected_value="isset($_GET['code_project_6']) ? $_GET['code_project_6'] : ''"
          value="code"
          text="code"
          default="{{ Settings::trans('Project Code(6)','د پروژی کوډ(۶)','کود پروژه(۶)') }}" /> 

        <x-select 
          name="code_program_3" 
          id="code_program_3" label="{{ Settings::trans('Program Code(3)','د برنامی کوډ(۳)','کود برنامه(۳)') }}"
          col="col-sm-2"
          required="1"
          :list="$code_program_3" 
          :is_livewire='0'
          :selected_value="isset($_GET['code_program_3']) ? $_GET['code_program_3'] : ''"
          value="program_code"
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
          text="sub_fund_code"
          :selected_value="isset($_GET['code_fund_4']) ? $_GET['code_fund_4'] : ''"
          default="{{ Settings::trans('Fund Code(4)','د وجه کوډ(۴)','کود وجه(۴)') }}" /> 

        <x-select 
          name="code_loaction" 
          id="code_loaction" label="{{ Settings::trans('Province Code(2)','د ولایت کوډ(۲)','کود ولایت(۲)') }}"
          col="col-sm-2" 
          required="1"
          :list="$code_location_2" 
          :is_livewire='0'
          :selected_value="isset($_GET['code_loaction']) ? $_GET['code_loaction'] : ''"
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
          :selected_value="isset($_GET['code_object_2']) ? $_GET['code_object_2'] : ''"
          value="major_code"
          text="major_code" />

          <div class="col-sm-2 pt-4">
            <button class="btn btn-info form-" id="search-btn" type="submit">
              <i class="fa fa-search"></i>
            </button>

            @hasDirectPermission('B3 (Development) - Create')
              @if(!$is_finalized)
                <a class="btn btn-primary" title="{{ Settings::trans('Add','اضافه کول','اضافه کردن') }}"
                href="{{ route('finance.budget.dev.plan.b3.create',$budget_plan->id) }}">
                  <i class="fa fa-plus"></i>
                </a>
              @endif
            @endhasDirectPermission
            
            <button class="btn btn-secondary" formtarget="_blank" id="print-btn">
              <i class="fa fa-print"></i>
            </button>

            {{--<a class="btn btn-danger" href="{{ route('finance.budget.dev.plan.b3.index',$budget_plan->id) }}">
              <i class="fa fa-times"></i>
            </a>--}}
            
            @hasDirectPermission('B3 (Development) - Lock')
              <a class="btn @if($is_finalized) btn-success @else btn-info @endif" id="finalize" href="{{ route('finance.budget.dev.plan.b3.finalized',$budget_plan->id) }}" title="{{ Settings::trans('Finalize','تکمیل کړئ','تکمیل کنید') }}">
                @if($is_finalized) <i class="fas fa-lock"></i> @else <i class="fas fa-lock-open"></i> @endif
              </a>
            @endhasDirectPermission
          </div>

          @push('scripts')
            <script>
              $('#print-btn').on('click', function(e) {
                var form = $(this).closest('form');
                form.attr('action', "{{ route('finance.budget.dev.plan.b3.print',$budget_plan->id) }}?"+ form.serialize());
                form.submit();
              });

              $('#search-btn').on('click', function(e) {
                var form = $(this).closest('form');
                form.attr('action', "{{ route('finance.budget.dev.plan.b3.index',$budget_plan->id) }}?"+ form.serialize());
                form.submit();
              });
            </script>
          @endpush