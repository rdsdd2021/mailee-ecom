<?php

use Modules\Setting\Entities\Setting;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

echo "Configuring Grid Products & Product Tabs Two sections...\n";

DB::beginTransaction();

try {
    Setting::setMany([
        // Product Grid Section
        'storefront_product_grid_section_enabled' => 1,
        'storefront_product_grid_section_tab_1_title' => 'North Bengal Bestsellers',
        'storefront_product_grid_section_tab_1_product_type' => 'latest_products',
        'storefront_product_grid_section_tab_1_products_limit' => 10,

        // Product Tabs Two Section
        'storefront_product_tabs_2_section_enabled' => 1,
        'storefront_product_tabs_2_section_title' => 'Special Recommendations',
        'storefront_product_tabs_2_section_tab_1_title' => 'Fresh Himalayan Arrivals',
        'storefront_product_tabs_2_section_tab_1_product_type' => 'custom_products',
        'storefront_product_tabs_2_section_tab_1_products' => [8, 9, 10, 11, 12, 13, 14],
    ]);

    Cache::tags(['settings'])->flush();
    Cache::flush();

    DB::commit();

    echo "SUCCESS: Grid products and product tabs two configured!\n";

} catch (\Throwable $e) {
    DB::rollBack();
    echo "ERROR: " . $e->getMessage() . "\n";
}
