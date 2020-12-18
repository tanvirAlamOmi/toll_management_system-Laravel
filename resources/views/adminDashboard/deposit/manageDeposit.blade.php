
@extends('adminDashboard.master')

@section('title')
    Manage Transactions
@endsection

@section('mainContent')

<div id="page-wrapper"><br>
    <h3 class="text-center text-primary">Transaction List</h3>
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
                    <th>Transaction No. </th>
                    <th>Transaction Type</th>
                    <th>Amount</th>
                    <th>Vehicle No.</th>
                    <th>Vehicle Company</th>
                    <th>Deposited By</th>
                    <th>Action</th>
                    <!-- <th>Deposit Date</th> -->
                   
                </tr>
            </thead>
            <tbody>
                @php
                    $i = 1;
                @endphp

                @foreach($deposits as $deposit)
                <tr>
                    <th>{{$i++}}</th>
                   
                    <td>{!!$deposit->deposit_no!!} </td>
                    <td>{{$deposit->deposit_type == 1 ? 'Deposit' : 'Withdraw'}} </td>
                    @if($deposit->deposit_type == 1)
                    <th scope="row" style="background-color: #99ff99;  border-radius: 10px;">{!!$deposit->amount!!}</th>
                    @else 
                    <th scope="row" style="background-color: #ff8080 ; border-radius: 10px;">{!!$deposit->amount!!}</th>
                    @endif
                    <td>{!!$deposit->vehicle_no!!} </td>
                    <td>{!!$deposit->company_name!!} </td>
                    <td>{!!$deposit->user_name!!} </td>
                    <td>
                        <a class="btn btn-success" href="{{url('/deposit/edit/'.$deposit->id)}}" title="Edit">
                            <span class="fa fa-pencil-square-o">  </span>
                        </a>
                        <a class="btn btn-danger" href="{{url('/deposit/delete/'.$deposit->id)}}" title="Delete" onclick="return confirm('Are you sure?')">
                            <span class="fa fa-trash-o">  </span>
                        </a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
            {{$deposits->links()}}
        </div>
      </div>
    </div>
</div>
<!--</div>-->

@endsection