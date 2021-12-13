<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;


class AuthController extends Controller
{
//Load Products
public function loadProducts()
{
    $products = Product::with('category')->paginate(8);
    return response()->json($products, 200);
}

//Show single product
    public function showProduct($id)
    {
        $product = Product::with('category')->find($id);
        if ($product){
            return response()->json($product, 200);
        }else{
            return response()->json('failed', 404);
        }
    }



//Update  user profile
    public function updateProfile(Request $request)
    {
        $user = Auth::user();

        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users,email,'.$user->id,
            'password' => 'sometimes|nullable|min:8|confirmed',
        ]);

//        return response()->json('profile updated successfully', 200);

        if ($user){
            $user->name = $request->name;
            $user->email = $request->email;
           if ($request->password){
               $user->password = Hash::make($request->password);
           }
            $user->save();
            return response()->json($user, 200);
        }
    }


}
