
@extends('adminDashboard.master')

@section('title')
    Manage Vehicles
@endsection

@section('mainContent')

<div id="page-wrapper"><br>
    <h3 class="text-center text-primary">Vehicle List</h3>
<h4 class="text-center text-success">{{Session::get('message')}}</h4>
<h4 class="text-center text-danger">{{Session::get('message2')}}</h4>  
<hr/>
<!--<div class="container">-->
    <div class="row">
      <div class="col-lg-12">
        <div class="well">
        <table class="table table-hover table-bordered">
            <thead>
                <tr>
                    <th>SL.</th>
                    <th>Vehicle NO. </th>
                    <th>Vehicle Type</th>
                    <th>Licence No. </th>
                    <th>Engine CC</th>
                    <th>Engine No.</th>
                    <th>Company Name</th>
                    <th>QR Code</th>
                    <th style="width:16%">Action</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $i = 1;
                @endphp

                @foreach($vehicles as $vehicle)
                <tr>
                    @if($vehicle->is_permitted == 1)
                    <th scope="row" style="background-color: #228B22;  border-radius: 10px;">{{$i++}}</th>
                    @else 
                    <th scope="row" style="background-color: #ff0000 ; border-radius: 10px;">{{$i++}}</th>
                    @endif
                    <td>{!!$vehicle->vehicle_no!!} </td>
                    <td>{!!$vehicle->vehicle_type_name!!} </td>
                    <td>{!!$vehicle->licence_no!!} </td>
                    <td>{!!$vehicle->engin_cc!!} </td>
                    <td>{!!$vehicle->engin_no!!} </td>
                    <td>{!!$vehicle->company_name!!} </td>
                    <td><img src="data:image/png;base64, {!! base64_encode(QrCode::format('png')->margin(0)->size(70)->generate($vehicle->qr_code)) !!} "></td>
                    <td>
                        <a class="btn btn-success" href="{{url('/vehicle/edit/'.$vehicle->id)}}" title="Edit">
                            <span class="fa fa-pencil-square-o">  </span>
                        </a>
                        <a class="btn btn-danger" href="{{url('/vehicle/delete/'.$vehicle->id)}}" title="Delete" onclick="return confirm('Are you sure?')">
                            <span class="fa fa-trash-o">  </span>
                        </a>
                        <a class="btn btn-primary" href="{{url('/vehicle/qr/'.$vehicle->id)}}" title="Qr Code">
                            <span class="fa fa-download">  </span>
                        </a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
            {{$vehicles->links()}}
        </div>
      </div>
    </div>
</div>
<!--</div>-->



@endsection