<?php

use Modules\Category\Entities\Category;
use Modules\Media\Entities\File;
use Modules\Product\Entities\Product;
use Modules\Setting\Entities\Setting;
use Modules\Slider\Entities\Slider;
use Modules\Slider\Entities\SliderSlide;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

echo "Starting Mailee Frozen Foods demo data seeding...\n";

DB::beginTransaction();

try {
    // 1. Store settings setup
    Setting::setMany([
        'translatable' => [
            'store_name' => 'Mailee Frozen Foods',
            'store_tagline' => 'Authentic Himalayan & Nepali Frozen Foods in North Bengal',
            'storefront_copyright_text' => 'Copyright © Mailee Frozen Foods {{ year }}. All rights reserved.',
            'storefront_welcome_text' => 'Welcome to Mailee! Join our ₹10 VIP Club for Extreme Discounts across North Bengal!',
            'storefront_product_tabs_1_section_tab_1_title' => 'VIP Member Deals (Up to 70% OFF)',
            'storefront_product_tabs_1_section_tab_2_title' => 'Authentic Himalayan Momos',
            'storefront_product_grid_section_title' => 'North Bengal’s Favorite Frozen Foods',
        ],
        'supported_countries' => ['IN', 'BD'],
        'default_country' => 'IN',
        'supported_locales' => ['en'],
        'default_locale' => 'en',
        'supported_currencies' => ['INR'],
        'default_currency' => 'INR',
        'store_email' => 'contact@mailee.in',
        'store_phone' => '+91 98320 12345',
        'storefront_theme_color' => '#1b4d3e', // Deep emerald dark green
    ]);

    echo "1. Updated store settings.\n";

    // 2. Register media files
    $filesMap = [];
    $mediaFiles = [
        'hero_banner' => 'media/hero_banner.png',
        'momos' => 'media/momos.png',
        'fries' => 'media/fries.png',
        'paratha' => 'media/paratha.png',
        'spring_rolls' => 'media/spring_rolls.png',
        'membership' => 'media/membership.png',
    ];

    foreach ($mediaFiles as $key => $relPath) {
        $fullPath = storage_path('app/public/' . $relPath);
        $size = file_exists($fullPath) ? filesize($fullPath) : 800000;

        $file = File::create([
            'user_id' => 1,
            'filename' => basename($relPath),
            'disk' => 'public_storage',
            'path' => $relPath,
            'extension' => 'png',
            'mime' => 'image/png',
            'size' => (string)$size,
        ]);

        $filesMap[$key] = $file->id;
    }

    echo "2. Registered " . count($filesMap) . " media files.\n";

    // 3. Create Categories
    $categoriesData = [
        [
            'name' => 'Authentic Himalayan Momos',
            'slug' => 'authentic-himalayan-momos',
            'is_searchable' => 1,
            'is_active' => 1,
        ],
        [
            'name' => 'Frozen Parathas & Breads',
            'slug' => 'frozen-parathas-breads',
            'is_searchable' => 1,
            'is_active' => 1,
        ],
        [
            'name' => 'Crispy Fries & Finger Foods',
            'slug' => 'crispy-fries-finger-foods',
            'is_searchable' => 1,
            'is_active' => 1,
        ],
        [
            'name' => 'Himalayan Snacks & Starters',
            'slug' => 'himalayan-snacks-starters',
            'is_searchable' => 1,
            'is_active' => 1,
        ],
        [
            'name' => 'Mailee ₹10 VIP Membership',
            'slug' => 'mailee-vip-membership',
            'is_searchable' => 1,
            'is_active' => 1,
        ],
    ];

    $categoryIds = [];
    foreach ($categoriesData as $catData) {
        $cat = Category::create([
            'slug' => $catData['slug'],
            'is_searchable' => $catData['is_searchable'],
            'is_active' => $catData['is_active'],
            'name' => $catData['name'],
        ]);
        $categoryIds[$catData['name']] = $cat->id;
    }

    echo "3. Created " . count($categoryIds) . " categories.\n";

    // 4. Create Products
    $productsData = [
        [
            'name' => 'Mailee ₹10 VIP Club Membership Pass',
            'slug' => 'mailee-10-vip-club-membership-pass',
            'description' => 'Join the official Mailee ₹10 VIP Club! Pay just ₹10 once and unlock extreme wholesale discount prices (up to 70% OFF) on all authentic Himalayan frozen momos, parathas, fries, and finger foods delivered across North Bengal (Siliguri, Darjeeling, Jalpaiguri, Cooch Behar).',
            'short_description' => 'Pay ₹10 & Unlock Extreme Wholesale Discounts on All Frozen Foods!',
            'sku' => 'MAILEE-VIP-10',
            'price' => 10.00,
            'special_price' => null,
            'in_stock' => 1,
            'qty' => 10000,
            'is_active' => 1,
            'image_key' => 'membership',
            'categories' => [$categoryIds['Mailee ₹10 VIP Membership']],
        ],
        [
            'name' => 'Authentic Himalayan Steamed Chicken Momos (24 Pcs)',
            'slug' => 'authentic-himalayan-steamed-chicken-momos-24-pcs',
            'description' => 'Hand-crafted authentic Himalayan steamed chicken momos stuffed with juicy minced chicken, mountain coriander, scallions, and traditional Nepali spices. Served with signature spicy Darjeeling red chili chutney and creamy garlic mayo dip.',
            'short_description' => 'Authentic Nepali & Darjeeling Steamed Chicken Momos with Chili Chutney.',
            'sku' => 'MOMO-CHK-24',
            'price' => 299.00,
            'special_price' => 119.00, // Member Extreme Discount!
            'in_stock' => 1,
            'qty' => 500,
            'is_active' => 1,
            'image_key' => 'momos',
            'categories' => [$categoryIds['Authentic Himalayan Momos'], $categoryIds['Himalayan Snacks & Starters']],
        ],
        [
            'name' => 'Authentic Darjeeling Veg & Cheese Momos (24 Pcs)',
            'slug' => 'authentic-darjeeling-veg-cheese-momos-24-pcs',
            'description' => 'Traditional Darjeeling style vegetable & melted cheese momos filled with finely shredded fresh cabbage, carrots, bell peppers, processed cheese, and aromatic Himalayan herbs. Steam or pan-fry in 5 minutes.',
            'short_description' => 'Melted cheese & fresh veg momos from Darjeeling hills.',
            'sku' => 'MOMO-VEG-24',
            'price' => 249.00,
            'special_price' => 99.00, // Member Extreme Discount!
            'in_stock' => 1,
            'qty' => 500,
            'is_active' => 1,
            'image_key' => 'momos',
            'categories' => [$categoryIds['Authentic Himalayan Momos'], $categoryIds['Himalayan Snacks & Starters']],
        ],
        [
            'name' => 'Nepali Fiery Schezwan Fried Momos (20 Pcs)',
            'slug' => 'nepali-fiery-schezwan-fried-momos-20-pcs',
            'description' => 'Crispy fried authentic Nepali dumplings tossed in a fiery hot Schezwan chili garlic sauce. Frozen fresh, ready to deep-fry or air-fry in 4 minutes.',
            'short_description' => 'Crispy fried momos with spicy Schezwan glaze.',
            'sku' => 'MOMO-SCH-20',
            'price' => 279.00,
            'special_price' => 109.00, // Member Extreme Discount!
            'in_stock' => 1,
            'qty' => 400,
            'is_active' => 1,
            'image_key' => 'momos',
            'categories' => [$categoryIds['Authentic Himalayan Momos'], $categoryIds['Himalayan Snacks & Starters']],
        ],
        [
            'name' => 'Crispy Peri Peri French Fries (1 Kg Jumbo Pack)',
            'slug' => 'crispy-peri-peri-french-fries-1-kg-jumbo-pack',
            'description' => 'Golden extra crunchy frozen french fries dusted with tangy peri peri masala spice mix. Premium North Bengal potato cut fries, ready to fry in 3 minutes.',
            'short_description' => '1 Kg Jumbo pack of extra crunchy Peri Peri Fries.',
            'sku' => 'FRIES-PERI-1KG',
            'price' => 220.00,
            'special_price' => 89.00, // Member Extreme Discount!
            'in_stock' => 1,
            'qty' => 600,
            'is_active' => 1,
            'image_key' => 'fries',
            'categories' => [$categoryIds['Crispy Fries & Finger Foods']],
        ],
        [
            'name' => 'Flaky Himalayan Malabar Paratha (10 Pcs Pack)',
            'slug' => 'flaky-himalayan-malabar-paratha-10-pcs-pack',
            'description' => 'Multi-layered golden-brown flaky Malabar parathas. Heat on a tawa with butter for 2 minutes and enjoy restaurant-quality hot flaky parathas.',
            'short_description' => 'Flaky, buttery 100% wheat multi-layered parathas.',
            'sku' => 'PARA-MALABAR-10',
            'price' => 250.00,
            'special_price' => 99.00, // Member Extreme Discount!
            'in_stock' => 1,
            'qty' => 800,
            'is_active' => 1,
            'image_key' => 'paratha',
            'categories' => [$categoryIds['Frozen Parathas & Breads']],
        ],
        [
            'name' => 'Crispy Himalayan Veg Spring Rolls (12 Pcs Pack)',
            'slug' => 'crispy-himalayan-veg-spring-rolls-12-pcs-pack',
            'description' => 'Crunchy golden vegetable spring rolls packed with seasoned Himalayan vegetables, shredded cabbage, mushrooms, and glass noodles. Served with sweet chili dipping sauce.',
            'short_description' => 'Golden crispy spring rolls with sweet chili dip.',
            'sku' => 'ROLL-VEG-12',
            'price' => 230.00,
            'special_price' => 89.00, // Member Extreme Discount!
            'in_stock' => 1,
            'qty' => 450,
            'is_active' => 1,
            'image_key' => 'spring_rolls',
            'categories' => [$categoryIds['Himalayan Snacks & Starters']],
        ],
    ];

    $productIds = [];
    foreach ($productsData as $pData) {
        $product = Product::create([
            'slug' => $pData['slug'],
            'sku' => $pData['sku'],
            'price' => $pData['price'],
            'special_price' => $pData['special_price'],
            'special_price_type' => 'fixed',
            'special_price_start' => now(),
            'special_price_end' => now()->addYears(2),
            'in_stock' => $pData['in_stock'],
            'manage_stock' => 0,
            'qty' => $pData['qty'],
            'is_active' => $pData['is_active'],
            'name' => $pData['name'],
            'description' => $pData['description'],
            'short_description' => $pData['short_description'],
        ]);

        // Attach categories
        $product->categories()->attach($pData['categories']);

        // Attach image to entity_files
        if (isset($filesMap[$pData['image_key']])) {
            DB::table('entity_files')->insert([
                'file_id' => $filesMap[$pData['image_key']],
                'entity_type' => Product::class,
                'entity_id' => $product->id,
                'zone' => 'base_image',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        $productIds[] = $product->id;
    }

    echo "4. Created " . count($productIds) . " products with pricing & images.\n";

    // 5. Create Hero Slider
    $slider = Slider::create([
        'name' => 'Mailee Home Hero Banner',
        'speed' => 5000,
        'autoplay' => 1,
        'autoplay_speed' => 3000,
        'fade' => 1,
        'dots' => 1,
        'arrows' => 1,
    ]);

    // Slide 1
    $slide1 = $slider->slides()->create([
        'options' => [
            'caption_1' => [
                'delay' => '0s',
                'effect' => 'fadeInUp',
            ],
            'caption_2' => [
                'delay' => '0.3s',
                'effect' => 'fadeInUp',
            ],
            'call_to_action' => [
                'delay' => '0.6s',
                'effect' => 'fadeInUp',
            ],
        ],
        'call_to_action_url' => '/products',
        'open_in_new_window' => 0,
        'position' => 1,
        'caption_1' => 'Authentic Himalayan & Nepali Frozen Foods in North Bengal',
        'caption_2' => 'Join ₹10 VIP Club for Extreme Discounts Up to 70% OFF!',
        'call_to_action_text' => 'Join VIP Club Now',
    ]);

    DB::table('entity_files')->insert([
        'file_id' => $filesMap['hero_banner'],
        'entity_type' => SliderSlide::class,
        'entity_id' => $slide1->id,
        'zone' => 'file',
        'created_at' => now(),
        'updated_at' => now(),
    ]);

    // Slide 2
    $slide2 = $slider->slides()->create([
        'options' => [
            'caption_1' => [
                'delay' => '0s',
                'effect' => 'fadeInUp',
            ],
            'caption_2' => [
                'delay' => '0.3s',
                'effect' => 'fadeInUp',
            ],
            'call_to_action' => [
                'delay' => '0.6s',
                'effect' => 'fadeInUp',
            ],
        ],
        'call_to_action_url' => '/products/mailee-10-vip-club-membership-pass',
        'open_in_new_window' => 0,
        'position' => 2,
        'caption_1' => 'Mailee ₹10 VIP Membership Pass',
        'caption_2' => 'Unlock Wholesale Member Prices On All Frozen Food Orders!',
        'call_to_action_text' => 'Get ₹10 Membership',
    ]);

    DB::table('entity_files')->insert([
        'file_id' => $filesMap['membership'],
        'entity_type' => SliderSlide::class,
        'entity_id' => $slide2->id,
        'zone' => 'file',
        'created_at' => now(),
        'updated_at' => now(),
    ]);

    echo "5. Created Home Hero Slider (ID: {$slider->id}).\n";

    // 6. Configure Storefront homepage sections
    Setting::setMany([
        'storefront_slider' => $slider->id,
        'storefront_features_section_enabled' => 1,
        'storefront_feature_1_icon' => 'las la-snowflake',
        'storefront_feature_1_title' => 'Freshly Frozen (-18°C)',
        'storefront_feature_1_subtitle' => 'Sealed in flavor & authenticity',
        'storefront_feature_2_icon' => 'las la-tag',
        'storefront_feature_2_title' => '₹10 VIP Member Pass',
        'storefront_feature_2_subtitle' => 'Extreme wholesale prices for members',
        'storefront_feature_3_icon' => 'las la-shipping-fast',
        'storefront_feature_3_title' => 'Express North Bengal Delivery',
        'storefront_feature_3_subtitle' => 'Siliguri, Darjeeling & Jalpaiguri',
        'storefront_feature_4_icon' => 'las la-shield-alt',
        'storefront_feature_4_title' => '100% Quality Guaranteed',
        'storefront_feature_4_subtitle' => 'Authentic Himalayan & Nepali recipe',

        // Featured Categories Section
        'storefront_featured_categories_section_enabled' => 1,
        'storefront_featured_categories' => array_values($categoryIds),

        // Product Tabs 1 Section
        'storefront_product_tabs_1_section_enabled' => 1,
        'storefront_product_tabs_1_section_tab_1_product_type' => 'custom_products',
        'storefront_product_tabs_1_section_tab_1_products' => $productIds,

        'storefront_product_tabs_1_section_tab_2_product_type' => 'category_products',
        'storefront_product_tabs_1_section_tab_2_category_id' => $categoryIds['Authentic Himalayan Momos'],

        // Product Grid Section
        'storefront_product_grid_section_enabled' => 1,
        'storefront_product_grid_section_tab_1_product_type' => 'latest_products',

        // Flash Sales Section
        'storefront_flash_sale_and_vertical_products_section_enabled' => 0,

        // Banners
        'storefront_three_column_banners_section_enabled' => 0,
        'storefront_two_column_banners_section_enabled' => 0,
    ]);

    echo "6. Configured Storefront sections.\n";

    DB::commit();

    echo "SUCCESS: Mailee Frozen Foods demo data successfully populated!\n";

} catch (\Throwable $e) {
    DB::rollBack();
    echo "ERROR: " . $e->getMessage() . "\n" . $e->getTraceAsString() . "\n";
}
