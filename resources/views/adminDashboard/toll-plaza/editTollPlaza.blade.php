@extends('adminDashboard.master')

@section('title')
    Edit Toll Plaza
@endsection

@section('mainContent')

<br>
<div id="page-wrapper"><br>
    <h3 class="text-center text-primary"> Edit Toll Plaza</h3>
<div class="row">
        <div class="col-lg-12">
            <h5 class="text-center text-success">{{Session::get('message')}}</h5>     

        <div class="well">
            {!! Form::open(['url'=>'/toll-plaza/update','method'=>'POST','class'=>'form-horizontal','name'=>'tollPlazaEditForm']) !!}
            {{csrf_field()}}

            <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Toll Plaza Name</label>
            <div class="col-sm-10">
            <input name="name" value="{!!$toll_plaza->name!!}" type="text" class="form-control" required="">
            <input name="id" value="{!!$toll_plaza->id!!}" type="hidden" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Location</label>
            <div class="col-sm-10">
            <input name="location" value="{!!$toll_plaza->location!!}" type="text" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">District</label>
            <div class="col-sm-10">
            <input name="district" value="{!!$toll_plaza->district!!}" type="text" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Phone</label>
            <div class="col-sm-10">
            <input name="phone" value="{!!$toll_plaza->phone!!}" type="text" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Operator</label>
            <div class="col-sm-10">
            <input name="operator" value="{!!$toll_plaza->operator!!}" type="text" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">IMEI No.</label>
            <div class="col-sm-10">
            <input name="imei" value="{!!$toll_plaza->imei!!}" type="text" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Toll Price</label>
            <div class="col-sm-10">
            <input name="toll_amount" value="{!!$toll_plaza->toll_amount!!}" type="text" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Toll Type</label>
            <div class="col-sm-10">
                <select class="form-control" name="toll_type">
                    <option value="1.2">...Select Toll Type... </option>
                    <option value="1">Bridge</option>
                    <option value="2">Flyover</option>
                    <option value="3">Other</option>
                </select>
            </div>
          </div>
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

<script>
        document.forms['tollPlazaEditForm'].elements['toll_type'].value={{$toll_plaza->toll_type}}
</script>

@endsection