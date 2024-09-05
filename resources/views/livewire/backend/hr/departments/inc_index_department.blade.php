@if($departments)
    @foreach($departments as $department)
    
    @php
      $sub_departments = $this->sub_departments($department->id);
    @endphp

    <div class="accordion" id="accordion{{ $department->id }}">
        <div class="car-d border-left border-info">
            <div class="car-d-header" id="heading{{ $department->id }}">
                <h2 class="mb-0">
                    <div class="d-flex justify-content-start">

                            <button class="btn btn-link text-left text-secondary" type="button" 
                            data-toggle="collapse" data-target="#collapse{{ $department->id }}" 
                            aria-expanded="false" aria-controls="collapse{{ $department->id }}">
                                    <h4>
                                    @if(count($sub_departments) > 0)<span class="caret-icon">+</span>@endif
                                    {{ Settings::trans($department->name,$department->pa_name,$department->da_name) }}
                                    </h4> 
                            </button>

                        <div>
                            @hasDirectPermission('HR Department - Can Add')
                                <a href="{{ route('admin.hr.dep.create',$department->id) }}" class="btn btn-link btn-sm"><i class="fa fa-plus"></i></a>
                            @endhasDirectPermission
                            
                            @hasDirectPermission('HR Department - Can Add')
                                <a href="{{ route('admin.hr.dep.update',$department->id) }}" class="btn btn-link btn-sm"><i class="fa fa-edit"></i></a>
                            @endhasDirectPermission
                        </div>
                        <div>
                            @hasDirectPermission('HR Department - Can Delete')
                            <a class="btn btn-link text-danger btn-sm"
                                wire:confirm="Are You Sure! , To Delete This Record?"
                                wire:click="delete({{ $department->id }})">
                                <i class="fa fa-trash"></i>
                            </a>
                            @endhasDirectPermission
                        </div>
                    </div>
                </h2>
            </div>

            <div id="collapse{{ $department->id }}" class="collapse" aria-labelledby="heading{{ $department->id }}" data-parent="#accordion{{ $department->id }}">
                <div class="car-d-body pl-4 p-0">
                    @include('livewire.backend.hr.departments.inc_index_department', ['departments' => $sub_departments])
                </div>
            </div>
        </div>
    </div>
    @endforeach
@endif

<script>
    document.addEventListener('DOMContentLoaded', function () {
        let collapsibleElements = document.querySelectorAll('[data-toggle="collapse"]');
        
        collapsibleElements.forEach(function (element) {
            element.addEventListener('click', function () {
                let icon = this.querySelector('.caret-icon');
                if (icon) {
                    icon.textContent = (this.getAttribute('aria-expanded') === 'true') ? '+' : '-';
                }
            });
        });
    });
</script>
