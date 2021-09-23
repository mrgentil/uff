<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <meta name="description" content="@yield('description')"/>
    <meta name="keywords" content="@section ('keywords') Union de Fonctionnaires Fermiers @show"/>

    <meta name="language" content="fr"/>
    <meta name="copyright" content="//uff-rdc.com"/>
    <meta name="author" content="uff-rdc.com"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="#78AB4E"/>
    <meta property="og:title" content="@section('title') {{ config('app.name') }} @show"/>
    <meta property="og:site_name" content="{{ config('app.name')  }}"/>
    <meta property="og:url" content="{{ Request::url() }}"/>
    <meta property="og:language" content="{{ app()->getLocale() }}"/>
    <meta property="og:description" content="@yield('description')"/>
    <meta property="og:image" content="@section ('site.logo'){{ asset('images/preview-image.jpg') }}@show"/>

    <!-- Schema.org meta pour Google+ -->
    <meta itemprop="name" content="@section('title') {{ config('app.name') }} @show">
    <meta itemprop="description" content="@yield('description')">
    <meta itemprop="image" content="@section ('meta-image'){{  asset('images/preview-image.jpg') }}@show">

    <!-- Card meta pour Twitter -->
    <meta name="twitter:card" content="@section ('meta-image'){{  asset('images/preview-image.jpg') }}@show">
    <meta name="twitter:site" content="@UFF-RDC">
    <meta name="twitter:title" content="@section('title') {{ config('app.name') }} @show">
    <meta name="twitter:description" content="@yield('description')">
    <!-- Twitter summary card avec image large de 280x150px -->
    <meta name="twitter:image:src" content="@section ('meta-image'){{  asset('images/preview-image.jpg') }}@show">
    <title>@section('title'){{ config('app.name') }} @show</title>
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

@stack('css')
    <!-- favicons Icons -->
    <link rel="apple-touch-icon" sizes="180x180" href="{{asset('assets/images/favicons/apple-touch-icon.png')}}">
    <link rel="icon" type="image/png" sizes="32x32" href="{{asset('assets/images/favicons/favicon-32x32.png')}}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{asset('assets/images/favicons/favicon-16x16.png')}}">
    <link rel="manifest" href="{{asset('assets/images/favicons/site.webmanifest')}}">
    <meta name="description" content="Unions des Fonctionnaires Fermiers">
    <!-- fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Handlee&family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{asset('assets/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/css/fontawesome-all.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/css/swiper.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/css/animate.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/css/odometer.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/css/jarallax.css')}}">
    <link rel="stylesheet" href="{{asset('assets/css/magnific-popup.css')}}">
    <link rel="stylesheet" href="{{asset('assets/css/bootstrap-select.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/css/agrikon-icons.css')}}">
    <link rel="stylesheet" href="{{asset('assets/css/nouislider.min.css')}}">
    <link rel="stylesheet" href="{{asset('assets/css/nouislider.pips.css')}}">
    <!-- template styles -->
    <link rel="stylesheet" href="{{asset('assets/css/main.css')}}">
</head>

<body>
<div class="preloader">
    <img class="preloader__image" width="55" src="{{asset('assets/images/loader.png')}}" alt="">
</div><!-- /.preloader -->
<div class="page-wrapper">

    @include('partials.nav')
    <!-- /.main-header -->

    <div class="stricky-header stricked-menu main-menu">
        <div class="sticky-header__content"></div><!-- /.sticky-header__content -->
    </div><!-- /.stricky-header -->

        @yield('content')
        <!-- /.client-carousel -->
        @include('partials.footer')
        <!-- /.site-footer -->
    <div class="bottom-footer">
        <div class="container">
            <p>© Copyright {{date('Y')}} by MrGentil</p><!-- /.bottom-footer__links -->
        </div><!-- /.container -->
    </div><!-- /.bottom-footer -->

</div><!-- /.page-wrapper -->


<div class="mobile-nav__wrapper">
    <div class="mobile-nav__overlay mobile-nav__toggler"></div>
    <!-- /.mobile-nav__overlay -->
    <div class="mobile-nav__content">
        <span class="mobile-nav__close mobile-nav__toggler"><i class="far fa-times"></i></span>

        <div class="logo-box">
            <a href="{{url('/')}}" aria-label="logo image"><img src="{{asset('assets/images/logo-light.png')}}" width="155" alt="" /></a>
        </div>
        <!-- /.logo-box -->
        <div class="mobile-nav__container"></div>
        <!-- /.mobile-nav__container -->

        <ul class="mobile-nav__contact list-unstyled">
            <li>
                <i class="agrikon-icon-email"></i>
                <a href="mailto:contact@uffrdc.org">contact@uffrdc.org</a>
            </li>
            <li>
                <i class="agrikon-icon-telephone"></i>
                <a href="tel:+243812194894">+243812194894</a>
            </li>
        </ul><!-- /.mobile-nav__contact -->
        <!-- /.mobile-nav__top -->



    </div>
    <!-- /.mobile-nav__content -->
</div>
<!-- /.mobile-nav__wrapper -->

<div class="search-popup">
    <div class="search-popup__overlay search-toggler"></div>
    <!-- /.search-popup__overlay -->
    <div class="search-popup__content">
        <form action="#">
            <label for="search" class="sr-only">search here</label><!-- /.sr-only -->
            <input type="text" id="search" placeholder="Search Here..." />
            <button type="submit" aria-label="search submit" class="thm-btn">
                <i class="fa fa-search"></i>
            </button>
        </form>
    </div>
    <!-- /.search-popup__content -->
</div>
<!-- /.search-popup -->

<a href="#" data-target="html" class="scroll-to-target scroll-to-top"><i class="fa fa-angle-up"></i></a>

@stack('script')
<script src="{{asset('assets/js/jquery-3.5.1.min.js')}}"></script>
<script src="{{asset('assets/js/bootstrap.bundle.min.js')}}"></script>
<script src="{{asset('assets/js/swiper.min.js')}}"></script>
<script src="{{asset('assets/js/jquery.ajaxchimp.min.js')}}"></script>
<script src="{{asset('assets/js/jquery.magnific-popup.min.js')}}"></script>
<script src="{{asset('assets/js/jquery.validate.min.js')}}"></script>
<script src="{{asset('assets/js/bootstrap-select.min.js')}}"></script>
<script src="{{asset('assets/js/wow.js')}}"></script>
<script src="{{asset('assets/js/odometer.min.js')}}"></script>
<script src="{{asset('assets/js/jquery.appear.min.js')}}"></script>
<script src="{{asset('assets/js/jarallax.min.js')}}"></script>
<script src="{{asset('assets/js/circle-progress.min.js')}}"></script>
<script src="{{asset('assets/js/wNumb.min.js')}}"></script>
<script src="{{asset('assets/js/nouislider.min.js')}}"></script>
<!-- template js -->
<script src="{{asset('assets/js/theme.js')}}"></script>
</body>
</html>
