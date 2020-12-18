@extends('adminDashboard.master')

@section('title')
    Add Company
@endsection

@section('mainContent')

<br>
<div id="page-wrapper"><br>
    <h3 class="text-center text-primary"> Add Company</h3>
<div class="row">
        <div class="col-lg-12">
            <h5 class="text-center text-success">{{Session::get('message')}}</h5>     

        <div class="well">
            <!--<h2 class="text-center text-success">Fill this form up to add new Department</h2><br>-->
            {!! Form::open(['url'=>'/company/store','method'=>'POST','class'=>'form-horizontal']) !!}
            {{csrf_field()}}

            <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Company Name</label>
            <div class="col-sm-10">
            <input name="name" type="text" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Phone No.</label>
            <div class="col-sm-10">
            <input name="phone" type="text" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
            <div class="col-sm-10">
            <input name="email" type="email" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Company Address</label>
            <div class="col-sm-10">
                <textarea name="address" class="form-control" ></textarea>
            </div>
          </div><hr>
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Status</label>
            <div class="col-sm-10">
                <select class="form-control" name="is_published">
                    <option value="1.2">...Select Status... </option>
                    <option value="1">Published</option>
                    <option value="0">Unpublished</option>
                </select>
            </div>
          </div><hr>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-block btn-success" name="sub">Save Company</button>
            </div>
          </div>
        {!! Form::close() !!}
        </div>
        </div>
    </div>
</div>

@endsection