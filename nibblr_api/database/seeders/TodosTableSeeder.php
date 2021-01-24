<?php

namespace Database\Seeders;

use App\Models\Todo;
use Illuminate\Database\Seeder;

class TodosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Let's truncate our existing records to start from scratch.
        Todo::truncate();

        $faker = \Faker\Factory::create();

        for($i = 0; $i < 10; $i++) {
            Todo::create([
                'title' => $faker->word,
                'description' => $faker->paragraph,
                'done' => $faker->boolean
            ]);
        }
    }
}
