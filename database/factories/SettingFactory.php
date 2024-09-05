<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Setting>
 */
class SettingFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'en_app_name' => 'Ministry of Higher Education',
            'pa_app_name' => 'د لوړو ذده کــړو وزارت',
            'da_app_name' => 'وزارت تـــحصــیلات عالی',
            'abbr' => 'MOHE',
            'larg_logo' => 'uploads/logo/larg_logo/rise-geo-logo.png',
            'medium_logo' => 'uploads/logo/larg_logo/rise-geo-logo.png',
            'small_logo' => 'uploads/logo/larg_logo/rise-geo-logo.png',
            'favicon' => 'uploads/logo/larg_logo/rise-geo-logo.png',
        ];
    }
}
