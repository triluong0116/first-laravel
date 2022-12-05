<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\PagesController;
use App\Http\Controllers\FoodsController;
use App\Http\Controllers\Admin\Users\LoginController;
use App\Http\Controllers\Admin\MainController;
use \App\Http\Controllers\Admin\Users\RegisterController;


Route::get('/', [PagesController::class, 'index']);
Route::get('/about', [PagesController::class, 'about']);

Route::get('products', [
    ProductsController::class,
    'index'
]);

Route::get('admin/users/register', [RegisterController::class, 'index']);
Route::post('admin/users/register', [RegisterController::class, 'store']);


Route::get('admin/users/login', [LoginController::class, 'index']);
Route::post('admin/users/login/store', [LoginController::class, 'store']);

Route::middleware(['auth'])->group(function () {

    Route::prefix('admin')->group(function () {

        Route::get('/', [MainController::class, 'index'])->name('admin');
        Route::get('main', [MainController::class, 'index']);

        Route::prefix('foods')->group(function () {
            Route::get('/', [FoodsController::class, 'index']);
            Route::get('create', [FoodsController::class, 'create']);
            Route::post('create', [FoodsController::class, 'store']);
            Route::get('list', [FoodsController::class, 'index']);
            Route::get('/{food}', [FoodsController::class, 'show']);
            Route::get('/edit/{food}', [FoodsController::class, 'edit']);
            Route::post('/edit/{food}', [FoodsController::class, 'update']);
            Route::DELETE('destroy', [FoodsController::class, 'destroy']);
        });
        Route::get('users/logout',  [LoginController::class, 'logout']);
    });
});


