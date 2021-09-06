@extends('layouts.main')

@section('title') @parent | News @endsection

@section('keywords') @parent, News @endsection

@section('description') News @endsection



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
                <li><span>Actualités</span></li>
            </ul><!-- /.thm-breadcrumb list-unstyled -->
            <h2>Les Actualités  de UFF</h2>
        </div><!-- /.container -->
    </section><!-- /.page-header -->

    <section class="blog-grid"d>
        <div class="container">
            <div class="row">
                @foreach($posts as $post)
                <div class="col-md-6 col-lg-4">
                    <div class="blog-card">
                        <div class="blog-card__image">
                            <img src="{{$post->image}}" alt="{{$post->title}}">
                            <a href="{{$post->slug_link}}"></a>
                        </div><!-- /.blog-card__image -->
                        <div class="blog-card__content">
                            <div class="blog-card__date">{{ $post->created_at }}</div><!-- /.blog-card__date -->
                            <div class="blog-card__meta">
                                <a href="{{$post->slug_link}}"><i class="far fa-user-circle"></i>Admin UFF</a>
                                <a href="{{$post->slug_link}}"><i class="far fa-comments"></i> {{--2 Comments--}}</a>
                            </div><!-- /.blog-card__meta -->
                            <h3><a href="{{$post->slug_link}}">{{Str::limit($post->title,30)}}</a></h3>
                            <a href="{{$post->slug_link}}" class="thm-btn">Voir +</a><!-- /.thm-btn -->
                        </div><!-- /.blog-card__content -->
                    </div><!-- /.blog-card -->
                </div><!-- /.col-md-6 col-lg-4 -->
                @endforeach
            </div><!-- /.row -->
            <!-- /.text-center -->
        </div><!-- /.container -->
    </section><!-- /.blog-grid -->
@endsection
