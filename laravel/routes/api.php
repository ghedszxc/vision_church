<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\DiscipleController;
use App\Http\Controllers\AttendController;
use App\Http\Controllers\EventController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


// Route::group(["middleware" =>'auth:api'], function() { });
Route::middleware('api')->group(function () {
    Route::resource('disciple', DiscipleController::class);
    Route::put('disciple/updateStatus/{id}', [DiscipleController::class, 'updateStatus']);
    Route::get('disciple/getInactiveDisiples/{id}', [DiscipleController::class, 'getInactiveDisiples']);
    Route::put('disciple/updateIsArchive/{id}', [DiscipleController::class, 'updateIsArchive']);
    
    
    
    Route::resource('event', EventController::class);
    
    Route::resource('attendee', AttendController::class);
    Route::post('attendee/addFirstTimer', [AttendController::class, 'addFirstTimer']);

});