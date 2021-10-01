<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeders.
     *
     * @return void
     */
    public function run()
    {
        DB::table('movies')->insert([
            'name' => 'Transformers',
            'type' => 'Comedy',
        ]);

        DB::table('movies')->insert([
            'name' => 'Knives out',
            'type' => 'Mystery/Crime',
        ]);
    }
}
