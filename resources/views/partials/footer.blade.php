<footer class="site-footer">
    <img src="{{asset('assets/images/icons/footer-bg-icon-1.png')}}" class="site-footer__shape-1" alt="">
    <img src="{{asset('assets/images/icons/footer-bg-icon-2.png')}}" class="site-footer__shape-2" alt="">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-4">
                <div class="footer-widget">
                    <a href="{{url('/')}}" class="footer-widget__Logo">
                        <img src="{{asset('assets/images/logo-light.png')}}" width="153" alt="">
                    </a>
                    <p>There are many variations of passages of lorem ipsum available, but the majority suffered.
                    </p>

                    <div class="mc-form__response"></div><!-- /.mc-form__response -->
                    <div class="footer__social">
                        <a href="#" class="fab fa-facebook-square"></a>
                        <a href="#" class="fab fa-twitter"></a>
                        <a href="#" class="fab fa-pinterest-p"></a>
                        <a href="#" class="fab fa-instagram"></a>
                    </div><!-- /.topbar__social -->
                </div><!-- /.footer-widget -->
            </div><!-- /.col-sm-12 col-md-6 col-lg-4 -->
            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-4">
                <div class="footer-widget">
                    <h3 class="footer-widget__title">News</h3><!-- /.footer-widget__title -->
                    <ul class="list-unstyled footer-widget__post">
                        @foreach($posts_footer as $post)
                        <li>
                            <img src="{{$post->image}}" alt="{{$post->title}}">
                            <div class="footer-widget__post-content">
                                <span>{{$post->created_at}}</span>
                                <h4><a href="{{$post->slug_link}}">{{$post->title}}</a></h4>
                            </div><!-- /.footer-widget__post-content -->
                        </li>
                        @endforeach
                    </ul><!-- /.list-unstyled footer-widget__post -->
                </div><!-- /.footer-widget -->
            </div><!-- /.col-sm-12 col-md-6 col-lg-3 -->
            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-4">
                <h3 class="footer-widget__title">Contact</h3><!-- /.footer-widget__title -->
                <ul class="list-unstyled footer-widget__contact">
                    <li>
                        <i class="agrikon-icon-telephone"></i>
                        <a href="tel:666-888-0000">+243812194894  +243999526989</a>
                    </li>
                    <li>
                        <i class="agrikon-icon-email"></i>
                        <a href="mailto:needhelp@company.com">uff49188@gmail.com ,projetuff@gmail.com</a>
                    </li>
                    <li>
                        <i class="agrikon-icon-pin"></i>
                        <a href="#">2-4, LUBEFU/ Gombe , Ministère d'Agriculture Sécretariat Général</a>
                    </li>
                </ul><!-- /.list-unstyled -->
            </div><!-- /.col-sm-12 col-md-6 col-lg-3 -->
        </div><!-- /.row -->
    </div><!-- /.container -->
</footer>
