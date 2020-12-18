
@extends('adminDashboard.master')

@section('title')
    Manage Company
@endsection

@section('mainContent')

<div id="page-wrapper"><br>
    <h3 class="text-center text-primary">Company List</h3>
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
                    <th>Company </th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Publication Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $i = 1;
                @endphp

                @foreach($companies as $company)
                <tr>
                    @if($company->is_published == 1)
                    <th scope="row" style="background-color: #228B22;  border-radius: 10px;">{{$i++}}</th>
                    @else 
                    <th scope="row" style="background-color: #ff0000 ; border-radius: 10px;">{{$i++}}</th>
                    @endif
                    <td>{!!$company->name!!} </td>
                    <td>{!!$company->phone!!} </td>
                    <td>{!!$company->email!!} </td>
                    <td>{!!$company->address!!} </td>
                    <td>{{$company->is_published == 1 ? 'Published' : 'Unpublished'}} </td>
                    <td>
                        <a class="btn btn-success" href="{{url('/company/edit/'.$company->id)}}" title="Edit">
                            <span class="fa fa-pencil-square-o">  </span>
                        </a>
                        <a class="btn btn-danger" href="{{url('/company/delete/'.$company->id)}}" title="Delete" onclick="return confirm('Are you sure?')">
                            <span class="fa fa-trash-o">  </span>
                        </a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
            {{$companies->links()}}
        </div>
      </div>
    </div>
</div>
<!--</div>-->

@endsection