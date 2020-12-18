<?php

use Illuminate\Http\Request;
// use Symfony\Component\Routing\Route;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/toll-collection','TollController@tollCollection');

Route::post('loginTest', 'ApiController@login');
Route::post('detailsTest', 'ApiController@details');