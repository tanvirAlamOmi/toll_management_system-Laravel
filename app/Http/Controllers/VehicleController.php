<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Company;
use App\Vehicle;
use App\Toll;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Response;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Auth;

class VehicleController extends Controller
{
    public function create()
    {
        // $http = new \GuzzleHttp\Client();
        // $response = $http->post('http://toll-management.test/oauth/token', [
        //     'form_params' => [
        //         'grant_type' => 'password',
        //         'client_id' => 2,
        //         'client_secret' => 'HWM8reeG7o3AXJHXueLdybfJnsM41aYsuZdtydtS',
        //         'username' => Auth::user()->email,
        //         'password' => '123456',
        //         'scope' => '',
        //     ],
        // ]);
        // return $response;
        // $http = new \GuzzleHttp\Client();
        // $token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijg1MTA5NWJmNTcwZDA4NTMxYzgwYjc0ZDU4MjA4YTVmNjkwZmQ1ZGMwMDQzYjI4NDNjYjAwZTBhM2EyODk3YTFhNDE5MjU2MjMzNzc5ZTU5In0.eyJhdWQiOiIyIiwianRpIjoiODUxMDk1YmY1NzBkMDg1MzFjODBiNzRkNTgyMDhhNWY2OTBmZDVkYzAwNDNiMjg0M2NiMDBlMGEzYTI4OTdhMWE0MTkyNTYyMzM3NzllNTkiLCJpYXQiOjE1NjE5Nzg3MDEsIm5iZiI6MTU2MTk3ODcwMSwiZXhwIjoxNTkzNjAxMTAxLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.hDg9nweRaPjbHsYTS5hKdXY0Pd7xo0BZEH7TaHuogYjpAsHrYukOhYnIg205CsATynNzhWPvrupFsFEPbRm-7BmNQH5WyjXMJuv8YzIdeIlbdD_DxOnaronjxk-USNbmW04XtBBIVVIqMUjQaI08DiHaxfwmj8T-UWMgYcm8IWW3JL20HB6eYHZgIG1nzsJFlfyBg1AILBWeSHYKCl2gk3HbpiAOEsZl7ABLnaflM4xCzCN2hyLkMmpHeMF3krnFo-NZgmEored4stbyBXNnTMF15uLLQFq5F4G7vCAsjTzM3vlN7VNRe6TYJGnqY3hYoLKe-GnzZOJ2G5ES2L1dtnWA-kZj18RnSK2kEYsS-vYXoybrdAP_wu7mlwFi6HxmzsQZkcrAST2TV0QaI2tvjgKZC9aq4OPjSQoP9P4rx2e5sq1LMSExeWBuqZjbk6RonrCfoF36cKO_vjKk-CbpRd8vhqjxUoj-GBz-cZLulw7dwJO2-545zogY3sdxAS3I3QxT2K9l03BKVIABPZPirUYwn-dFSgagZ59FEDXCn7A6WeGqFyvPWXwn_Hc7A49o7TvJQAows6bFtrqPNyBzQ2xwu2WgAkbH85Y234Ys5foQn1Z_Mq1QcdmwGxLCYxd3Wlrq3aCMzqc7c4N89-zALGOFNP7R6qzcgGwTLo328Zk';
        // $response = $http->request('GET', '/api/user', [
        //     'headers' => [
        //         'Accept' => 'application/json',
        //         'Authorization' => 'Bearer '. $token,
        //     ],
        // ]);
        // return $response;
        $vehicle_types = DB::table('vehicle_types')->get();
        $companies = DB::table('companies')
            ->where('is_published', 1)
            ->get();

        return view('adminDashboard.vehicle.create', compact('vehicle_types', 'companies'));
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'vehicle_no' => 'required',
            'vehicle_type' => 'required | integer',
            'licence_no' => 'required',
            'engin_cc' => 'required',
            'engin_no' => 'required',
            'is_permitted' => 'required | integer',
            'company_id' => 'required | integer'
        ]);
        $vehicle = new Vehicle();
        $vehicle->vehicle_no = $request->vehicle_no;
        $vehicle->vehicle_type = $request->vehicle_type;
        $vehicle->licence_no = $request->licence_no;
        $vehicle->engin_cc = $request->engin_cc;
        $vehicle->engin_no = $request->engin_no;
        $vehicle->is_permitted = $request->is_permitted;
        $vehicle->company_id = $request->company_id;
        $vehicle->qr_code = $this->generate_QR_code();
        $vehicle->save();

        return redirect()->back()->with('message', 'Vehicle saved Successfully');
    }

    public function manage()
    {
        $vehicle_types = DB::table('vehicle_types')->get();
        $vehicles = DB::table('vehicles')
            ->join('companies', 'companies.id', '=', 'vehicles.company_id')
            ->join('vehicle_types', 'vehicle_types.id', '=', 'vehicles.vehicle_type')
            ->select('vehicles.*', 'companies.name as company_name', 'vehicle_types.vehicle_type as vehicle_type_name')
            ->paginate(10);

        return view('adminDashboard.vehicle.manageVehicle', compact('vehicles', 'vehicle_types'));
    }

    public function edit($id)
    {
        $vehicle_types = DB::table('vehicle_types')->get();
        $companies = DB::table('companies')
            ->where('is_published', 1)
            ->get();

        $vehicle = Vehicle::where('id', $id)->first();

        return view('adminDashboard.vehicle.editVehicle', compact('vehicle_types', 'companies', 'vehicle'));
    }

    public function update(Request $request)
    {
        $this->validate($request, [
            'vehicle_no' => 'required',
            'vehicle_type' => 'required',
            'licence_no' => 'required',
            'engin_cc' => 'required',
            'engin_no' => 'required',
            'is_permitted' => 'required',
            'company_id' => 'required'
        ]);
        $vehicle = Vehicle::find($request->id);
        $vehicle->vehicle_no = $request->vehicle_no;
        $vehicle->vehicle_type = $request->vehicle_type;
        $vehicle->licence_no = $request->licence_no;
        $vehicle->engin_cc = $request->engin_cc;
        $vehicle->engin_no = $request->engin_no;
        $vehicle->is_permitted = $request->is_permitted;
        $vehicle->company_id = $request->company_id;
        $vehicle->save();

        return redirect('/vehicle/manage')->with('message', 'Vehicle Info Updated Successfully!!');
    }

    public function delete($id)
    {
        $vehicle = Vehicle::find($id);
        $vehicle->delete();
        return redirect('/vehicle/manage')->with('message2', 'Vehicle Info Deleted Successfully!!');
    }

    protected function generate_QR_code()
    {
        $qr = "";
        for ($i = 0; $i <= 5; $i++) {
            $x = rand(1000000, 9999999);
            $qr .= strval($x);
        }
        return $qr;
    }
    public function qr($id)
    {
        $vehicle = Vehicle::find($id);
        $name = $vehicle->vehicle_no;
        QrCode::format('png')
            ->size(350)
            ->generate($vehicle->qr_code, public_path('images/qr_code/' . $name . ".png"));
        $file = public_path() . "/images/qr_code/" . $name . ".png";
        $headers = array(
            'Content-Type: application/png',
        );
        return Response::download($file, $name . '.png', $headers);
    }

    public function balance()
    {
        $vehicles = Vehicle::with('deposits')->paginate(10);
        foreach ($vehicles as $vehicle) {
            $sum = 0;
            foreach ($vehicle->deposits as $deposit) {
                if ($deposit->deposit_type) $sum += $deposit->amount;
                else $sum -= $deposit->amount;
            }
            $vehicle->balance = $sum - Toll::where('vehicle_id', $vehicle->id)->sum('toll_amount');
            $company_name = Company::where('id', $vehicle->company_id)->pluck('name');
            $vehicle->company_name = $company_name[0];
        }
        return view('adminDashboard.vehicle.balance', compact('vehicles'));
    }

    public function cmp($a, $b)
    {
        return $a->balance > $b->balance;
    }
}
