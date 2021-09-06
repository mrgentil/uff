@extends('layouts.main')

@section('title') @parent | UFF @endsection

@section('keywords') @parent, UFF @endsection

@section('description') UFF @endsection



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
                <li><span>A propos de nous</span></li>
            </ul><!-- /.thm-breadcrumb list-unstyled -->
            <h2>Union des Fonctionnaires Fermiers</h2>
        </div><!-- /.container -->
    </section><!-- /.page-header -->


    <section class="service-details">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <img src="{{asset('assets/images/services/service-d-1-1.jpg')}}" alt="">
                    <h5>Tryphon
                        KILEK - K – KILEH</h5>
                    <h2>L’U.F.F?</h2>
                    <p>créée en juillet  1999 sur initiative de Monsieur Tryphon
                        KILEK - K – KILEH  directeur au sein du ministère de l’Agriculture.
                        Dans le cadre de la politique,  de la promotion, de l’encadrement et
                        de l'orientation des fonctionnaires.  Pour que ceux-ci
                        s’adonnent à l’agriculture afin d’assurer leurs retraites. <br>
                        Actuellement l’union des fonctionnaires fermiers est dirigée par ingénieur Arnold ASSEK OTSHOK. Le nouveau président.
                        <img src="{{asset('assets/images/services/b.jpg')}}" alt="">
                        <h5>Ir Arnold ASSEK OTSHOK</h5>
                    </p>
                    <h2>Mission de l’U.F.F</h2>
                    <p>
                            <li>Etendre  U.F.F à travers  le pays RDC pour  une planification des activités et  la production agricole;</li>
                            <li>Chercher le fond pour entreprendre les activités agricoles de membres;</li>
                            <li>Entretenir des liens permanents et consolider le partenariat avec les services public de l’Etat Congolais ,</li>
                            <li>Encourager et soutenir  l’initiation de coopération et mutuelles entre le membres.</li>
                            <li>participer et encourager toute les initiatives  tendant à développer les activités agricoles,  forestières, écologiques  … en RDC</li>
                            <li>Défendre les intérêt de membres de l’U.F.F et le regrouper en bloc d’activité.</li>
                    </p>
                    <h2>Finalité</h2>
                    <p>
                        Vise, par ses actions, le relèvement du niveau de vie des membres, l’amélioration du revenu de ceux-ci, l’accès facile aux services sociaux des qualités.
                    </p>
                    <h2>Objectifs</h2>
                    <p>
                        <li> Promouvoir les activités d’agroforesterie,  d’agro-écologie afin de diminuer le déficit alimentaire en République Démocratique du Congo  et participer à la lutte contre le réchauffement climatique;</li>
                        <li>Accompagner, soutenir et renforcer la capacité de la production agricole des membres de l’U.F.F, en vue d’approvisionner le pays en denrées alimentaires ;</li>
                        <li>Organiser les services communs permettant aux membres de l’UFF, d’exploiter leurs concessions agricoles de manière rationnelle, efficace et rentable</li>
                    </p>
                    <h2>Stratégie</h2>
                    <p>
                        Animation — Formation — Action à la base
                        Il s’agit de cheminer avec nos partenaires par l’animation — formation vers une appropriation de leur contexte et la co-recherche des solutions.
                        Il s’agit en outre, d’accompagner nos actions par un appui matériel qui déclenche l’action, souvent bloquée par le problème de moyens minimums pour mener

                    </p>
                    <h2>Structure</h2>
                    <p>
                        La structure de l’U.F.F se présente comme suit: Assemblée Générale, Comité directeur,  Collège de fondateurs, Collège de commissaires au compte et cellule de base.
                        <br>
                        <br>

                        <li>
                        L’Assemblée Générale est l’organe suprême qui est composé de tous le membre effectifs et fondateurs  elle est présidée par le président du Comité directeur ;
                    </li>
                    <li>Le Comité directeur est l’organe des gestions quotidiennes ;</li>
                    <li>La Collège de fondateurs  est composé de toutes les personnes qui ont contribuent à la création de l’U.F.F elle exerce une autorité morale sur les autres membres ;</li>
                    <li>Collège de commissaires au compte </li>
                    <li>Cellule de base est l’entité administrative décentralisée au niveau provinciale et sous cellule de base, l’entité administrative décentralisée au niveau territoriale </li>
                    </p>
                    <h2>Structure de contrôle</h2>
                    <p>
                        <li>Section finance : constituée par les auditeurs financiers;</li>
                        <li>Section administratifs : composé des inspecteurs administratifs, organisé chaque fin de la période culturale ou à la fin de chaque opération pour le contrôle techniques </li>
                    </p>
                    <h2>Coordination ou Présidence</h2>
                    <p>
                        Est subdivisée en trois 4 départements qui sont : <br>
                        <br>
                        <li>Département Technique : avec  4 services qui sont : </li>
                            - Service agricultures <br><br>
                            - Service foresteries <br><br>
                            - Service  élevages <br><br>
                            - Service formation et vulgarisation <br><br>

                    <li> Département Administratif et finance : avec 2 services qui sont : </li>
                            - Service administratif <br><br>
                            - Service finances <br><br>
                    <li> Département Infrastructure et logistique: avec 3 services qui sont : </li>
                        - Service infrastructures <br><br>
                        - Service garages <br><br>
                        - Service Electricité <br><br>
                    <li>département genre et santé : avec 2 services qui sont :</li>
                         - Service Genre <br><br>
                         - service Santé <br><br>
                    </p>
                    <h2>
                        Domaines d’intervention
                    </h2>
                    <p>
                        DEVELOPPEMENT COMMUNAUTAIRE :<br><br>
                        <li>Habitat et environnement</li>
                        <li>Educations</li>
                        <li>Agro-écologie</li>
                       <li>Agroforesterie </li>
                       <li>Assainissements</li>
                       <li>Route de dessertes agricoles</li>
                       <li>Santé communautaire</li>
                        <li>Education à la citoyenneté</li>
                        <li>VIH/Sida</li>
                    </p>
                    <h2>Partenaires</h2>
                    <p>
                        <li>Membre de l’UFF</li>
                        <li>Paysans regroupés en organisation paysannes</li>
                        <li>Gouvernement de la RDC</li>
                        <li>Partenaires extérieurs volontaires</li>
                    </p>
                    <h2>Sites d’exploitations</h2>
                    <p>
                        <li>Kinshasa plateau Bateke 4.000 hectares.</li>
                        <li>Kwilu :</li>
                            - Kikwit : 5.000 Ha <br><br>
                            - Idiofa  : 10.000 Ha <br><br>
                    <li>Kasai 3.000 Hectares</li>
                    </p>
                </div><!-- /.col-lg-8 -->
            </div><!-- /.row -->
        </div><!-- /.container -->
    </section><!-- /.service-details -->

    <div class="client-carousel client-carousel__has-border-top client-carousel__about-page">
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
                        <img src="{{asset('assets/images/resources/brand-1-1.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-1.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-1.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="{{asset('assets/images/resources/brand-1-1.png')}}" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="assets/images/resources/brand-1-1.png" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="assets/images/resources/brand-1-1.png" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="assets/images/resources/brand-1-1.png" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="assets/images/resources/brand-1-1.png" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="assets/images/resources/brand-1-1.png" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="assets/images/resources/brand-1-1.png" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="assets/images/resources/brand-1-1.png" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="assets/images/resources/brand-1-1.png" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="assets/images/resources/brand-1-1.png" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="assets/images/resources/brand-1-1.png" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="assets/images/resources/brand-1-1.png" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="assets/images/resources/brand-1-1.png" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="assets/images/resources/brand-1-1.png" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="assets/images/resources/brand-1-1.png" alt="">
                    </div><!-- /.swiper-slide -->
                    <div class="swiper-slide">
                        <img src="assets/images/resources/brand-1-1.png" alt="">
                    </div><!-- /.swiper-slide -->
                </div><!-- /.swiper-wrapper -->
            </div><!-- /.thm-swiper__slider -->
        </div><!-- /.container -->
    </div><!-- /.client-carousel -->
@endsection
