<div>
     <x-backend.shared.page-nav>
          <x-slot:title>
               {{ Settings::trans('Update Budget Plan','پلان تصحیح کړئ','تصحیح پلان') }}
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item"><a wire:navigate href="{{ route('finance.budget.plan.index') }}">{{ __('leftbar.budget_plan') }}</a></li>
          <li class="breadcrumb-item active">{{ Settings::trans('Update Budget Plan','پلان تصحیح کړئ','تصحیح پلان') }}</li>
     </x-backend.shared.page-nav>
     <x-backend.shared.page-container>
          
               <div class="row m-0 p-4">
                    
                    <x-input 
                         name="year" 
                         id="year" label="{{ Settings::trans('Year','کال','سال') }}"
                         placeholder="{{ Settings::trans('Year','کال','سال') }}"
                         readonly
                         value="{{ Settings::change_to_hijri($year) }}"
                         type="text" 
                         col="col-sm-4" /> 


                    <div class="card-footer col-sm-12">
                         <button class="btn btn-primary" wire:loading.attr="disabled" wire:click="store()">
                              <i class="fa fa-save"></i> 
                              {{ Settings::trans('Save','ثبت','ثبت') }}
                         </button>
                         
                         <x-loader wire:loading />

                    </div>
               </div>
     </x-backend.shared.page-container>
          @section('script')
            <script>
                $("#year").persianDatepicker({ 
                    showGregorianDate: false,
                    months: ["حمل", "ثور", "جوزا", "سرطان", "اسد", "سنبله", "میزان", "عقرب", "قوس","جدی","دلوه","حوت"],
                    formatDate: "YYYY-MM-DD",
                    onSelect: function () {
                        @this.set('year',$("#year").attr("data-jdate"));
                    }
                });
            </script>
          @endsection
</div>
