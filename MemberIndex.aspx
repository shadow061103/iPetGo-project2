<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberIndex.aspx.cs" Inherits="MemberIndex" %>

<%@ Register Src="DefenseWebControl.ascx" TagName="DefenseWebControl" TagPrefix="uc1" %>

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
    <style type="text/css">
        .auto-style1 {
            text-align: right;
            width: 314px;
        }
 .abc {
            background-color:#00FFFF;
            border-radius:30px;
            height:30px;
        }
        .abc:hover {
            color: #000088;
           background: #99FFFF;
           text-decoration: none;
        }
         .abc:hover::after {
           display: none;
          
        }
    </style>


    <link href="css/app.css" rel="stylesheet" />


    <!-- CSS Global Compulsory-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/style3.css" rel="stylesheet" />
    <!-- CSS Implementing Plugins -->    
    <link href="assets/css/line-icons.css" rel="stylesheet" />
    <link href="assets/css/owl.carousel.css" rel="stylesheet" />
    <link href="assets/css/settings.css" rel="stylesheet" />
</head>
<body>
    <uc1:DefenseWebControl ID="DefenseWebControl1" runat="server" />
    <form id="form1" runat="server">
        <div id="fh5co-page">
       <header id="fh5co-header" role="banner">
            <div class="container">
                <div class="header-inner">
                    <h1><a href="MemberIndex.aspx">iPetGo</a></h1>

                    <nav role="navigation">
                        <ul>
                            <li><a href="RegisterPetSitter.aspx">保母招募</a></li>
                            <li><a href="News.aspx">寵物資訊版</a></li>
                            <li><a href="IGtheme.aspx">PetStories</a></li>
                             <li><a href="petSisterInfo.aspx">保母列表</a></li>
                            <li><a href="PetSearchInfo.aspx">寵物協尋</a></li>
                            <li><a href="Petshopmall.aspx">寵物商城</a></li>
                            <%--                            <li><a href="PetStore.html">會員中心</a></li>
                            <li><a href='Logout.aspx'>登出</a></li>--%>

                            <li role="presentation" class="dropdown">
                                <a id="drop5" href="#" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">會員中心
                                <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="drop5">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="MemberProfile.aspx">會員基本資料維護</a></li>
                                            <%
                                         if (Session[Dictionary.SK_right] == null)
                                             Response.Redirect("index.aspx");

                                        int right = (int)Session[Dictionary.SK_right];
                                        if (right == 4)
                                        {
                                         %>

                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="PetSisterProfile.aspx">保母資料維護</a></li>
                                    <%} %>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="MembersOrder.aspx">我的購物清單</a></li>
                                    
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="MemberPetList.aspx">我的毛小孩</a></li>
                                   <!--判斷權限 以決定顯示出的會員中心-->
                                     <%
                                        

                                         
                                         if (right == 3)
                                         {
                                            %>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="mySisterService.aspx">我的接待家庭</a></li>
                                            <%
                                                }
                                                else if(right ==4){%>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="myService.aspx">我的服務預約</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="mySisterService.aspx">我的接待家庭</a></li>
                                    <%

                                                }

                                         %>
                                     <!--判斷權限 以決定顯示出的會員中心-->

                                    
  
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="Logout.aspx">登出</a></li>
                                </ul>
                            </li>
                            <li class="abc">
                                <a href="basketCart.aspx">結帳
                                   <img src="../images/cart.png" />
                                 </a></li>

                        </ul>

                    </nav>
                </div>
            </div>
        </header>


        <div>
            <br />
        </div>

        <div class="wrapper">


            <!--=== Slider ===-->
            <div class="tp-banner-container">
                <div class="tp-banner">
                    <ul>
                        <!-- SLIDE -->
                        <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000">
                            <!-- MAIN IMAGE -->
                            <img src="images/dogNew.jpg" alt="darkblurbg" data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">

                            <div class="tp-caption revolution-ch1 sft start"
                                data-x="center"
                                data-hoffset="0"
                                data-y="100"
                                data-speed="1500"
                                data-start="500"
                                data-easing="Back.easeInOut"
                                data-endeasing="Power1.easeIn"
                                data-endspeed="300">
                                完整平台
                            </div>

                            <!-- LAYER -->
                            <div class="tp-caption revolution-ch1 sft start"
                                data-x="center"
                                data-hoffset="0"
                                data-y="190"
                                data-speed="1400"
                                data-start="2000"
                                data-easing="Power4.easeOut"
                                data-endspeed="300"
                                data-endeasing="Power1.easeIn"
                                data-captionhidden="off"
                                style="z-index: 6">
                                整合所有飼主需求
                            </div>

                            <!-- LAYER -->
                            <div class="tp-caption revolution-ch1 sft start"
                                data-x="center"
                                data-hoffset="0"
                                data-y="310"
                                data-speed="1600"
                                data-start="2800"
                                data-easing="Power4.easeOut"
                                data-endspeed="300"
                                data-endeasing="Power1.easeIn"
                                data-captionhidden="off"
                                style="z-index: 6">
                                一次搞定大小事
                            </div>
                        </li>
                        <!-- END SLIDE -->

                        <!-- SLIDE -->
                        <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000">
                            <!-- MAIN IMAGE -->
                            <img src="images/dogNew2.jpg" alt="darkblurbg" data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">

                            <div class="tp-caption revolution-ch1 sft start"
                                data-x="center"
                                data-hoffset="0"
                                data-y="100"
                                data-speed="1500"
                                data-start="500"
                                data-easing="Back.easeInOut"
                                data-endeasing="Power1.easeIn"
                                data-endspeed="300">
                                操作簡單便利
                            </div>

                            <!-- LAYER -->
                            <div class="tp-caption revolution-ch1 sft start"
                                data-x="center"
                                data-hoffset="0"
                                data-y="190"
                                data-speed="1400"
                                data-start="2000"
                                data-easing="Power4.easeOut"
                                data-endspeed="300"
                                data-endeasing="Power1.easeIn"
                                data-captionhidden="off"
                                style="z-index: 6">
                                結合APP
                            </div>

                            <!-- LAYER -->
                            <div class="tp-caption revolution-ch1 sft start"
                                data-x="center"
                                data-hoffset="0"
                                data-y="310"
                                data-speed="1600"
                                data-start="2800"
                                data-easing="Power4.easeOut"
                                data-endspeed="300"
                                data-endeasing="Power1.easeIn"
                                data-captionhidden="off"
                                style="z-index: 6">
                                雲端資料同步儲存
                            </div>
                        </li>
                        <!-- END SLIDE -->

                        <!-- SLIDE -->
                        <li class="revolution-mch-1" data-transition="fade" data-slotamount="5" data-masterspeed="1000">
                            <!-- MAIN IMAGE -->
                            <img src="images/dogNew3.jpg" alt="darkblurbg" data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">

                            <div class="tp-caption revolution-ch1 sft start"
                                data-x="center"
                                data-hoffset="0"
                                data-y="100"
                                data-speed="1500"
                                data-start="500"
                                data-easing="Back.easeInOut"
                                data-endeasing="Power1.easeIn"
                                data-endspeed="300">
                                找保母？找醫療？找不到
                            </div>

                            <!-- LAYER -->
                            <div class="tp-caption revolution-ch1 sft start"
                                data-x="center"
                                data-hoffset="0"
                                data-y="190"
                                data-speed="1400"
                                data-start="2000"
                                data-easing="Power4.easeOut"
                                data-endspeed="300"
                                data-endeasing="Power1.easeIn"
                                data-captionhidden="off"
                                style="z-index: 6">
                                毛寶貝走丟了不知如何是好？
                            </div>

                            <!-- LAYER -->
                            <div class="tp-caption revolution-ch1 sft start" 
                                data-x="center"
                                data-hoffset="0"
                                data-y="310"
                                data-speed="1600"
                                data-start="2800"
                                data-easing="Power4.easeOut"
                                data-endspeed="300"
                                data-endeasing="Power1.easeIn"
                                data-captionhidden="off"
                                style="z-index: 6">
                                一次搞定你常見的問題
                            </div>
                        </li>
                        <!-- END SLIDE -->
                    </ul>
                    <div class="tp-bannertimer tp-bottom"></div>
                </div>
            </div>
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

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!-- jQuery Easing -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Waypoints -->
        <script src="js/jquery.waypoints.min.js"></script>
        <!-- Owl Carousel -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- Flexslider -->
        <script src="js/jquery.flexslider-min.js"></script>
        <!-- MAIN JS -->
        <script src="js/main.js"></script>

          <script type="text/javascript">

                jQuery(document).ready(function () {

                    jQuery('.tp-banner').show().revolution(
					{
					    dottedOverlay: "none",
					    delay: 4000,//時間
					    startwidth: 1170,
					    startheight: 500,//高度
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

    </form>

</body>
</html>


<!-- JS Global Compulsory -->           
<%--<script type="text/javascript" src="assets/plugins/jquery-1.10.2.min.js"></script>--%>
<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
<%--<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>--%>
<!-- JS Implementing Plugins -->           
<script src="assets/js/back-to-top.js"></script>
<script src="assets/js/owl-carousel.js"></script>
<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
<script src="assets/js/jquery.themepunch.plugins.min.js"></script>
<script src="assets/js/jquery.themepunch.revolution.min.js"></script>
<!-- JS Page Level -->           
<script src="assets/js/app.js"></script>
<script src="assets/js/index.js"></script>
<script src="assets/js/owl-carousel.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        Index.initRevolutionSlider();
        OwlCarousel.initOwlCarousel();
    });
</script>

