<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>IPetGo</title>

    <!-- Animate.css -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!-- Flexslider  -->
    <link rel="stylesheet" href="css/flexslider.css">
    <!-- Owl Carousel  -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Modernizr JS -->
    <script src="js/modernizr-2.6.2.min.js"></script>

   <!-- CSS STYLE-->
    <link href="assets/css/style.css" rel="stylesheet"  type="text/css" media="screen"/>
    <!-- THE PREVIEW STYLE SHEETS, NO NEED TO LOAD IN YOUR DOM -->
    <link href="assets/css/noneed.css" rel="stylesheet"  type="text/css" media="screen"/>
    <!-- get jQuery from the google apis -->

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.js"></script>


    <!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
    <script src="assets/js/jquery.themepunch.plugins.min.js"></script>
    <script src="assets/js/jquery.themepunch.revolution.min.js"></script>

    <!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
    <link href="assets/css/extralayers.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="assets/css/settings.css" rel="stylesheet" type="text/css" media="screen"/>
   
    <!-- GOOGLE FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800' rel='stylesheet' type='text/css'>
    <!-- START REVOLUTION SLIDER 4.5.0 fullwidth mode -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:100,200,300,700,800,900' rel='stylesheet' type='text/css'>
</head>
<body>
    <div id="fh5co-page">
        <header id="fh5co-header" role="banner">
            <div class="container" style="padding:0px">
                <!-- <div class="header-inner">-->
                <h1><a href="index.aspx">iPetGo</a></h1>
                <nav role="navigation">
                    <ul>
                        <li><a href='RegisterMember.aspx'>會員註冊</a></li>
                        <li><a href='login.aspx'>會員登入</a></li>
                    </ul>
                </nav>
            </div>
            <!--/div>-->
        </header>
        <!--/wrapper-->
        <div class="wrapper">
            <div class="tp-banner-container">
                <div class="tp-banner">
                    <ul>
                        <!-- SLIDE  -->
                        <li data-transition="fade" data-slotamount="7" data-masterspeed="500" data-thumb="images/homeslider_thumb1.jpg" data-saveperformance="on" data-title="Intro Slide">
                            <!-- MAIN IMAGE -->
                            <img src="images/dummy.png" alt="slidebg1" data-lazyload="images/dog002.jpg" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
                            <!-- LAYERS -->

                            <!-- LAYER NR. 4 -->
                            <div class="tp-caption grey_heavy_72 skewfromrightshort tp-resizeme rs-parallaxlevel-0"
                                data-x="197"
                                data-y="154"
                                data-speed="500"
                                data-start="2250"
                                data-easing="Power3.easeInOut"
                                data-splitin="chars"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                style="z-index: 5; max-width: auto; max-height: auto; white-space: nowrap;">
                                NOW
                            </div>

                            <!-- LAYER NR. 5 -->
                            <div class="tp-caption customin rs-parallaxlevel-0"
                                data-x="86"
                                data-y="184"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="500"
                                data-start="2000"
                                data-easing="Power3.easeInOut"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                style="z-index: 6;">
                                <img src="images/dummy.png" alt="" data-lazyload="images/redbg.png">
                            </div>

                            <!-- LAYER NR. 6 -->
                            <div class="tp-caption black_heavy_60 skewfromleftshort tp-resizeme rs-parallaxlevel-0"
                                data-x="-2"
                                data-y="133"
                                data-speed="500"
                                data-start="1850"
                                data-easing="Power3.easeInOut"
                                data-splitin="chars"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                style="z-index: 7; max-width: auto; max-height: auto; white-space: nowrap;">
                                iPetGO
                            </div>

                            <!-- LAYER NR. 7 -->
                            <div class="tp-caption white_heavy_40 customin tp-resizeme rs-parallaxlevel-0"
                                data-x="98"
                                data-y="187"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="500"
                                data-start="2050"
                                data-easing="Power3.easeInOut"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                style="z-index: 8; max-width: auto; max-height: auto; white-space: nowrap;">
                                Join
                            </div>

                            <!-- LAYER NR. 8 -->
                            <div class="tp-caption grey_regular_18 customin tp-resizeme rs-parallaxlevel-0"
                                data-x="34"
                                data-y="318"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="500"
                                data-start="2600"
                                data-easing="Power3.easeInOut"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.05"
                                data-endelementdelay="0.1"
                                style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
                                <div style="text-align: center; color: #1f1b1b; font-weight: bold;">
                                    所有毛寶貝的需求，這裡全部搞定<br />
                                    愛毛小孩的您利用閒暇時間接案，與寵物共享快樂時光，更可以賺取額外收入!<br />
                                    我們解決寵物家長出遊、忙碌時找不到人照顧毛小孩的困擾<br />
                                </div>
                            </div>

                            <!-- LAYER NR. 9 -->
                            <div class="tp-caption black_thin_34 customin tp-resizeme rs-parallaxlevel-0"
                                data-x="183"
                                data-y="238"
                                data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                data-speed="500"
                                data-start="2350"
                                data-easing="Back.easeOut"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                style="z-index: 10; max-width: auto; max-height: auto; white-space: nowrap;">
                                整合式寵物平台!
                            </div>

                            <!-- LAYER NR. 10 -->
                            <div class="tp-caption customin rs-parallaxlevel-0"
                                data-x="6"
                                data-y="290"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="300"
                                data-start="2500"
                                data-easing="Power3.easeInOut"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                style="z-index: 11;">
                                <img src="images/dummy.png" alt="" data-lazyload="images/greyline.png">
                            </div>

                            <!-- LAYER NR. 11 -->
                            <div class="tp-caption customin tp-resizeme rs-parallaxlevel-0"
                                data-x="73"
                                data-y="502"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="500"
                                data-start="2900"
                                data-easing="Power3.easeInOut"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-linktoslide="next"
                                style="z-index: 12; max-width: auto; max-height: auto; white-space: nowrap;">
                                <a href='RegisterMember.aspx' class='largeredbtn'>快點加入我們的行列</a>
                            </div>

                            <!-- LAYER NR. 12 -->
                            <div class="tp-caption arrowicon customin rs-parallaxlevel-0"
                                data-x="303"
                                data-y="526"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="300"
                                data-start="3200"
                                data-easing="Power3.easeInOut"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-linktoslide="next"
                                style="z-index: 13;">
                                <div class=" rs-slideloop" data-easing="Power3.easeInOut"
                                    data-speed="0.5"
                                    data-xs="-5"
                                    data-xe="5"
                                    data-ys="0"
                                    data-ye="0">
                                    <img src="images/dummy.png" alt="" data-ww="18" data-hh="11" data-lazyload="images/doublearrow2.png">
                                </div>
                            </div>
                            <div id="fh5co-services-section">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6 col-md-offset-3 text-center fh5co-heading animate-box">
                                            <h2>如何透過iPetGo使用平台預約保姆</h2>
                                            <p>想成為家庭式寵物保姆?登錄自己的寵物服務, 自由設定喜歡的條件與價格接待新朋友</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 animate-box">
                                            <div class="services">
                                                <i class="icon-laptop"></i>
                                                <div class="desc">
                                                    <h3>挑選保姆</h3>
                                                    <p>利用描述、評價、日期與地圖挑選適合自己毛小孩的寵物保姆</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 animate-box">
                                            <div class="services">
                                                <i class="icon-server"></i>
                                                <div class="desc">
                                                    <h3>預約面談</h3>
                                                    <p>預約與保姆面談, 確認毛小孩與保姆合適, 了解彼此特性與習慣</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 animate-box">
                                            <div class="services">
                                                <i class="icon-money"></i>
                                                <div class="desc">
                                                    <h3>線上預約</h3>
                                                    <p>在網站上填單, 系統自動依毛小孩的體型與雙方距離計算費用</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 animate-box">
                                            <div class="services">
                                                <i class="icon-tablet"></i>
                                                <div class="desc">
                                                    <h3>家長付款</h3>
                                                    <p>ATM/超商多種方式付款, 方便快速</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 animate-box">
                                            <div class="services">
                                                <i class="icon-line-chart"></i>
                                                <div class="desc">
                                                    <h3>享受假期</h3>
                                                    <p>你出門享受假期, 毛小孩也渡假去</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 animate-box">
                                            <div class="services">
                                                <i class="icon-pie-chart"></i>
                                                <div class="desc">
                                                    <h3>雙方評價</h3>
                                                    <p>服務結束後邀請雙方評價, 建立公開透明的社群信用</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>





                        <!-- SLIDE  -->
                        <li data-transition="slideleft" data-slotamount="7" data-masterspeed="2000" data-thumb="images/homeslider_thumb2.jpg" data-delay="5000" data-saveperformance="on" data-title="Ken Burns Slide">
                            <!-- MAIN IMAGE -->
                            <img src="images/dummy.png" alt="laptopmockup_sliderdy" data-lazyload="images/dog001.jpg" data-bgposition="right top" data-kenburns="on" data-duration="6000" data-ease="Power0.easeInOut" data-bgfit="115" data-bgfitend="100" data-bgpositionend="center bottom">
                            <!-- LAYERS -->

                            <!-- LAYER NR. 1 -->
                            <div class="tp-caption customin fadeout rs-parallaxlevel-10"
                                data-x="848"
                                data-y="196"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="300"
                                data-start="2700"
                                data-easing="Power3.easeInOut"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-endspeed="300"
                                style="z-index: 2;">
                                <img src="images/dummy.png" alt="" data-lazyload="images/redbg_big.png">
                            </div>

                            <!-- LAYER NR. 2 -->
                            <div class="tp-caption light_heavy_70 customin fadeout tp-resizeme rs-parallaxlevel-10"
                                data-x="862"
                                data-y="204"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="300"
                                data-start="2850"
                                data-easing="Power3.easeInOut"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-endspeed="300"
                                style="z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;">
                                iPetGO
                            </div>

                            <!-- LAYER NR. 3 -->
                            <div class="tp-caption black_heavy_70 skewfromleftshort fadeout tp-resizeme rs-parallaxlevel-10"
                                data-x="717"
                                data-y="143"
                                data-speed="500"
                                data-start="2400"
                                data-easing="Power3.easeInOut"
                                data-splitin="chars"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-endspeed="300"
                                style="z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;">
                                All in One
                            </div>

                            <!-- LAYER NR. 4 -->
                            <div class="tp-caption black_bold_40 skewfromrightshort fadeout tp-resizeme rs-parallaxlevel-10"
                                data-x="937"
                                data-y="282"
                                data-speed="500"
                                data-start="3200"
                                data-easing="Power3.easeInOut"
                                data-splitin="chars"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-endspeed="300"
                                style="z-index: 5; max-width: auto; max-height: auto; white-space: nowrap;">
                                快加入!
                            </div>

                            <!-- LAYER NR. 5 -->
                            <div class="tp-caption black_bold_bg_20 sfr fadeout tp-resizeme rs-parallaxlevel-10"
                                data-x="970"
                                data-y="367"
                                data-speed="300"
                                data-start="4000"
                                data-easing="Power3.easeInOut"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-endspeed="300"
                                style="z-index: 6; max-width: auto; max-height: auto; white-space: nowrap;">
                                最可愛的毛小孩日誌
                            </div>

                            <!-- LAYER NR. 6 -->
                            <div class="tp-caption greenbox30 customin fadeout tp-resizeme rs-parallaxlevel-10"
                                data-x="939"
                                data-y="367"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="300"
                                data-start="4000"
                                data-easing="Power3.easeInOut"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-endspeed="300"
                                style="z-index: 7; max-width: auto; max-height: auto; white-space: nowrap;">
                                &nbsp;
                            </div>

                            <!-- LAYER NR. 7 -->
                            <div class="tp-caption arrowicon customin fadeout rs-parallaxlevel-10"
                                data-x="948"
                                data-y="374"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="300"
                                data-start="4200"
                                data-easing="Power3.easeInOut"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-endspeed="300"
                                style="z-index: 8;">
                                <img src="images/dummy.png" alt="" data-ww="17" data-hh="17" data-lazyload="images/check.png">
                            </div>

                            <!-- LAYER NR. 8 -->
                            <div class="tp-caption black_bold_bg_20 sfr fadeout tp-resizeme rs-parallaxlevel-10"
                                data-x="970"
                                data-y="407"
                                data-speed="300"
                                data-start="4500"
                                data-easing="Power3.easeInOut"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-endspeed="300"
                                style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
                                最方便的協尋、保母找尋
                            </div>

                            <!-- LAYER NR. 9 -->
                            <div class="tp-caption greenbox30 customin fadeout tp-resizeme rs-parallaxlevel-10"
                                data-x="939"
                                data-y="407"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="300"
                                data-start="4500"
                                data-easing="Power3.easeInOut"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-endspeed="300"
                                style="z-index: 10; max-width: auto; max-height: auto; white-space: nowrap;">
                                &nbsp;
                            </div>

                            <!-- LAYER NR. 10 -->
                            <div class="tp-caption arrowicon customin fadeout rs-parallaxlevel-10"
                                data-x="948"
                                data-y="414"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="300"
                                data-start="4700"
                                data-easing="Power3.easeInOut"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-endspeed="300"
                                style="z-index: 11;">
                                <img src="images/dummy.png" alt="" data-ww="17" data-hh="17" data-lazyload="images/check.png">
                            </div>

                            <!-- LAYER NR. 11 -->
                            <div class="tp-caption black_bold_bg_20 sfr fadeout tp-resizeme rs-parallaxlevel-10"
                                data-x="970"
                                data-y="447"
                                data-speed="300"
                                data-start="5000"
                                data-easing="Power3.easeInOut"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-endspeed="300"
                                style="z-index: 12; max-width: auto; max-height: auto; white-space: nowrap;">
                                醫療、住宿資源通通有
                            </div>

                            <!-- LAYER NR. 12 -->
                            <div class="tp-caption greenbox30 customin fadeout tp-resizeme rs-parallaxlevel-10"
                                data-x="939"
                                data-y="447"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="300"
                                data-start="5000"
                                data-easing="Power3.easeInOut"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-endspeed="300"
                                style="z-index: 13; max-width: auto; max-height: auto; white-space: nowrap;">
                                &nbsp;
                            </div>

                            <!-- LAYER NR. 13 -->
                            <div class="tp-caption arrowicon customin fadeout rs-parallaxlevel-10"
                                data-x="948"
                                data-y="454"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="300"
                                data-start="5200"
                                data-easing="Power3.easeInOut"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-endspeed="300"
                                style="z-index: 14;">
                                <img src="images/dummy.png" alt="" data-ww="17" data-hh="17" data-lazyload="images/check.png">
                            </div>
                        </li>

                        <!-- SLIDE  -->
                        <li data-transition="fade" data-slotamount="7" data-masterspeed="500" data-thumb="images/homeslider_thumb1.jpg" data-saveperformance="on" data-title="Intro Slide">
                            <!-- MAIN IMAGE -->
                            <img src="images/dummy.png" alt="slidebg1" data-lazyload="images/dog1.jpg" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
                            <!-- LAYERS -->

                            <!-- LAYER NR. 4 -->
                            <div class="tp-caption grey_heavy_72 skewfromrightshort tp-resizeme rs-parallaxlevel-0"
                                data-x="197"
                                data-y="154"
                                data-speed="500"
                                data-start="2250"
                                data-easing="Power3.easeInOut"
                                data-splitin="chars"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                style="z-index: 5; max-width: auto; max-height: auto; white-space: nowrap;">
                                NOW
                            </div>

                            <!-- LAYER NR. 5 -->
                            <div class="tp-caption customin rs-parallaxlevel-0"
                                data-x="86"
                                data-y="184"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="500"
                                data-start="2000"
                                data-easing="Power3.easeInOut"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                style="z-index: 6;">
                                <img src="images/dummy.png" alt="" data-lazyload="images/redbg.png">
                            </div>

                            <!-- LAYER NR. 6 -->
                            <div class="tp-caption black_heavy_60 skewfromleftshort tp-resizeme rs-parallaxlevel-0"
                                data-x="-2"
                                data-y="133"
                                data-speed="500"
                                data-start="1850"
                                data-easing="Power3.easeInOut"
                                data-splitin="chars"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                style="z-index: 7; max-width: auto; max-height: auto; white-space: nowrap;">
                                iPetGO
                            </div>

                            <!-- LAYER NR. 7 -->
                            <div class="tp-caption white_heavy_40 customin tp-resizeme rs-parallaxlevel-0"
                                data-x="98"
                                data-y="187"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="500"
                                data-start="2050"
                                data-easing="Power3.easeInOut"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                style="z-index: 8; max-width: auto; max-height: auto; white-space: nowrap;">
                                Join
                            </div>

                            <!-- LAYER NR. 8 -->
                            <div class="tp-caption grey_regular_18 customin tp-resizeme rs-parallaxlevel-0"
                                data-x="34"
                                data-y="318"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="500"
                                data-start="2600"
                                data-easing="Power3.easeInOut"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.05"
                                data-endelementdelay="0.1"
                                style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
                                <div style="text-align: center; color: #1f1b1b; font-weight: bold;">
                                    所有毛寶貝的需求，這裡全部搞定<br />
                                    想找家庭式寵物保姆?<br />
                                    出遠門前找到最適合的家庭式寵物保姆, 享受細心專屬的照顧<br />
                                </div>
                            </div>

                            <!-- LAYER NR. 9 -->
                            <div class="tp-caption black_thin_34 customin tp-resizeme rs-parallaxlevel-0"
                                data-x="183"
                                data-y="238"
                                data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                data-speed="500"
                                data-start="2350"
                                data-easing="Back.easeOut"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                style="z-index: 10; max-width: auto; max-height: auto; white-space: nowrap;">
                                整合式寵物平台!
                            </div>

                            <!-- LAYER NR. 10 -->
                            <div class="tp-caption customin rs-parallaxlevel-0"
                                data-x="6"
                                data-y="290"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="300"
                                data-start="2500"
                                data-easing="Power3.easeInOut"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                style="z-index: 11;">
                                <img src="images/dummy.png" alt="" data-lazyload="images/greyline.png">
                            </div>

                            <!-- LAYER NR. 11 -->
                            <div class="tp-caption customin tp-resizeme rs-parallaxlevel-0"
                                data-x="73"
                                data-y="502"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="500"
                                data-start="2900"
                                data-easing="Power3.easeInOut"
                                data-splitin="none"
                                data-splitout="none"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-linktoslide="next"
                                style="z-index: 12; max-width: auto; max-height: auto; white-space: nowrap;">
                                <a href='RegisterMember.aspx' class='largeredbtn'>快點加入我們的行列</a>
                            </div>

                            <!-- LAYER NR. 12 -->
                            <div class="tp-caption arrowicon customin rs-parallaxlevel-0"
                                data-x="303"
                                data-y="526"
                                data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                data-speed="300"
                                data-start="3200"
                                data-easing="Power3.easeInOut"
                                data-elementdelay="0.1"
                                data-endelementdelay="0.1"
                                data-linktoslide="next"
                                style="z-index: 13;">
                                <div class=" rs-slideloop" data-easing="Power3.easeInOut"
                                    data-speed="0.5"
                                    data-xs="-5"
                                    data-xe="5"
                                    data-ys="0"
                                    data-ye="0">
                                    <img src="images/dummy.png" alt="" data-ww="18" data-hh="11" data-lazyload="images/doublearrow2.png">
                                </div>
                            </div>
                        </li>

                    </ul>
                    <div class="tp-bannertimer"></div>
                </div>
            </div>

            <script type="text/javascript">

                jQuery(document).ready(function () {



                    jQuery('.tp-banner').show().revolution(
					{
					    dottedOverlay: "none",
					    delay: 4000,
					    startwidth: 1170,
					    startheight: 700,
					    hideThumbs: 200,

					    thumbWidth: 100,
					    thumbHeight: 50,
					    thumbAmount: 5,

					    navigationType: "bullet",
					    navigationArrows: "solo",
					    navigationStyle: "preview2",

					    touchenabled: "on",
					    onHoverStop: "on",

					    swipe_velocity: 0.7,
					    swipe_min_touches: 1,
					    swipe_max_touches: 1,
					    drag_block_vertical: false,

					    parallax: "mouse",
					    parallaxBgFreeze: "on",
					    parallaxLevels: [7, 4, 3, 2, 5, 4, 3, 2, 1, 0],

					    keyboardNavigation: "off",

					    navigationHAlign: "center",
					    navigationVAlign: "bottom",
					    navigationHOffset: 0,
					    navigationVOffset: 20,

					    soloArrowLeftHalign: "left",
					    soloArrowLeftValign: "center",
					    soloArrowLeftHOffset: 20,
					    soloArrowLeftVOffset: 0,

					    soloArrowRightHalign: "right",
					    soloArrowRightValign: "center",
					    soloArrowRightHOffset: 20,
					    soloArrowRightVOffset: 0,

					    shadow: 0,
					    fullWidth: "on",
					    fullScreen: "off",

					    spinner: "spinner4",

					    stopLoop: "off",
					    stopAfterLoops: -1,
					    stopAtSlide: -1,

					    shuffle: "off",

					    autoHeight: "off",
					    forceFullWidth: "off",



					    hideThumbsOnMobile: "off",
					    hideNavDelayOnMobile: 1500,
					    hideBulletsOnMobile: "off",
					    hideArrowsOnMobile: "off",
					    hideThumbsUnderResolution: 0,

					    hideSliderAtLimit: 0,
					    hideCaptionAtLimit: 0,
					    hideAllCaptionAtLilmit: 0,
					    startWithSlide: 0,
					    videoJsPath: "rs-plugin/videojs/",
					    fullScreenOffsetContainer: ""
					});




                });	//ready

            </script>

            <!-- END REVOLUTION SLIDER -->
        </div>








    </div>
    <!--/wrapper-->




    <div style="height: 120px"></div>


    <!-- 如果相衝，這段一個個隱藏試看看↓ -->

        <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
     <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>   
    <!-- jQuery Easing -->
    <script src="js/jquery.easing.1.3.js"></script>   
    <!-- Waypoints -->
    <script src="js/jquery.waypoints.min.js"></script>
    <!-- Owl Carousel -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- Flexslider -->
    <script src="js/jquery.flexslider-min.js"></script>
    <!-- MAIN JS -->
    <script src="js/main.js"></script>

    <!-- 如果相衝，這段一個個隱藏試看看↑ -->

</body>
</html>

<!-- JS Global Compulsory -->
<%--<script type="text/javascript" src="assets/plugins/jquery-1.10.2.min.js"></script>--%>
<script src="assets/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<%--<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>--%>
<!-- JS Implementing Plugins -->
<script src="assets/js/back-to-top.js"></script>
<script src="assets/js/owl.carousel.js"></script>
<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
<script src="assets/js/jquery.themepunch.plugins.min.js"></script>
<script src="assets/js/jquery.themepunch.revolution.min.js"></script>
<!-- JS Page Level -->
<script src="assets/js/app.js"></script>
<script src="assets/js/index.js"></script>
<script src="assets/js/owl-carousel.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function () {
        App.init();
        Index.initRevolutionSlider();
        OwlCarousel.initOwlCarousel();
    });
</script>
