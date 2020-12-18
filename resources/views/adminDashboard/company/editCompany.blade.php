@extends('adminDashboard.master')

@section('title')
    Edit Company
@endsection

@section('mainContent')

<br>
<div id="page-wrapper"><br>
    <h3 class="text-center text-primary"> Edit Company</h3>
<div class="row">
        <div class="col-lg-12">
            <h5 class="text-center text-success">{{Session::get('message')}}</h5>     

        <div class="well">
            <!--<h2 class="text-center text-success">Fill this form up to add new Department</h2><br>-->
            {!! Form::open(['url'=>'/company/update','method'=>'POST','class'=>'form-horizontal','name'=>'editCompanyForm']) !!}
            {{csrf_field()}}

            <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">{!!$company->name!!}</label>
            <div class="col-sm-10">
            <input name="name" value="{!!$company->name!!}" type="text" class="form-control" required="" >
            <input name="id" value="{!!$company->id!!}" type="hidden" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Phone No.</label>
            <div class="col-sm-10">
            <input name="phone" value="{!!$company->phone!!}" type="text" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
            <div class="col-sm-10">
            <input name="email" value="{!!$company->email!!}" type="email" class="form-control" required="">
            </div>
          </div>
          <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">Company Address</label>
            <div class="col-sm-10">
                <textarea name="address" class="form-control" >{!!$company->address!!}</textarea>
            </div>
          </div><hr>
          <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">Publication Status</label>
            <div class="col-sm-10">
                <select class="form-control" name="is_published">
                    <option>...Select Publication Status... </option>
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


<script>
        document.forms['editCompanyForm'].elements['is_published'].value={{$company->is_published}}
</script>

@endsection