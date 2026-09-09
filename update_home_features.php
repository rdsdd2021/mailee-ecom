<?php

use Modules\Setting\Entities\Setting;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

echo "Updating Home Features section in settings...\n";

DB::beginTransaction();

try {
    Setting::setMany([
        'storefront_features_section_enabled' => 1,

        'storefront_feature_1_icon' => 'las la-snowflake',
        'storefront_feature_1_title' => 'Freshly Frozen (-18°C)',
        'storefront_feature_1_subtitle' => 'Sealed in flavor & authenticity',

        'storefront_feature_2_icon' => 'las la-id-card',
        'storefront_feature_2_title' => '₹10 VIP Member Pass',
        'storefront_feature_2_subtitle' => 'Extreme wholesale prices for members',

        'storefront_feature_3_icon' => 'las la-shipping-fast',
        'storefront_feature_3_title' => 'Express North Bengal Delivery',
        'storefront_feature_3_subtitle' => 'Siliguri, Darjeeling, Jalpaiguri & Cooch Behar',

        'storefront_feature_4_icon' => 'las la-award',
        'storefront_feature_4_title' => '100% Quality Guaranteed',
        'storefront_feature_4_subtitle' => 'Authentic Himalayan & Nepali recipe',

        'storefront_feature_5_icon' => 'las la-leaf',
        'storefront_feature_5_title' => 'Zero Preservatives Added',
        'storefront_feature_5_subtitle' => '100% Natural & Hygienically Packed',

        'storefront_feature_6_icon' => 'las la-stopwatch',
        'storefront_feature_6_title' => 'Instant 10-Min Cooking',
        'storefront_feature_6_subtitle' => 'Steam, fry or air-fry straight from freezer',
    ]);

    Cache::tags(['settings'])->flush();
    Cache::flush();

    DB::commit();

    echo "SUCCESS: 6 Home Features updated in settings!\n";

} catch (\Throwable $e) {
    DB::rollBack();
    echo "ERROR: " . $e->getMessage() . "\n";
}
