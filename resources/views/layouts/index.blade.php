@extends('layouts.main')

@section('title') @parent | Accueil @endsection

@section('keywords') @parent, Accueil @endsection

@section('description') Accueil @endsection



@section('content')
    <section class="main-slider">
        <div class="swiper-container thm-swiper__slider" data-swiper-options='{
        "slidesPerView": 1,
        "loop": true,
        "effect": "fade",
        "autoplay": {
            "delay": 5000
        },
        "navigation": {
            "nextEl": "#main-slider__swiper-button-next",
            "prevEl": "#main-slider__swiper-button-prev"
        }
    }'>
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="image-layer" style="background-image: url({{asset('assets/images/main-slider/IMG-20190414-WA0034.jpg')}});">
                    </div>
                    <!-- /.image-layer -->
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-7 col-lg-7">
                                <span class="tagline">Bienvenue à Union des Fonctionnaires Fermiers</span>
                                <span class="tagline">Entreé du Site Kinsiama à impuru</span> <br>

                                {{--<p>There are many of passages of lorem Ipsum, but the majori have <br> suffered alteration
                                    in some form.</p>--}}
                               {{-- <a href="#" class=" thm-btn">Discover More</a>--}}
                                <!-- /.thm-btn dynamic-radius -->
                            </div><!-- /.col-lg-7 text-right -->
                        </div><!-- /.row -->
                    </div><!-- /.container -->
                </div>
                <div class="swiper-slide">
                    <div class="image-layer" style="background-image: url({{asset('assets/images/main-slider/main-slider-1-1.jpg')}});">
                    </div>
                    <!-- /.image-layer -->
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-7 col-lg-7">
                                <span class="tagline">Bienvenue à Union des Fonctionnaires Fermiers</span>
                                <span class="tagline">Sur le Terrain UFF à Kinsiama</span> <br>

                                {{--<p>There are many of passages of lorem Ipsum, but the majori have <br> suffered alteration
                                    in some form.</p>
                                <a href="#" class=" thm-btn">Discover More</a>--}}
                                <!-- /.thm-btn dynamic-radius -->
                            </div><!-- /.col-lg-7 text-right -->
                        </div><!-- /.row -->
                    </div><!-- /.container -->
                </div><!-- /.swiper-slide -->
                <div class="swiper-slide">
                    <div class="image-layer" style="background-image: url({{asset('assets/images/main-slider/main-slider-1-2.jpg')}});">
                    </div>
                    <!-- /.image-layer -->
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-7 col-lg-7">
                                <span class="tagline">Bienvenue à Union des Fonctionnaires Fermiers</span>
                                <span class="tagline">Equipe de la coordination accompagnée du chef coutumier du village Kinsiama</span><br>

                                {{--<p>There are many of passages of lorem Ipsum, but the majori have <br> suffered alteration
                                    in some form.</p>
                                <a href="#" class=" thm-btn">Discover More</a>--}}
                                <!-- /.thm-btn dynamic-radius -->
                            </div><!-- /.col-lg-7 text-right -->
                        </div><!-- /.row -->
                    </div><!-- /.container -->
                </div>
                <div class="swiper-slide">
                    <div class="image-layer" style="background-image: url({{asset('assets/images/main-slider/IMAG0095.JPG')}});">
                    </div>
                    <!-- /.image-layer -->
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-7 col-lg-7">
                                <span class="tagline">Bienvenue à Union des Fonctionnaires Fermiers</span>
                                <span class="tagline">Travaux de la Topographie</span><br>

                                {{--<p>There are many of passages of lorem Ipsum, but the majori have <br> suffered alteration
                                    in some form.</p>
                                <a href="#" class=" thm-btn">Discover More</a>--}}
                                <!-- /.thm-btn dynamic-radius -->
                            </div><!-- /.col-lg-7 text-right -->
                        </div><!-- /.row -->
                    </div><!-- /.container -->
                </div>
                {{--<div class="swiper-slide">
                    <div class="image-layer" style="background-image: url({{asset('assets/images/main-slider/25012014029.jpg')}});">
                    </div>
                    <!-- /.image-layer -->
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-7 col-lg-7">
                                <span class="tagline">Bienvenue à Union des Fonctionnaires Fermiers</span>
                                <h6><span>L'une de végétation</span><br>
                                    </h6>
                            --}}{{--<p>There are many of passages of lorem Ipsum, but the majori have <br> suffered alteration
                                in some form.</p>
                            <a href="#" class=" thm-btn">Discover More</a>--}}{{--
                            <!-- /.thm-btn dynamic-radius -->
                            </div><!-- /.col-lg-7 text-right -->
                        </div><!-- /.row -->
                    </div><!-- /.container -->
                </div>--}}
                <!-- /.swiper-slide -->
            </div><!-- /.swiper-wrapper -->

            <!-- If we need navigation buttons -->
            <div class="main-slider__nav">
                <div class="swiper-button-prev" id="main-slider__swiper-button-next"><i class="agrikon-icon-left-arrow"></i>
                </div>
                <div class="swiper-button-next" id="main-slider__swiper-button-prev"><i class="agrikon-icon-right-arrow"></i></div>
            </div><!-- /.main-slider__nav -->

        </div><!-- /.swiper-container thm-swiper__slider -->
    </section>
    <!-- /.main-slider -->


    <!-- /.service-one -->

    <section class="about-one">
        <img src="{{asset('assets/images/icons/about-bg-icon-1-1.png')}}" class="about-one__bg-shape-1" alt="">
        <div class="container">
            <div class="row">
                <div class="col-lg-5">
                    <div class="about-one__images">
                        <img src="{{asset('assets/images/resources/about-1-1.jpg')}}" alt="">
                        <img src="{{asset('assets/images/resources/about-1-2.jpg')}}" alt="">
                        <div class="about-one__count wow fadeInLeft" data-wow-duration="1500ms">
                            <span>Tryphon KILEK - </span>
                            <h6>K – KILEH</h6>
                        </div><!-- /.about-one__count -->
                    </div><!-- /.about-one__images -->
                </div><!-- /.col-lg-6 -->
                <div class="col-lg-7">
                    <div class="about-one__content">
                        <div class="block-title text-left">
                            <div class="block-title__image"></div><!-- /.block-title__image -->
                            <p>Union des Fonctionnaires Fermiers "UFF"</p>
                            <h5>Est une Organisation Non Gouvernementale en République Démocratique du Congo qui encadre
                            les fonctionnaires de toutes categories (Fonctionnaire public ou privé , Opérateur économique , Confession réligieuse , Artiste ,  etc...) à devenir des Fermiers aux travaux champêtres</h5>
                        </div><!-- /.block-title -->
                        {{--<div class="about-one__tagline">
                            <p>We have 30 years of agriculture & eco farming experience globaly</p>
                        </div>--}}<!-- /.about-one__tagline -->
                        <div class="about-one__summery">
                            <p>
                                créée en juillet  1999 sur initiative de Monsieur Tryphon
                                KILEK - K – KILEH  directeur au sein du ministère de l’Agriculture.
                                Dans le cadre de la politique,  de la promotion, de l’encadrement et
                                de l'orientation des fonctionnaires.  Pour que ceux-ci
                                s’adonnent à l’agriculture afin d’assurer leurs retraites.
                            </p>
                        </div><!-- /.about-one__summery --><!-- /.about-one__icon-row -->
                        <a href={{url('about-us')}} class="thm-btn">Voir +</a><!-- /.thm-btn -->
                    </div><!-- /.about-one__content -->
                </div><!-- /.col-lg-6 -->
            </div><!-- /.row -->
        </div><!-- /.container -->
    </section>
    <!-- /.about-one -->

    <section class="service-two">
        <div class="service-two__bottom-curv"></div><!-- /.service-two__bottom-curv -->
        <div class="container">
            <div class="block-title text-center">
                <div class="block-title__image"></div><!-- /.block-title__image -->
                <p>Nos services</p>
                <h3>Ce que nous offrons</h3>
            </div><!-- /.block-title -->
            <div class="row">
                @foreach($services as $service)
                    <div class="col-sm-12 col-md-6 col-lg-3">
                        <div class="service-two__card">
                            <div class="service-two__card-image">
                                <img src="{{Voyager::image($service->image)}}" alt="{{$service->title}}">
                            </div><!-- /.service-two__card-image -->
                            <div class="service-two__card-content">
                                <div class="service-two__card-icon">
                                    <i class="agrikon-icon-tractor"></i>
                                </div><!-- /.service-two__card-icon -->
                                <h3><a href="{{$service->slug_link}}">{{$service->title}}</a></h3>
                                <p>{!! Str::limit($service->excerpt,60) !!}</p>
                            </div><!-- /.service-two__card-content -->
                        </div><!-- /.service-two__card -->
                    </div><!-- /.col-sm-12 col-md-6 col-lg-3 -->
                @endforeach
            </div><!-- /.row -->
        </div><!-- /.container -->
    </section>
    <!-- /.service-two -->

    <div class="projects-one project-one__home-one">
        <div class="container">
            <div class="block-title text-center">
                <div class="block-title__image"></div><!-- /.block-title__image -->
                <h3>Projets & Réalisations</h3>
            </div><!-- /.block-title -->
            <div class="thm-swiper__slider swiper-container" data-swiper-options='{"spaceBetween": 0, "slidesPerView": 1, "loop": true, "slidesPerGroup": 1, "pagination": {
            "el": "#projects-one__swiper-pagination",
            "type": "bullets",
            "clickable": true
        },
        "breakpoints": {
            "0": {
                "spaceBetween": 0,
                "slidesPerView": 1,
                "slidesPerGroup": 1
            },
            "640": {
                "spaceBetween": 30,
                "slidesPerView": 2,
                "slidesPerGroup": 2
            },
            "992": {
                "spaceBetween": 30,
                "slidesPerView": 2,
                "slidesPerGroup": 2
            }
        }}'>
                <div class="swiper-wrapper">
                    @foreach($projets as $projet)
                    <div class="swiper-slide">
                        <div class="projects-one__single">
                            <img src="{{Voyager::image($projet->image)}}" alt="">
                            <div class="projects-one__content">
                                <h3>{{$projet->title}}</h3>
                                <a href="{{$projet->slug_link}}" class="projects-one__button"><i class="agrikon-icon-right-arrow"></i></a><!-- /.projects-one__button -->
                            </div><!-- /.projects-one__content -->
                        </div><!-- /.projects-one__single -->
                    </div><!-- /.swiper-slide -->
                    @endforeach
                </div><!-- /.swiper-wrapper -->
                <div class="swiper-pagination" id="projects-one__swiper-pagination"></div>
            </div><!-- /.swiper-container -->
        </div><!-- /.container -->
    </div>
    <!-- /.projects-one -->


    <!-- /.call-to-action__three -->

    <section class="testimonials-one">
        <img src="assets/images/icons/testimonials-bg-1-1.png" class="testimonials-one__bg" alt="">
        <div class="container">
            <h2 class="testimonials-one__title">Témoignages</h2>
            <div id="testimonials-one__carousel" class="testimonials-one__carousel swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="testimonials-one__icons">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div><!-- /.testimonials-one__icons -->
                        <p>Cela est dû à leur excellent service, à leurs prix compétitifs et à leur assistance à la clientèle. C'est très
                            rafraîchissant d'obtenir une telle touche personnelle.</p>
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <div class="testimonials-one__icons">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div><!-- /.testimonials-one__icons -->
                        <p>Cela est dû à leur excellent service, à leurs prix compétitifs et à leur assistance à la clientèle. C'est très
                            rafraîchissant d'obtenir une telle touche personnelle.</p>
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <div class="testimonials-one__icons">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div><!-- /.testimonials-one__icons -->
                        <p>Cela est dû à leur excellent service, à leurs prix compétitifs et à leur assistance à la clientèle. C'est très
                            rafraîchissant d'obtenir une telle touche personnelle.</p>
                    </div><!-- /.swiper-slide -->
                </div><!-- /.swiper-wrapper -->
            </div><!-- /#testimonials-one__carousel -->

            <div id="testimonials-one__thumb" class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="testimonials-one__image">
                            <img src="{{asset('assets/images/resources/testimonials-1-1.jpg')}}" alt="">
                        </div><!-- /.testimonials-one__image -->
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <div class="testimonials-one__image">
                            <img src="{{asset('assets/images/resources/testimonials-1-2.jpg')}}" alt="">
                        </div><!-- /.testimonials-one__image -->
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <div class="testimonials-one__image">
                            <img src="{{asset('assets/images/resources/testimonials-1-3.jpg')}}" alt="">
                        </div><!-- /.testimonials-one__image -->
                    </div><!-- /.swiper-slide -->
                </div><!-- /.swiper-wrapper -->
            </div><!-- /#testimonials-one__thumb.swiper-container -->

            <div id="testimonials-one__meta" class="testimonials-one__carousel swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="testimonials-one__meta">
                            <h4>IPONO</h4>
                            <span>Fermier</span>
                        </div><!-- /.testimonials-one__meta -->
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <div class="testimonials-one__meta">
                            <h4>ANNIE</h4>
                            <span>Fermière</span>
                        </div><!-- /.testimonials-one__meta -->
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <div class="testimonials-one__meta">
                            <h4>ARNOLD</h4>
                            <span>Fermier</span>
                        </div><!-- /.testimonials-one__meta -->
                    </div><!-- /.swiper-slide -->
                </div><!-- /.swiper-wrapper -->
            </div><!-- /#testimonials-one__meta.swiper-container -->
            <div class="swiper-pagination" id="testimonials-one__swiper-pagination"></div>
        </div><!-- /.container -->
    </section>
    <!-- /.testimonials-one -->


    <!-- /.gray-boxed-wrapper -->

    <section class="contact-two">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-5">
                    <div class="contact-two__image">
                        <div class="contact-two__image-bubble-1"></div><!-- /.contact-two__image-bubble-1 -->
                        <div class="contact-two__image-bubble-2"></div><!-- /.contact-two__image-bubble-2 -->
                        <div class="contact-two__image-bubble-3"></div><!-- /.contact-two__image-bubble-3 -->
                        <img src="assets/images/resources/contact-1-1.jpg" class="img-fluid" alt="">
                    </div><!-- /.contact-two__image -->
                </div><!-- /.col-sm-12 col-md-12 col-lg-12 col-xl-5 -->
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-3">
                    <div class="contact-two__content">
                        <div class="block-title">
                            <div class="block-title__image"></div><!-- /.block-title__image -->
                            <p>Contact</p>
                            <h3>Laisser nous un messafe</h3>
                        </div><!-- /.block-title -->
                    </div><!-- /.contact-two__content -->
                </div><!-- /.col-sm-12 col-md-12 col-lg-12 col-xl-4 -->
                <div class="col-sm-12 col-md-12 col-lg-12 col-xl-4">
                    <form action="assets/inc/sendemail.php" class="contact-one__form contact-form-validated">
                        <div class="row">
                            <div class="col-lg-12">
                                <input type="text" name="name" placeholder="Nom complet">
                            </div><!-- /.col-lg-6 -->
                            <div class="col-lg-12">
                                <input type="text" name="email" placeholder="Email Address">
                            </div><!-- /.col-lg-6 -->
                            <div class="col-lg-12">
                                <input type="text" name="phone" placeholder="Télephone">
                            </div><!-- /.col-lg-6 -->
                            <div class="col-lg-12">
                                <textarea name="message" placeholder="Contenu de message"></textarea>
                            </div><!-- /.col-lg-12 -->
                            <div class="col-lg-12">
                                <button type="submit" class="thm-btn">Envoyer</button><!-- /.thm-btn -->
                            </div><!-- /.col-lg-12 -->
                        </div><!-- /.row -->
                    </form>
                </div><!-- /.col-sm-12 col-md-12 col-lg-12 col-xl-4 -->
            </div><!-- /.row -->
        </div><!-- /.container -->
    </section>
    <!-- /.contact-two -->
    <div class="client-carousel client-carousel__has-border-top">
        <div class="container">
            <div class="thm-swiper__slider swiper-container" data-swiper-options='{"spaceBetween": 140, "slidesPerView": 5, "autoplay": { "delay": 5000 }, "breakpoints": {
                "0": {
                    "spaceBetween": 30,
                    "slidesPerView": 2
                },
                "375": {
                    "spaceBetween": 30,
                    "slidesPerView": 2
                },
                "575": {
                    "spaceBetween": 30,
                    "slidesPerView": 3
                },
                "767": {
                    "spaceBetween": 50,
                    "slidesPerView": 4
                },
                "991": {
                    "spaceBetween": 50,
                    "slidesPerView": 5
                },
                "1199": {
                    "spaceBetween": 100,
                    "slidesPerView": 5
                }
            }}'>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-1.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-2.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-3.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-1.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-2.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-3.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-1.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-2.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-3.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-1.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-2.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-3.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-1.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-2.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-3.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-1.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-2.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-3.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                </div><!-- /.swiper-wrapper -->
            </div><!-- /.thm-swiper__slider -->
        </div><!-- /.container -->
    </div>
@endsection
