<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
| 
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::group(['middleware' => ['web']], function () {
    Route::group(['prefix' => 'company'], function () {
        Route::get('/create', 'CompanyColtroller@create')->name('company.create');
        Route::post('/store', 'CompanyColtroller@store')->name('company.store');
        Route::get('/manage', 'CompanyColtroller@manage')->name('company.manage');
        Route::get('/edit/{id}', 'CompanyColtroller@edit')->name('company.edit');
        Route::post('/update', 'CompanyColtroller@update')->name('company.update');
        Route::get('/delete/{id}', 'CompanyColtroller@delete')->name('company.delete');
    });

    Route::group(['prefix' => 'vehicle'], function () {
        Route::get('/create', 'VehicleController@create')->name('vehicle.create');
        Route::post('/store', 'VehicleController@store')->name('vehicle.store');
        Route::get('/manage', 'VehicleController@manage')->name('vehicle.manage');
        Route::get('/edit/{id}', 'VehicleController@edit')->name('vehicle.edit');
        Route::post('/update', 'VehicleController@update')->name('vehicle.update');
        Route::get('/delete/{id}', 'VehicleController@delete')->name('vehicle.delete');
        Route::get('/qr/{id}', 'VehicleController@qr')->name('vehicle.qr');
    });

    Route::group(['prefix' => 'deposit'], function () {
        Route::get('/create', 'DepositController@create')->name('deposit.create');
        Route::post('/store', 'DepositController@store')->name('deposit.store');
        Route::get('/manage', 'DepositController@manage')->name('deposit.manage');
        Route::get('/edit/{id}', 'DepositController@edit')->name('deposit.edit');
        Route::post('/update', 'DepositController@update')->name('deposit.update');
        Route::get('/delete/{id}', 'DepositController@delete')->name('deposit.delete');
    });

    Route::group(['prefix' => 'toll-plaza'], function () {
        Route::get('/create', 'TollPlazaController@create')->name('toll-plaza.create');
        Route::post('/store', 'TollPlazaController@store')->name('toll-plaza.store');
        Route::get('/manage', 'TollPlazaController@manage')->name('toll-plaza.manage');
        Route::get('/edit/{id}', 'TollPlazaController@edit')->name('toll-plaza.edit');
        Route::post('/update', 'TollPlazaController@update')->name('toll-plaza.update');
        Route::get('/delete/{id}', 'TollPlazaController@delete')->name('toll-plaza.delete');
    });

    Route::group(['prefix' => 'tolls'], function () {
        // Route::get('/create', 'TollController@create')->name('toll-plaza.create');
        // Route::post('/store', 'TollController@store')->name('toll-plaza.store');
        Route::get('/list-all', 'TollController@manage')->name('toll.manage');
        // Route::get('/edit/{id}', 'TollController@edit')->name('toll-plaza.edit');
        // Route::post('/update', 'TollController@update')->name('toll-plaza.update');
        // Route::get('/delete/{id}', 'TollController@delete')->name('toll-plaza.delete');
    });

    Route::get('vehicle-balance','VehicleController@balance')->name('vehicle.balance');
});
