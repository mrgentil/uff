@extends('layouts.main')

@section('title') @parent | {{ $post->title }} @endsection

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
                <li><span>Details Actualité</span></li>
            </ul><!-- /.thm-breadcrumb list-unstyled -->
            <h2>{{$post->title}}</h2>
        </div><!-- /.container -->
    </section><!-- /.page-header -->


    <section class="blog-details">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="blog-details__image">
                        <img src="{{$post->image}}" class="img-fluid" alt="">
                    </div><!-- /.blog-details__image -->
                    <div class="blog-card__content">
                        <div class="blog-card__date">{{$post->created_at}}</div><!-- /.blog-card__date -->
                        <div class="blog-card__meta">
                            <a href="{{$post->slug_link}}"><i class="far fa-user-circle"></i> by Admin UFF</a>
                            <a href="{{$post->slug_link}}"><i class="far fa-comments"></i>  {{--{{ count($post->comments) }}--}}</a>
                        </div><!-- /.blog-card__meta -->
                        <h3><a href="{{$post->slug_link}}">{{$post->title}}</a></h3>
                    </div><!-- /.blog-card__content -->
                    <div class="blog-details__content">
                        <p>{!! $post->body !!} </p>
                    </div><!-- /.blog-details__content -->

                   <!-- /.blog-details__meta -->



                    {{--<div class="blog-comment">
                        <h2>2 Comments</h2>
                        <div class="blog-comment__box">
                            <div class="blog-comment__image">
                                <img src="assets/images/blog/comment-1-1.jpg" alt="">
                            </div><!-- /.blog-comment__image -->
                            <div class="blog-comment__content">
                                <h3>Jessica Brown</h3>
                                <p>It has survived not only five centuries, but also the leap into electronic typesetting
                                    unchanged. It was popularised in the sheets If you are going to use a passage of Lorem
                                    Ipsum, you need to be is simply free text.</p>
                                <a href="#" class="thm-btn">Reply</a><!-- /.thm-btn -->
                            </div><!-- /.blog-comment__content -->
                        </div><!-- /.blog-comment__box -->
                        <div class="blog-comment__box">
                            <div class="blog-comment__image">
                                <img src="assets/images/blog/comment-1-2.jpg" alt="">
                            </div><!-- /.blog-comment__image -->
                            <div class="blog-comment__content">
                                <h3>Jessica Brown</h3>
                                <p>It has survived not only five centuries, but also the leap into electronic typesetting
                                    unchanged. It was popularised in the sheets If you are going to use a passage of Lorem
                                    Ipsum, you need to be is simply free text.</p>
                                <a href="#" class="thm-btn">Reply</a><!-- /.thm-btn -->
                            </div><!-- /.blog-comment__content -->
                        </div><!-- /.blog-comment__box -->
                    </div>--}}<!-- /.blog-comment -->
                    {{--<div class="comment-form">
                        <h2>Leave a Comments</h2>

                        <form action="assets/inc/sendemail.php" class="contact-one__form contact-form-validated">
                            <div class="row">
                                <div class="col-lg-6">
                                    <input type="text" name="name" placeholder="Full Name">
                                </div><!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <input type="text" name="email" placeholder="Email Address">
                                </div><!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <input type="text" name="phone" placeholder="Phone Number">
                                </div><!-- /.col-lg-6 -->
                                <div class="col-lg-6">
                                    <input type="text" name="subject" placeholder="Subject">
                                </div><!-- /.col-lg-6 -->
                                <div class="col-lg-12">
                                    <textarea name="message" placeholder="Write Message"></textarea>
                                </div><!-- /.col-lg-12 -->
                                <div class="col-lg-12">
                                    <button type="submit" class="thm-btn">Submit Comment</button><!-- /.thm-btn -->
                                </div><!-- /.col-lg-12 -->
                            </div><!-- /.row -->
                        </form>
                    </div>--}}<!-- /.comment-form -->
                </div><!-- /.col-lg-8 -->
                <div class="col-lg-4">
                    <div class="blog-sidebar">
                        <div class="blog-sidebar__posts">
                            <h3>Articles Récents</h3>
                            <ul>
                                @foreach($lasts as $last)
                                <li>

                                    <span><i class="far fa-comments"></i> 2 Comments
                                        </span>
                                    <h4><a href="{{$last->slug_link}}">{{$last->title}}</a></h4>
                                </li>
                                @endforeach
                            </ul>
                        </div><!-- /.blog-sidebar__posts -->
                    </div><!-- /.blog-sidebar -->
                </div><!-- /.col-lg-4 -->
            </div><!-- /.row -->
        </div><!-- /.container -->
    </section><!-- /.blog-details -->
@endsection

