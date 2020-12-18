
@extends('adminDashboard.master')

@section('title')
    Manage Toll plazas
@endsection

@section('mainContent')

<div id="page-wrapper"><br>
    <h3 class="text-center text-primary">Toll Plaza List</h3>
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
                    <th>Name </th>
                    <th>Location</th>
                    <th>District</th>
                    <th>Toll Type</th>
                    <th>Phone</th>
                    <th>IMEI</th>
                    <th>Toll Price</th>
                    <th>Operator</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $i = 1;
                @endphp
                
                @foreach($toll_plazas as $toll_plaza)
                <tr>
                    <th>{!!$i++!!} </th>
                    <td>{!!$toll_plaza->name!!} </td>
                    <td>{!!$toll_plaza->location!!} </td>
                    <td>{!!$toll_plaza->district!!} </td>
                    <td>{!!$toll_plaza->toll_type_name!!} </td>
                    <td>{!!$toll_plaza->phone!!} </td>
                    <td>{!!$toll_plaza->imei!!} </td>
                    <td>{!!$toll_plaza->toll_amount!!} </td>
                    <td>{!!$toll_plaza->operator!!} </td>
                    <td>
                        <a class="btn btn-success" href="{{url('/toll-plaza/edit/'.$toll_plaza->id)}}" title="Edit">
                            <span class="fa fa-pencil-square-o">  </span>
                        </a>
                        <a class="btn btn-danger" href="{{url('/toll-plaza/delete/'.$toll_plaza->id)}}" title="Delete" onclick="return confirm('Are you sure?')">
                            <span class="fa fa-trash-o">  </span>
                        </a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
            {{$toll_plazas->links()}}
        </div>
      </div>
    </div>
</div>
<!--</div>-->

@endsection