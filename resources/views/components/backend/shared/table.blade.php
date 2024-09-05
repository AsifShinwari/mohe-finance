<div>
    <div class="container-fluid d-flex justify-content-between py-3">
        {{ $tools }}
    </div>
    <div class="table-responsive" style="min-height: 50vh;">
        <table class="table table-sm table-hover">
            {{ $slot }}

            {{ $links }}
        </table>
    </div>
</div>