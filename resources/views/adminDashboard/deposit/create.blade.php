@extends('adminDashboard.master')

@section('title')
    Create Transaction
@endsection

@section('mainContent')

<br>
<div id="page-wrapper"><br>
    <h3 class="text-center text-primary"> Create Transaction</h3>
<div class="row">
        <div class="col-lg-12">
            <h5 class="text-center text-success">{{Session::get('message')}}</h5>     

        <div class="well">
            <!--<h2 class="text-center text-success">Fill this form up to add new Department</h2><br>-->
            {!! Form::open(['url'=>'/deposit/store','method'=>'POST','class'=>'form-horizontal']) !!}
            {{csrf_field()}}

            <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Transaction No.</label></label>
            <div class="col-sm-10">
            <input name="deposit_no" type="text" class="form-control" required="">
            </div>
          </div>
          
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Vehicle No.</label>
            <div class="col-sm-10">
                <select class="form-control" name="vehicle_id">
                    <option>...Select Vehicle... </option>
                    @foreach($vehicles as $vehicle)
                    <option value="{{$vehicle->id}}">{{$vehicle->vehicle_no}}</option>
                    @endforeach
                </select>
            </div>
            </div>
            <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Deposit Type</label>
            <div class="col-sm-10">
                <select class="form-control" name="deposit_type">
                    <option>...Select Deposit Type... </option>
                    <option value="1">Deposit</option>
                    <option value="0">withdraw</option>
                </select>
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Amount</label>
            <div class="col-sm-10">
            <input name="amount" type="number" step="0.01" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-block btn-success" name="sub">Save Transaction</button>
            </div>
          </div>
        {!! Form::close() !!}
        </div>
        </div>
    </div>
</div>

@endsection