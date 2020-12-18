<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        $vehicle_type = ['Bus','Truck','Personal Car','Others'];
        for ($i=0; $i < 4; $i++) { 
            DB::table('vehicle_types')->insert([
                'vehicle_type' => $vehicle_type[$i]
            ]);
        }
    }
}
