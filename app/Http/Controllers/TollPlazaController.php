<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Toll_Plaza;
use DB;
use Tests\TestCase;

class TollPlazaController extends Controller
{
    public function create()
    {
        return view('adminDashboard.toll-plaza.create');
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'name' => 'required',
            'location' => 'required',
            'district' => 'required',
            'phone' => 'required',
            'operator' => 'required',
            'toll_type' => 'required',
            'imei' => 'required',
        ]);
        $toll_plaza = new Toll_Plaza();
        $toll_plaza->name = $request->name;
        $toll_plaza->location = $request->location;
        $toll_plaza->district = $request->district;
        $toll_plaza->phone = $request->phone;
        $toll_plaza->operator = $request->operator;
        $toll_plaza->toll_type = $request->toll_type;
        $toll_plaza->toll_amount = $request->toll_amount;
        $toll_plaza->imei = $request->imei;
        $toll_plaza->save();
        return redirect()->back()->with('message','Toll Plaza Saved Successfully!!');
    }

    public function manage()
    {
        $toll_plazas = DB::table('toll__plazas')
            ->join('toll_type','toll_type.id','=','toll__plazas.toll_type')
            ->select('toll__plazas.*','toll_type.name as toll_type_name')
            ->paginate(10);

        return view('adminDashboard.toll-plaza.manageTollPlazas',compact('toll_plazas'));
    }

    public function edit($id)
    {
        $toll_plaza = Toll_Plaza::find($id);
        return view('adminDashboard.toll-plaza.editTollPlaza',compact('toll_plaza'));
    }

    public function update(Request $request)
    {
        $this->validate($request,[
            'name' => 'required',
            'location' => 'required',
            'district' => 'required',
            'phone' => 'required',
            'operator' => 'required',
            'toll_type' => 'required',
            'imei' => 'required',
        ]);
        $toll_plaza = Toll_Plaza::find($request->id);
        $toll_plaza->name = $request->name;
        $toll_plaza->location = $request->location;
        $toll_plaza->district = $request->district;
        $toll_plaza->phone = $request->phone;
        $toll_plaza->operator = $request->operator;
        $toll_plaza->toll_type = $request->toll_type;
        $toll_plaza->toll_amount = $request->toll_amount;
        $toll_plaza->imei = $request->imei;
        $toll_plaza->save();
        return redirect('/toll-plaza/manage')->with('message', 'Toll Plaza Updated Successfully!!');
    }

    public function delete($id)
    {
        $toll_plaza = Toll_Plaza::find($id);
        $toll_plaza->delete();
        return redirect('/toll-plaza/manage')->with('message2','Toll Plaza Deleted Successfully !!');
    }



}