<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Company;
use DB;

class CompanyColtroller extends Controller
{
    public function create()
    {
        return view('adminDashboard.company.create');
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'name' => 'required',
            'phone' => 'required',
            'address' => 'required',
            'email' => 'required | email',
            'is_published' => 'required | integer',
        ]);
        $company = new Company();
        $company->name = $request->name;
        $company->phone = $request->phone;
        $company->address = $request->address;
        $company->email = $request->email;
        $company->is_published = $request->is_published;
        $company->save();
        return redirect()->back()->with('message','Company saved Successfully');
    }

    public function manage()
    {
        // $live_database = DB::connection('my-live-db');
        // // Get table data from production
        // foreach($live_database->table('table_name')->get() as $data){
        //    // Save data to staging database - default db connection
        //    DB::table('table_name')->insert((array) $data);
        // }
        // // Get table_2 data from production
        // foreach($live_database->table('table_2_name')->get() as $data){
        //    // Save data to staging database - default db connection
        //    DB::table('table_2_name')->insert((array) $data);
        // }
        $companies = Company::paginate(10);
        return view('adminDashboard.company.manageCompany',compact('companies'));
    }

    public function edit($id)
    {
        $company = Company::where('id',$id)->first();
        return view('adminDashboard.company.editCompany',compact('company'));
    }

    public function update(Request $request)
    {
        $this->validate($request,[
            'name' => 'required',
            'phone' => 'required',
            'address' => 'required',
            'email' => 'required | email',
            'is_published' => 'required',
        ]);
        $company = Company::find($request->id);
        $company->name = $request->name;
        $company->phone = $request->phone;
        $company->address = $request->address;
        $company->email = $request->email;
        $company->is_published = $request->is_published;
        $company->save();
        return redirect('/company/manage')->with('message','Company Info Updated Successfully!!');
    }

    public function delete($id)
    {
        $company = Company::find($id);
        $company->delete();
        return redirect('/company/manage')->with('message2','Company Deleted Successfully !!');
    }

}
