<!DOCTYPE html>
<html>
<head>
    <title>@yield('title')</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <header class="text-center">
        <img src="{{ asset('images/banner_sach.jpg') }}" width="1000px">
    </header>

    <div class="container mt-4">
        @yield('content')
    </div>

    <footer class="bg-light mt-5 py-3">
        <div class="row text-center">
            <div class="col-4">TRỤ SỞ</div>
            <div class="col-4">THÔNG TIN CHUNG</div>
            <div class="col-4">BẢN ĐỒ</div>
        </div>
    </footer>
</body>
</html>