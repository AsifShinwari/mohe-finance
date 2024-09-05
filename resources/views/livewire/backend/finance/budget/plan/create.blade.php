<div>
     <x-backend.shared.page-nav>
          <x-slot:title>
               {{ Settings::trans('Add Budget Plan','نوی پلان اضافه کړئ','پلان اضافه کنید') }}
          </x-slot:title>
          <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">{{ __('leftbar.home') }}</a></li>
          <li class="breadcrumb-item"><a wire:navigate href="{{ route('finance.budget.plan.index') }}">{{ __('leftbar.budget_plan') }}</a></li>
          <li class="breadcrumb-item active">{{ Settings::trans('Add Budget Plan','نوی پلان اضافه کړئ','پلان اضافه کنید') }}</li>
     </x-backend.shared.page-nav>
     <x-backend.shared.page-container>
          
               <div class="row m-0 p-0">
                    <x-input 
                         name="year" 
                         id="year" label="{{ Settings::trans('Year','کال','سال') }}"
                         placeholder="{{ Settings::trans('Year','کال','سال') }}"
                         type="text" 
                         readonly
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
