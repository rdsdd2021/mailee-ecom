<?php

use Modules\Media\Entities\File;
use Modules\Setting\Entities\Setting;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

echo "Updating one-column bottom banner...\n";

DB::beginTransaction();

try {
    $filePath = storage_path('app/public/media/one_col_banner.png');
    $size = file_exists($filePath) ? filesize($filePath) : 800000;

    $file = File::create([
        'user_id' => 1,
        'filename' => 'one_col_banner.png',
        'disk' => 'public_storage',
        'path' => 'media/one_col_banner.png',
        'extension' => 'png',
        'mime' => 'image/png',
        'size' => (string)$size,
    ]);

    Setting::setMany([
        'storefront_one_column_banner_enabled' => 1,
        'storefront_one_column_banner_file_id' => $file->id,
        'storefront_one_column_banner_call_to_action_url' => '/products/mailee-rs10-vip-club-membership-pass',
        'storefront_one_column_banner_open_in_new_window' => 0,
    ]);

    Cache::tags(['settings'])->flush();
    Cache::flush();

    DB::commit();

    echo "SUCCESS: Registered one-column bottom banner (ID: {$file->id}) and updated settings.\n";

} catch (\Throwable $e) {
    DB::rollBack();
    echo "ERROR: " . $e->getMessage() . "\n";
}
