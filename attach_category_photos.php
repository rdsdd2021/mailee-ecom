<?php

use Modules\Category\Entities\Category;
use Modules\Media\Entities\File;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

require __DIR__ . '/vendor/autoload.php';
$app = require_once __DIR__ . '/bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

echo "Attaching media photos & banners to all categories...\n";

DB::beginTransaction();

try {
    $categoryFiles = [
        'authentic-himalayan-momos' => 'media/momos.png',
        'frozen-parathas-breads' => 'media/paratha.png',
        'crispy-fries-finger-foods' => 'media/fries.png',
        'himalayan-snacks-starters' => 'media/spring_rolls.png',
        'mailee-rs10-vip-membership' => 'media/membership.png',
    ];

    foreach ($categoryFiles as $slug => $path) {
        $category = Category::where('slug', $slug)->first();
        $file = File::where('path', $path)->first();

        if ($category && $file) {
            // Remove old entity_files for this category logo & banner
            DB::table('entity_files')
                ->where('entity_type', 'Modules\Category\Entities\Category')
                ->where('entity_id', $category->id)
                ->whereIn('zone', ['logo', 'banner'])
                ->delete();

            // Insert logo
            DB::table('entity_files')->insert([
                'entity_type' => 'Modules\Category\Entities\Category',
                'entity_id' => $category->id,
                'file_id' => $file->id,
                'zone' => 'logo',
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            // Insert banner
            DB::table('entity_files')->insert([
                'entity_type' => 'Modules\Category\Entities\Category',
                'entity_id' => $category->id,
                'file_id' => $file->id,
                'zone' => 'banner',
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            echo "Attached photo '{$path}' (File ID {$file->id}) as logo & banner for category '{$category->name}' (ID {$category->id}).\n";
        }
    }

    Cache::tags('categories')->flush();
    Cache::flush();

    DB::commit();

    echo "SUCCESS: Category photos and banners attached successfully!\n";

} catch (\Throwable $e) {
    DB::rollBack();
    echo "ERROR: " . $e->getMessage() . "\n";
}
