<?php

use Illuminate\Support\Facades\Route;

Route::get('/', 'HomeController@index')->name('home');
Route::get('vip', 'PageController@vip')->name('vip');
Route::get('vip-membership', 'PageController@vip')->name('vip.membership');
Route::get('about-us', 'PageController@show')->defaults('slug', 'about-us')->name('about_us');
