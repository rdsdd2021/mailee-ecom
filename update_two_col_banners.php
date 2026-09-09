<?php

use Modules\Media\Entities\File;
use Modules\Setting\Entities\Setting;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

echo "Updating two-column banners...\n";

DB::beginTransaction();

try {
    $file1Path = storage_path('app/public/media/two_col_banner_1.png');
    $size1 = file_exists($file1Path) ? filesize($file1Path) : 800000;

    $file1 = File::create([
        'user_id' => 1,
        'filename' => 'two_col_banner_1.png',
        'disk' => 'public_storage',
        'path' => 'media/two_col_banner_1.png',
        'extension' => 'png',
        'mime' => 'image/png',
        'size' => (string)$size1,
    ]);

    $file2Path = storage_path('app/public/media/two_col_banner_2.png');
    $size2 = file_exists($file2Path) ? filesize($file2Path) : 800000;

    $file2 = File::create([
        'user_id' => 1,
        'filename' => 'two_col_banner_2.png',
        'disk' => 'public_storage',
        'path' => 'media/two_col_banner_2.png',
        'extension' => 'png',
        'mime' => 'image/png',
        'size' => (string)$size2,
    ]);

    Setting::setMany([
        'storefront_two_column_banners_enabled' => 1,

        'storefront_two_column_banners_1_file_id' => $file1->id,
        'storefront_two_column_banners_1_call_to_action_url' => '/products/flaky-himalayan-malabar-paratha-10-pcs-pack',
        'storefront_two_column_banners_1_open_in_new_window' => 0,

        'storefront_two_column_banners_2_file_id' => $file2->id,
        'storefront_two_column_banners_2_call_to_action_url' => '/products/crispy-peri-peri-french-fries-1-kg-jumbo-pack',
        'storefront_two_column_banners_2_open_in_new_window' => 0,
    ]);

    Cache::tags('settings')->flush();
    Cache::flush();

    DB::commit();

    echo "SUCCESS: Registered two-column banners (IDs: {$file1->id}, {$file2->id}) and updated settings.\n";

} catch (\Throwable $e) {
    DB::rollBack();
    echo "ERROR: " . $e->getMessage() . "\n";
}
