<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*Route::get('/', function () {
    return view('layouts.main');
});*/

Auth::routes();

Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/about-us',[\App\Http\Controllers\AboutController::class,'index']);
Route::get('/services',[\App\Http\Controllers\ServiceController::class,'index']);
Route::get('/services/{slug}',[\App\Http\Controllers\ServiceController::class,'show'])->name('services.show');
Route::get('/projets',[\App\Http\Controllers\ProjetController::class,'index']);
Route::get('/projets/{slug}',[\App\Http\Controllers\ProjetController::class,'show'])->name('projets.show');
Route::get('/news',[\App\Http\Controllers\BlogController::class,'index']);
Route::post('/contact',[\App\Http\Controllers\ContactController::class,'store'])->name('contact.store');
Route::get('/news/{slug}',[\App\Http\Controllers\BlogController::class,'show'])->name('blog.show');


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
