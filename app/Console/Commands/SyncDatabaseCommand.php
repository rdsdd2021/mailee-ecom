<?php

namespace FleetCart\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;

class SyncDatabaseCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'mailee:sync-db';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Import the Mailee database snapshot from database/mailee_database.sql';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle(): int
    {
        $sqlPath = database_path('mailee_database.sql');

        if (! file_exists($sqlPath)) {
            $this->error("SQL dump not found at {$sqlPath}");
            return 1;
        }

        $this->info("Importing database snapshot from {$sqlPath}...");

        try {
            $sql = file_get_contents($sqlPath);
            DB::unprepared($sql);

            Cache::flush();
            $this->callSilent('view:clear');
            $this->callSilent('cache:clear');

            $this->info("✓ Mailee database successfully synchronized and caches cleared!");
            return 0;
        } catch (\Throwable $e) {
            $this->error("Failed to import database: " . $e->getMessage());
            return 1;
        }
    }
}
