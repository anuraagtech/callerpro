<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        // $user1 = User::factory()->create([
        //     'name' => 'Admin',
        //     'email' => 'admin@example.com',
        // ]);
        User::factory()->create([
            'name' => 'Admin',
            'email' => 'admin@example.com',
            'user_type' => 'Admin',
            'password' => Hash::make('adminpassword')
        ]);
        User::factory()->create([
            'name' => 'SubAdmin',
            'email' => 'subadmin@example.com',
            'user_type' => 'SubAdmin',
            'password' => Hash::make('subadminpassword')
        ]);
        User::factory()->create([
            'name' => 'Caller',
            'email' => 'caller@example.com',
            'user_type' => 'Caller',
            'password' => Hash::make('callerpassword')
        ]);
    }
}
