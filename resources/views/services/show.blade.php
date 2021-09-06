@extends('layouts.main')

@section('title') @parent | {{ $service->title }} @endsection

@section('description')
    {{ setting('site.description') }}
@endsection

@section('content')
    <div class="stricky-header stricked-menu main-menu">
        <div class="sticky-header__content"></div><!-- /.sticky-header__content -->
    </div><!-- /.stricky-header -->
    <section class="page-header">
        <div class="page-header__bg" style="background-image: url({{asset('assets/images/backgrounds/page-header-bg-1-1.jpg')}});"></div>
        <!-- /.page-header__bg -->
        <div class="container">
            <ul class="thm-breadcrumb list-unstyled">
                <li><a href="{{url('/')}}">Accueil</a></li>
                <li>/</li>
                <li><span>Details Service</span></li>
            </ul><!-- /.thm-breadcrumb list-unstyled -->
            <h2>{{$service->title}}</h2>
        </div><!-- /.container -->
    </section><!-- /.page-header -->


    <section class="service-details">
        <div class="container">
            <div class="row">

                <div class="col-lg-12">
                    <img src="{{Voyager::image($service->image)}}" alt="{{$service->title}}">
                    <h2>{{$service->title}}</h2>
                    <p>{!! $service->description !!}</p>
                </div><!-- /.col-lg-8 -->
            </div><!-- /.row -->
        </div><!-- /.container -->
    </section><!-- /.service-details -->
@endsection

