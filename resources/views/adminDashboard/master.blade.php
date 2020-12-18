<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>@yield('title') - Toll Management System</title>

    <!-- Bootstrap Core CSS -->
    <link href="{{asset('/admin/')}}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="{{asset('/admin/')}}/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="{{asset('/admin/')}}/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- select2 -->
    <!-- <link href="{{asset('/public/select2/select2.min.css')}}" rel="stylesheet"> -->

    <!-- Morris Charts CSS -->
    <link href="{{asset('/admin/')}}/vendor/morrisjs/morris.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <!-- Custom Fonts -->
    <!-- <link rel="icon" href="{{asset('/public/admin/images/educationIcon.png')}}"> -->
    <!-- <script src="{{asset('/public/admin/tinymce/js/tinymce/tinymce.min.js')}}"></script> -->
    <!-- <script>tinymce.init({ selector:'textarea' });</script> -->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        @include('adminDashboard.includes.header')
        @include('adminDashboard.includes.menu')
        

        
        @yield('mainContent')
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <!-- <script src="{{asset('/public/admin/')}}/vendor/jquery/jquery.min.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="{{asset('/admin/')}}/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="{{asset('/admin/')}}/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="{{asset('/public/admin/')}}/vendor/raphael/raphael.min.js"></script>
    <script src="{{asset('/public/admin/')}}/vendor/morrisjs/morris.min.js"></script>
    <script src="{{asset('/public/admin/')}}/data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="{{asset('/admin/')}}/dist/js/sb-admin-2.js"></script>
    <!-- select2 -->
    <!-- <script src="{{asset('/public/select2/select2.min.js')}}"></script> -->
    <!-- <script type="text/javascript">
$(".js-example-basic-multiple").select2();
</script> -->
@yield('scripts')

</body>

</html>
