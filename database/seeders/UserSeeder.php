<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = new User();
        $user->name = 'Md Nazmul Hasan';
        $user->email = 'nazmul.ns7989@gmail.com';
        $user->password = bcrypt('12345678');
        $user->save();
    }
}
