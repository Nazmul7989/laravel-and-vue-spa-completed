<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Image;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Product::with('category')->latest()->take(10)->get();
        return response()->json($products, 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'image' => 'required|image',
            'name' => 'required|unique:products,name',
            'price' => 'required',
            'category_id' => 'required',
            'description' => 'required'
        ]);

        if ($request->hasFile('image')){
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $image = "Product_".time().'.'.$extension;
            Image::make($file)->save(public_path()."/assets/images/products/".$image);
        }
        $product = new Product();

        $product->image = $image;
        $product->name = $request->name;
        $product->slug = Str::slug($request->name);
        $product->price = $request->price;
        $product->category_id = $request->category_id;
        $product->description = $request->description;
        $product->save();

        return response()->json('success', 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product, $id)
    {
        $product = Product::with('category')->find($id);
        if ($product){
            return response()->json($product, 200);
        }else{
            return response()->json('failed', 404);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product, $id)
    {
        $product = Product::find($id);

        if ($product){
            return response()->json($product, 200);
        }else{
            return response()->json('failed', 404);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
//        return response()->json($request->all(), 422);

        $product = Product::find($id);

        $request->validate([
            'image' => 'sometimes|nullable|image',
            'name' => 'required|unique:products,name,'.$id,
            'price' => 'required',
            'category_id' => 'required',
            'description' => 'required'
        ]);

        if ($product){
            if ($request->hasFile('image')){
                unlink(public_path()."/assets/images/products/".$product->image);
                $file = $request->file('image');
                $extension = $file->getClientOriginalExtension();
                $image = "Product_".time().'.'.$extension;
                Image::make($file)->save(public_path()."/assets/images/products/".$image);
                $product->image = $image;
            }

            $product->name = $request->name;
            $product->slug = Str::slug($request->name);
            $product->price = $request->price;
            $product->category_id = $request->category_id;
            $product->description = $request->description;
            $product->save();

            return response()->json($product, 200);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product, $id)
    {
        $product = Product::find($id);
        if ($product){
            unlink(public_path()."/assets/images/products/".$product->image);
            $product->delete();
            return response()->json('success', 200);
        }else{
            return response()->json('failed', 404);
        }
    }
}
