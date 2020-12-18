<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Company;
use App\Vehicle;
use App\Toll_Plaza;
use App\Toll;
use App\Deposit;

class TollController extends Controller
{
    public function manage()
    {
        $tolls = DB::table('tolls')
            ->join('toll__plazas','toll__plazas.id','=','tolls.toll_plaza_id')
            ->join('vehicles','vehicles.id','=','tolls.vehicle_id')
            ->join('companies','companies.id','=','vehicles.company_id')
            ->select('tolls.*','toll__plazas.name as toll_plaza_name',
                    'toll__plazas.toll_amount as toll_price','vehicles.vehicle_no','companies.name as company_name')
            ->paginate(10);
        return view('adminDashboard.tolls.manageTolls',compact('tolls'));
    }

    //This function is for the API..
    public function tollCollection(Request $request)
    {
        $toll_plaza = Toll_Plaza::where('imei',$request->imei)->first();
        $vehicle = Vehicle::where('qr_code',$request->qr_code)->first();

        $balance = Deposit::where('vehicle_id',$vehicle->id)->where('deposit_type',1)->sum('amount') - 
        Deposit::where('vehicle_id',$vehicle->id)->where('deposit_type',0)->sum('amount') -
        Toll::where('vehicle_id',$vehicle->id)->sum('toll_amount');

        if($toll_plaza->toll_amount > $balance)  return "Not Enough Balance";

        $toll = new Toll();
        $toll->toll_plaza_id = $toll_plaza->id;
        $toll->vehicle_id = $vehicle->id;
        $toll->toll_amount = $toll_plaza->toll_amount;
        $toll->save();

        return response()->json($toll);
    }
}
