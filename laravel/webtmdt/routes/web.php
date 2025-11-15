<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BookController;
use App\Http\Controllers\ViduLayoutController;
use App\Http\Controllers\SachController;
use Inertia\Inertia;

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
Route::get('/qlsach/theloai', [BookController::class, 'laythongtintheloai']);
Route::get('/qlsach/thongtinsach', [BookController::class, 'laythongtinsach']);
Route::get('/qlsach/nhapdulieu', [BookController::class, 'nhapdulieu']);
Route::get('/qlsach/luudulieu', [BookController::class, 'luudulieu']);

Route::get('/trang1', [ViduLayoutController::class, 'trang1']);
Route::get('/sach', [SachController::class, 'index']);
Route::get('/sach/theloai/{id}', [SachController::class, 'theloai']);
Route::get('/sach/chitiet/{id}', [SachController::class, 'chitiet']);
Route::get('/', 'App\Http\Controllers\ViduLayoutController@sach');
Route::get('/accountpanel', 'App\Http\Controllers\AccountController@accountpanel')
    ->middleware('auth')
    ->name("account");
    Route::post('/saveaccountinfo', 'App\Http\Controllers\AccountController@saveaccountinfo')
    ->middleware('auth')
    ->name('saveinfo');

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
