<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Company;
use App\Vehicle;
use View;
use App\Deposit;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        view::composer('adminDashboard.dashboard',function($view){
            $companyCount = Company::count();
            $view->with('companyCount',$companyCount);
            $vehicleCount = Vehicle::count();
            $view->with('vehicleCount',$vehicleCount);
            $depositCount = Deposit::count();
            $view->with('depositCount',$depositCount);
            });
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
