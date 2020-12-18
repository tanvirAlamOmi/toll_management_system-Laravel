
@extends('adminDashboard.master')

@section('title')
    Vehicle Balance
@endsection

@section('mainContent')

<div id="page-wrapper"><br>
    <h3 class="text-center text-primary">Vehicle Wise Balance</h3>
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
                    <th>Licence No. </th>
                    <th>Company Name</th>
                    <th>Balance</th>
                    <!-- <th>QR Code</th> -->
                </tr>
            </thead>
            <tbody>
                @php
                    $i = 1;
                @endphp

                @foreach($vehicles as $vehicle)
                <tr>
                    <th>{{$i++}}.</th>
                    <td>{!!$vehicle->vehicle_no!!} </td>
                    <td>{!!$vehicle->licence_no!!} </td>
                    <td>{!!$vehicle->company_name!!} </td>
                    @if($vehicle->balance > 0)
                    <th scope="row" style="background-color: #99ff99;  border-radius: 10px;">{!!$vehicle->balance!!}</th>
                    @else 
                    <th scope="row" style="background-color: #ff8080 ; border-radius: 10px;">{!!$vehicle->balance!!}</th>
                    @endif
                    <!-- <td><img src="data:image/png;base64, {!! base64_encode(QrCode::format('png')->margin(0)->size(70)->generate($vehicle->qr_code)) !!} "></td> -->
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