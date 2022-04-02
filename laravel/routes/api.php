<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\AuthController;
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

// // // Authenticated APIs
// Route::group(["middleware" =>'auth:sanctum'], function() {
//     // Route::resource('disciple', DiscipleController::class);
//     // // Route::get('disciple/sampleRoute/{id}', [DiscipleController::class, 'sampleRoute']);
// });


Route::post('auth/authLogin', [AuthController::class, 'authLogin']);

Route::middleware('api')->group(function () {
    Route::resource('auth', AuthController::class);
    Route::get('auth/getAuthuser/{id}', [AuthController::class, 'getAuthuser']);
    

    // DISCIPLE
    Route::resource('disciple', DiscipleController::class);
    Route::put('disciple/updateStatus/{id}', [DiscipleController::class, 'updateStatus']);
    Route::put('disciple/updateIsArchive/{id}', [DiscipleController::class, 'updateIsArchive']);
    Route::get('disciple/getInactiveDisiples/{id}', [DiscipleController::class, 'getInactiveDisiples']);
    Route::get('disciple/getBirthdayCelebantThisWeek/{id}', [DiscipleController::class, 'getBirthdayCelebantThisWeek']);
    
    // EVENT
    Route::resource('event', EventController::class);
    
    // ATTENDEE
    Route::resource('attendee', AttendController::class);
    Route::post('attendee/addFirstTimer', [AttendController::class, 'addFirstTimer']);
});