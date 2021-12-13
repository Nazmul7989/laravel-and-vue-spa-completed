<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\Auth\AuthController;


//Frontend Route
Route::get('/products',[AuthController::class,'loadProducts']);
Route::get('/product/show/{id}', [AuthController::class,'showProduct']);


//Backend Route
Route::middleware('auth:sanctum')->group(function (){
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::put('/user',[AuthController::class,'updateProfile']);

    //Category Route
    Route::get('/category',[CategoryController::class,'index']);
    Route::post('/category/create',[CategoryController::class,'store']);
    Route::get('/category/edit/{id}', [CategoryController::class,'edit']);
    Route::put('/category/{id}', [CategoryController::class,'update']);
    Route::delete('/category/{id}', [CategoryController::class,'destroy']);

//Product Route
    Route::get('/product',[ProductController::class,'index']);
    Route::post('/product/create',[ProductController::class,'store']);
    Route::get('/product/edit/{id}', [ProductController::class,'edit']);
    Route::post('/product/{id}', [ProductController::class,'update']);
    Route::delete('/product/{id}', [ProductController::class,'destroy']);


});


// Login && Register && Logout Route
//Route::post('/register', [AuthController::class,'register']);


