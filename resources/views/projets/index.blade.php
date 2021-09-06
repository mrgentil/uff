@extends('layouts.main')

@section('title') @parent | Nos Projets @endsection

@section('keywords') @parent, Nos Projets @endsection

@section('description') Nos Projets @endsection



@section('content')
    <div class="stricky-header stricked-menu main-menu">
        <div class="sticky-header__content"></div><!-- /.sticky-header__content -->
    </div><!-- /.stricky-header -->
    <section class="page-header">
        <div class="page-header__bg" style="background-image: url(assets/images/backgrounds/page-header-bg-1-1.jpg);"></div>
        <!-- /.page-header__bg -->
        <div class="container">
            <ul class="thm-breadcrumb list-unstyled">
                <li><a href="{{url('/')}}">Accueil</a></li>
                <li>/</li>
                <li><span>Projets</span></li>
            </ul><!-- /.thm-breadcrumb list-unstyled -->
            <h2>Nos Projets</h2>
        </div><!-- /.container -->
    </section><!-- /.page-header -->

    <div class="projects-one">
        <div class="container">
            <div class="row">
                @foreach($projets as $projet)
                <div class="col-sm-12 col-md-6 col-lg-4">
                    <div class="projects-one__single">
                        <img src="{{Voyager::image($projet->image)}}" alt="">
                        <div class="projects-one__content">
                            <h5>{{$projet->title}}</h5>
                            <a href="{{$projet->slug_link}}" class="projects-one__button"><i class="agrikon-icon-right-arrow"></i></a><!-- /.projects-one__button -->
                        </div><!-- /.projects-one__content -->
                    </div><!-- /.projects-one__single -->
                </div><!-- /.col-sm-12 -->
                @endforeach
            </div><!-- /.row -->
        </div><!-- /.container -->
    </div><!-- /.projects-one -->
@endsection
