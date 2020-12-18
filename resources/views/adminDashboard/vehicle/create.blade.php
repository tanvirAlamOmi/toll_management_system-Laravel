@extends('adminDashboard.master')

@section('title')
    Add Vehicle
@endsection

@section('mainContent')

<br>
<div id="page-wrapper"><br>
    <h3 class="text-center text-primary"> Add Vehicle</h3>
<div class="row">
        <div class="col-lg-12">
            <h5 class="text-center text-success">{{Session::get('message')}}</h5>     

        <div class="well">
            <!--<h2 class="text-center text-success">Fill this form up to add new Department</h2><br>-->
            {!! Form::open(['url'=>'/vehicle/store','method'=>'POST','class'=>'form-horizontal']) !!}
            {{csrf_field()}}

            <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Vehicle No.</label>
            <div class="col-sm-10">
            <input name="vehicle_no" type="text" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Vehicle Type</label>
            <div class="col-sm-10">
                <select class="form-control" name="vehicle_type">
                    <option value="1.2">...Select Vehicle Type... </option>
                    @foreach($vehicle_types as $vehicle_type)
                    <option value="{{$vehicle_type->id}}">{{$vehicle_type->vehicle_type}}</option>
                    @endforeach
                </select>
            </div>
            </div>
            <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Company</label>
            <div class="col-sm-10">
                <select class="form-control" name="company_id">
                    <option value="1.2">...Select Company... </option>
                    @foreach($companies as $company)
                    <option value="{{$company->id}}">{{$company->name}}</option>
                    @endforeach
                </select>
            </div>
            </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Licence No.</label>
            <div class="col-sm-10">
            <input name="licence_no" type="text" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Engine CC</label>
            <div class="col-sm-10">
            <input name="engin_cc" type="text" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Engine NO.</label>
            <div class="col-sm-10">
            <input name="engin_no" type="text" class="form-control" required="">
            </div>
          </div>
          
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Status</label>
            <div class="col-sm-10">
                <select class="form-control" name="is_permitted">
                    <option value="1.2">...Select Status... </option>
                    <option value="1">Permitted</option>
                    <option value="0">Rejected</option>
                </select>
            </div>
          </div><hr>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-block btn-success" name="sub">Save Vehicle</button>
            </div>
          </div>
        {!! Form::close() !!}
        </div>
        </div>
    </div>
</div>
@endsection