@extends('layouts.main')

@section('title') @parent | {{ $projet->title }} @endsection

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
                <li><span>Details du projet</span></li>
            </ul><!-- /.thm-breadcrumb list-unstyled -->
            <h2>{{$projet->title}}</h2>
        </div><!-- /.container -->
    </section><!-- /.page-header -->

    <section class="project-details">
        <div class="container">
            <img src="{{Voyager::image($projet->image)}}" class="img-fluid" alt="{{$projet->title}}">
            <h2>{{$projet->title}}</h2>
            <p>
                {!! $projet->description !!}
            </p>
        </div><!-- /.container -->
    </section><!-- /.project-details -->
@endsection

