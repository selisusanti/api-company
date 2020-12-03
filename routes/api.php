<?php

use Illuminate\Http\Request;

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

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('login', 'API\UserController@login');
Route::post('register', 'API\UserController@register');

Route::group(['middleware' => 'auth:api'], function(){
    Route::post('details', 'API\UserController@details');
});

Route::group([
    'middleware' => 'auth:api'
], function () {

    Route::group([    
        'prefix' => 'companies'
    ], function () {    
        Route::get('', 'API\CompaniesController@index');
        Route::post('create', 'API\CompaniesController@create');
        Route::put('update/{id}', 'API\CompaniesController@update');
        Route::delete('delete/{id}', 'API\CompaniesController@delete');
    });

    Route::group([    
        'prefix' => 'employee'
    ], function () {    
        Route::get('', 'API\EmployeeController@index');
        Route::post('create', 'API\EmployeeController@create');
        Route::put('update/{id}', 'API\EmployeeController@update');
        Route::delete('delete/{id}', 'API\EmployeeController@delete');
    });

});