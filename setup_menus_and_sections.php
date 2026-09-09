<?php

use Modules\Category\Entities\Category;
use Modules\Menu\Entities\Menu;
use Modules\Menu\Entities\MenuItem;
use Modules\Setting\Entities\Setting;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

echo "Setting up Menus, Category Dropdowns & Fixing Hero Slider Captions...\n";

DB::beginTransaction();

try {
    // 1. Clear overlapping caption texts from slider slides so AI banner graphics show cleanly
    DB::table('slider_slide_translations')->update([
        'caption_1' => null,
        'caption_2' => null,
        'call_to_action_text' => null,
    ]);

    echo "1. Cleared overlapping text from slider slides.\n";

    // 2. Fetch categories
    $categories = Category::all();
    $catMap = [];
    foreach ($categories as $cat) {
        $catMap[$cat->slug] = $cat->id;
    }

    // 3. Create Category Menu
    $catMenu = Menu::create(['is_active' => 1, 'name' => 'Category Menu']);

    // Create Root MenuItem for Category Menu
    $rootCatMenuItem = MenuItem::create([
        'menu_id' => $catMenu->id,
        'type' => 'url',
        'url' => '#',
        'target' => '_self',
        'is_root' => 1,
        'is_fluid' => 0,
        'is_active' => 1,
        'position' => 0,
        'name' => 'Root',
    ]);

    $position = 1;
    foreach ($categories as $cat) {
        MenuItem::create([
            'menu_id' => $catMenu->id,
            'category_id' => $cat->id,
            'parent_id' => $rootCatMenuItem->id,
            'type' => 'category',
            'url' => null,
            'target' => '_self',
            'is_root' => 0,
            'is_fluid' => 0,
            'is_active' => 1,
            'position' => $position++,
            'name' => $cat->name,
        ]);
    }

    echo "2. Created Category Menu (ID: {$catMenu->id}) with " . count($categories) . " categories.\n";

    // 4. Create Primary Navbar Menu
    $primMenu = Menu::create(['is_active' => 1, 'name' => 'Primary Menu']);

    $rootPrimMenuItem = MenuItem::create([
        'menu_id' => $primMenu->id,
        'type' => 'url',
        'url' => '#',
        'target' => '_self',
        'is_root' => 1,
        'is_fluid' => 0,
        'is_active' => 1,
        'position' => 0,
        'name' => 'Root',
    ]);

    $primaryLinks = [
        ['name' => 'Home', 'type' => 'url', 'url' => '/'],
        ['name' => 'Mailee ₹10 VIP Pass', 'type' => 'url', 'url' => '/products/mailee-rs10-vip-club-membership-pass'],
        ['name' => 'Himalayan Momos', 'type' => 'category', 'category_id' => $catMap['authentic-himalayan-momos'] ?? null],
        ['name' => 'Parathas & Breads', 'type' => 'category', 'category_id' => $catMap['frozen-parathas-breads'] ?? null],
        ['name' => 'Fries & Finger Foods', 'type' => 'category', 'category_id' => $catMap['crispy-fries-finger-foods'] ?? null],
    ];

    $pos = 1;
    foreach ($primaryLinks as $link) {
        MenuItem::create([
            'menu_id' => $primMenu->id,
            'category_id' => $link['category_id'] ?? null,
            'parent_id' => $rootPrimMenuItem->id,
            'type' => $link['type'],
            'url' => $link['url'] ?? null,
            'target' => '_self',
            'is_root' => 0,
            'is_fluid' => 0,
            'is_active' => 1,
            'position' => $pos++,
            'name' => $link['name'],
        ]);
    }

    echo "3. Created Primary Navbar Menu (ID: {$primMenu->id}).\n";

    // 5. Update Storefront Settings
    $settingsToUpdate = [
        'storefront_primary_menu' => $primMenu->id,
        'storefront_category_menu' => $catMenu->id,

        'storefront_featured_categories_section_enabled' => 1,
        'storefront_featured_categories_section_title' => 'Explore Frozen Food Categories',

        'storefront_product_tabs_1_section_enabled' => 1,
        'storefront_product_tabs_1_section_tab_1_product_type' => 'custom_products',
        'storefront_product_tabs_1_section_tab_1_products' => [8, 9, 10, 11, 12, 13, 14],

        'storefront_product_grid_section_enabled' => 1,
        'storefront_product_grid_section_tab_1_product_type' => 'latest_products',
    ];

    $i = 1;
    foreach ($categories as $cat) {
        $settingsToUpdate["storefront_featured_categories_section_category_{$i}_product_type"] = 'category_products';
        $settingsToUpdate["storefront_featured_categories_section_category_{$i}_category_id"] = $cat->id;
        $i++;
    }

    Setting::setMany($settingsToUpdate);

    Cache::tags('settings')->flush();
    Cache::flush();

    DB::commit();

    echo "SUCCESS: Navigation menus created, slider overlay text cleaned, and storefront sections configured!\n";

} catch (\Throwable $e) {
    DB::rollBack();
    echo "ERROR: " . $e->getMessage() . "\n" . $e->getTraceAsString() . "\n";
}
