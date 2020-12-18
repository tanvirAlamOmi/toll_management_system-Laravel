<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Company;
use App\Vehicle;
use App\Deposit;
use Illuminate\Support\Facades\Auth;

class DepositController extends Controller
{
    public function create()
    {
        $vehicles = DB::table('vehicles')
            ->where('is_permitted', 1)
            ->get();
        return view('adminDashboard.deposit.create',compact('vehicles'));
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'deposit_no' => 'required',
            'vehicle_id' => 'required',
            'deposit_type' => 'required',
            'amount' => 'required',
        ]);
        $vehicle = new Deposit();
        $vehicle->deposit_no = $request->deposit_no;
        $vehicle->vehicle_id = $request->vehicle_id;
        $vehicle->deposit_type = $request->deposit_type;
        $vehicle->amount = $request->amount;
        $vehicle->user_id = Auth::user()->id;
        $vehicle->save();

        return redirect()->back()->with('message','Transactions Created Successfully');
    }

    public function manage()
    {
        $deposits = DB::table('deposits')
            ->join('vehicles','vehicles.id','=','deposits.vehicle_id')
            ->join('companies','companies.id','=','vehicles.company_id')
            ->join('users','users.id','=','deposits.user_id')
            ->select('deposits.*','vehicles.vehicle_no as vehicle_no','companies.name as company_name','users.name as user_name')
            ->paginate(10);
        return view('adminDashboard.deposit.manageDeposit',compact('deposits'));
    }

    public function edit($id)
    {
        $vehicles = DB::table('vehicles')
            ->where('is_permitted', 1)
            ->get();
        $deposit = Deposit::where('id', $id)->first();
        return view('adminDashboard.deposit.editDeposit', compact('vehicles','deposit'));
    }

    public function update(Request $request)
    {
        $this->validate($request,[
            'deposit_no' => 'required',
            'vehicle_id' => 'required',
            'deposit_type' => 'required',
            'amount' => 'required',
        ]);
        $vehicle = Deposit::find($request->id);
        $vehicle->deposit_no = $request->deposit_no;
        $vehicle->vehicle_id = $request->vehicle_id;
        $vehicle->deposit_type = $request->deposit_type;
        $vehicle->amount = $request->amount;
        // $vehicle->user_id = Auth::user()->id;
        $vehicle->save();
        return redirect('/deposit/manage')->with('message', 'Transaction Info Updated Successfully!!');
    }

    public function delete($id)
    {
        $deposit = Deposit::find($id);
        $deposit->delete();
        return redirect('/deposit/manage')->with('message2', 'Transaction Info Deleted Successfully!!');
    }
}
