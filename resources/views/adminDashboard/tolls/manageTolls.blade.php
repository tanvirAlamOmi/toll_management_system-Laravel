
@extends('adminDashboard.master')

@section('title')
    Manage Tolls
@endsection

@section('mainContent')

<div id="page-wrapper"><br>
    <h3 class="text-center text-primary">Tolls List</h3>
<h3 class="text-center text-success">{{Session::get('message')}}</h3>
<h3 class="text-center text-danger">{{Session::get('message2')}}</h3>  
<hr/>
<!--<div class="container">-->
    <div class="row">
      <div class="col-lg-12">
        <div class="well">
        <table class="table table-hover table-bordered">
            <thead>
                <tr>
                    <th>SL.</th>
                    <th>Toll Plaza </th>
                    <th>Vehicle</th>
                    <th>Company</th>
                    <th>Toll Amount</th>
                    <th>Time and Date</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $i = 1;
                @endphp

                @foreach($tolls as $toll)
                <tr>
                    <td>{!!$i++!!} </td>
                    <td>{!!$toll->toll_plaza_name!!} </td>
                    <td>{!!$toll->vehicle_no!!} </td>
                    <td>{!!$toll->company_name!!} </td>
                    <td>{!!$toll->toll_price!!} </td>
                    <td>{!!$toll->created_at!!} </td>
                    
                </tr>
                @endforeach
            </tbody>
        </table>
            {{$tolls->links()}}
        </div>
      </div>
    </div>
</div>
<!--</div>-->

@endsection