<?php

namespace Database\Factories;

use App\Models\Product;
use Dotenv\Util\Str;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Product::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
         $count = 0;
         $name =  $this->faker->name();
         $slug =  \Illuminate\Support\Str::slug($name);

        return [
            'id' => $count ++,
            'image' => 'https://images.pexels.com/photos/533769/pexels-photo-533769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            'name' => $name,
            'slug' => $slug,
            'price' => random_int(100,500),
            'category_id' => random_int(1,10),
            'description' => $this->faker->text(20)
        ];
    }
}
