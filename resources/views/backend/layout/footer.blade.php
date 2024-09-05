<!-- Main Footer -->
<footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
       {{ Settings::trans('MOHE','د لوړو زده کړو وزارت','وزارت تحصیلات عالی') }}
    </div>
    <!-- Default to the left -->
   @if(app()->getLocale()=='en')
      <strong>Copyright &copy; 2024 <a href="https://asifshinwari.com/">MOHE</a>.</strong> All rights reserved.
   @elseif(app()->getLocale()=='pa')
   <strong>د کاپي حق خوندي دی</strong>
   
   @elseif(app()->getLocale()=='da')
   <strong>حق کاپی محفوظ است</strong>
   
   @endif
  </footer>