<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PetSearch.aspx.cs" Inherits="RegisterMember"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>iPetGo</title>

    <!-- Animate.css -->
    <link rel="stylesheet" href="css/animate.css"/>
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="css/icomoon.css"/>
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <!-- Flexslider  -->
    <link rel="stylesheet" href="css/flexslider.css"/>
    <!-- Owl Carousel  -->
 <%--<link rel="stylesheet" href="css/owl.carousel.min.css"/>--%>
    <link rel="stylesheet" href="css/owl.theme.default.min.css"/>
    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css"/>
     <!-- datepicker -->
    <link href="css/ui-lightness/jquery-ui.min.css" rel="stylesheet" />
    <link href="css/ui-lightness/mystyle.css" rel="stylesheet" />

    
    

    <!-- Modernizr JS -->
    <script src="js/modernizr-2.6.2.min.js"></script>

    <style type="text/css">
        .auto-style2 {
            font-size: large;
        }
        .auto-style3 {
            font-size: x-large;
            font-weight: 300;
            line-height: 1.4;
            margin-bottom: 20px;
        }
        .auto-style4 {
            font-size: medium;
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

   
    <script src="js/jquery.min.js"></script>

     <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB46QSsw2v7pTy2QneqXvMXXkZ4D1zx7EQ&callback=initMap"></script>

    <script>
        
            var mMoveHandler;
            var map;
            var marker;
            var cityQueryString = "";
            var geocoder = new google.maps.Geocoder();
            var infowindow = new google.maps.InfoWindow();
            var center = new google.maps.LatLng(23.57405696664267, 120.926513671875);
            function initialize(){
                var mapOptions = {
                    zoom: 7,
                    //center: myLatlng,
                    center: center,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };

                map = new google.maps.Map(document.getElementById("map"), mapOptions);
                /*
                marker = new google.maps.Marker({
                    map: map,
                    position: myLatlng,
                    draggable: true 
                }); 
                */

               

               
                google.maps.event.addListener(map, 'click', function (e) {

                    var latLng = e.latLng;

                    if (marker) {
                        marker.setPosition(latLng);
                    }
                    else {
                        marker = new google.maps.Marker({
                            position: latLng,
                            map: map,
                            draggable: true
                        });
                    }


                   

                    geocoder.geocode({ 'latLng': latLng }, function (results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            if (results[0]) {
                                $('#txtlatitude,#txtlongitude').show();
                                $('#txtLosingAddress').val(results[0].formatted_address);
                                $('#txtlatitude').val(marker.getPosition().lat());
                                $('#txtlongitude').val(marker.getPosition().lng());
                                infowindow.setContent(results[0].formatted_address);
                                infowindow.open(map, marker);
                            }
                        }
                    });

                    google.maps.event.addListener(marker, 'dragend', function () {

                        geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
                            if (status == google.maps.GeocoderStatus.OK) {
                                if (results[0]) {
                                    $('#txtLosingAddress').val(results[0].formatted_address);
                                    $('#txtlatitude').val(marker.getPosition().lat());
                                    $('#txtlongitude').val(marker.getPosition().lng());
                                    infowindow.setContent(results[0].formatted_address);
                                    infowindow.open(map, marker);
                                }
                            }
                        });
                    });
                    
                });

            }
            google.maps.event.addDomListener(window, 'load', initialize);


        function previewFile() {
            var preview = document.querySelector('#<%=ImagePrevious.ClientID %>');
            var file = document.querySelector('#<%=fileUpload1.ClientID %>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }

        function setMapToCityArea() {
            $.getJSON('https://maps.googleapis.com/maps/api/geocode/json?address='
                    + cityQueryString // + areaQueryString
                    + '&key=AIzaSyB46QSsw2v7pTy2QneqXvMXXkZ4D1zx7EQ', function (obj) {
                        var latLng = obj.results[0].geometry.location
                        map.setCenter(latLng)
                    })
        }

        function setAreaList() {
            // setAreaControl()
            cityQueryString = document.getElementById("listArea").value
           
            setMapToCityArea();
            map.setZoom(11);
        }



    </script>
    
</head>
<body onload="init()">

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
         
       

        <div id="fh5co-work-section" class="fh5co-light-grey-section">
            <div class="container">

                <div class="row">
                    <div class="col-md-3 col-xs-3 col-sm-3">
                        <div class="list-group">
                            <a href="PetSearchInfo.aspx" class="list-group-item"><span class="auto-style2">走失寵物資訊</span></a>
                            <a href="PetSearch.aspx" class="list-group-item" style="background-color:#39F; color:#FFF"><span class="auto-style2">走失寵物資訊上傳</span></a>  
                            <a href="PetSearchEdit.aspx" class="list-group-item"><span class="auto-style2">寵物遺失資訊編輯</span></a>                     
                        </div>
                    </div>
                    <div class="col-md-9 col-xs-9 col-sm-9">
                         <div class="row carousel-holder">

                            <div class="row">
                                <div class="col-md-12 col-xs-12 col-sm-12">
                                    <form id="form" runat="server" >
                                        <div>
                                            <p class="auto-style3" style=" margin:0px auto; width:100%; height:50px; background-color:#2461BF;border: 5px solid  #2461BF;
	                                           border-radius: 10px;padding:5px; color:#FFF" align="center">寵物協尋資料</p>
                                        </div>
                                       <br />

                                      <div class="row">
                                          <div class="col-md-6 col-xs-6 col-sm-6">
                                              <div class="form-group">
                                                <label for="username"><span class="auto-style2">使用者帳號</span></label> 
                                             
                                                <asp:TextBox ID="txtMemberAccount" runat="server" class="form-control"></asp:TextBox>
                                              </div>
                                          </div>
                                          <div class="col-md-6 col-xs-6 col-sm-6">
                                                <div class="form-group">
                                                 <label for="people"><span class="auto-style2">連絡人</span></label>
                                                 <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                          </div>
									  </div>
                                      
									  <div class="row">
                                          <div class="col-md-6 col-xs-6 col-sm-6">
                                               <div class="form-group">
                                                <label for="petname"><span class="auto-style2">寵物名稱</span></label>
                                                <asp:TextBox ID="txtPetName" runat="server" class="form-control"></asp:TextBox>                                  
                                              </div>
                                          </div>
                                          <div class="col-md-6 col-xs-6 col-sm-6">
                                              <div class="form-group">                                   
                                                    <label for="contentPhone"><span class="auto-style2">連絡電話</span></label>
                                                    <asp:TextBox ID="txtPhone" runat="server" class="form-control"></asp:TextBox>
                                              </div>
                                          </div>
									  </div>
                                      <div class="row">
                                          <div class="col-md-6 col-xs-6 col-sm-6">                                                                              
                                              <div class="form-group">
                                                <label for="PetType" ><span class="auto-style2">寵物類型</span></label><br/>
                                                  <asp:RadioButtonList ID="rdPetSelect" runat="server" RepeatDirection="Horizontal" class="form-control" >
                                                        <asp:ListItem Selected="True">狗</asp:ListItem>                                                 
                                                        <asp:ListItem>貓</asp:ListItem>
                                                        <asp:ListItem>其他</asp:ListItem>
                                                  </asp:RadioButtonList>  
                                              </div>
                                              

                                              <div class="form-group">
                                                  <label for="missArea"><span class="auto-style2">走失縣市</span></label>
                                                  <asp:DropDownList ID="listArea" runat="server" class="form-control" onchange="setAreaList()" >                                                    
                                                      <asp:ListItem Value="">請選擇</asp:ListItem>
                                                      <asp:ListItem Value="基隆市">基隆市</asp:ListItem>
                                                      <asp:ListItem Value="台北市">台北市</asp:ListItem>
                                                      <asp:ListItem Value="新北市">新北市</asp:ListItem>
                                                      <asp:ListItem Value="桃園市">桃園市</asp:ListItem>
                                                      <asp:ListItem Value="新竹市">新竹市</asp:ListItem>
                                                      <asp:ListItem Value="新竹縣">新竹縣</asp:ListItem>
                                                      <asp:ListItem Value="苗栗縣">苗栗縣</asp:ListItem>
                                                      <asp:ListItem Value="台中市">台中市</asp:ListItem>
                                                      <asp:ListItem Value="彰化縣">彰化縣</asp:ListItem>
                                                      <asp:ListItem Value="南投縣">南投縣</asp:ListItem>
                                                      <asp:ListItem Value="雲林縣">雲林縣</asp:ListItem>
                                                      <asp:ListItem Value="嘉義市">嘉義市</asp:ListItem>
                                                      <asp:ListItem Value="嘉義縣">嘉義縣</asp:ListItem>
                                                      <asp:ListItem Value="台南市">台南市</asp:ListItem>
                                                      <asp:ListItem Value="高雄市">高雄市</asp:ListItem>
                                                      <asp:ListItem Value="屏東縣">屏東縣</asp:ListItem>
                                                      <asp:ListItem Value="台東縣">台東縣</asp:ListItem>
                                                      <asp:ListItem Value="花蓮縣">花蓮縣</asp:ListItem>
                                                      <asp:ListItem Value="宜蘭縣">宜蘭縣</asp:ListItem>
                                                      <asp:ListItem Value="澎湖縣">澎湖縣</asp:ListItem>
                                                      <asp:ListItem Value="金門縣">金門縣</asp:ListItem>
                                                      <asp:ListItem Value="連江縣">連江縣</asp:ListItem>
                                                  </asp:DropDownList>                      
                                              </div>

                                               
                                              <div class="form-group">
                                                <label for="petDescription"><span class="auto-style2">寵物特徵</span></label>
                                                <asp:TextBox ID="txtPetDescription" runat="server" TextMode="MultiLine" Height="200px" CssClass="form-control"></asp:TextBox>
                                              </div>
                                              
                                          </div>
                                          <div class="col-md-6 col-xs-6 col-sm-6">
                                              <div class="form-group">
                                                <label for="missdate"><span class="auto-style2">走失日期</span></label>
                                                <asp:TextBox ID="txtLosingDate"  class="form-control datepicker" runat="server"></asp:TextBox>
                                              </div>
                                              <div class="form-group">
                                                <label for="misspetphoto"><span class="auto-style2">走失寵物照片上傳</span></label>
                                                <asp:FileUpload ID="fileUpload1" runat="server" CssClass="form-control" onchange="previewFile()" class="form-control" />
                                              </div>
                                              <div class="form-group">
                                                <label for="perviousPhoto"><span class="auto-style2">照片預覽</span></label>
                                                <asp:Image ID="ImagePrevious" ImageUrl="~/petsearchpic/icon.png" runat="server" width="100%" Height="200px" class="img-thumbnail form-control"  />
                                              </div>
                                                                                            
                                          </div>
									  </div>
                                      
                                      <div class="row">
                                          <div class="col-md-12 col-xs-12 col-sm-12">
                                               <div class="form-group">
                                                    <label for="missplace"><span class="auto-style2">走失地點 </span> <span style="color:red"><span class="auto-style4">*請在地圖上標記寵物走失地點</span></span></label>
                                                    <div id="map" style="width:100%; height:500px"></div>
                                                        
                                                        <div class="col-md-6 col-xs-6 col-sm-6">
                                                            <label><span class="auto-style2">緯度</span> </label>
                                                            <asp:TextBox ID="txtlatitude" runat="server" class="form-control" ></asp:TextBox>                                                      
                                                        </div>                                            
                                                        <div class="col-md-6 col-xs-6 col-sm-6">
                                                            <label><span class="auto-style2">經度</span> </label>
                                                            <asp:TextBox ID="txtlongitude" runat="server" class="form-control" ></asp:TextBox>
                                                        </div>     
                                                   
                                                        <div class="col-md-12 col-xs-12 col-sm-12">
                                                             <label><span class="auto-style2">地址</span> </label>
                                                             <asp:TextBox ID="txtLosingAddress" runat="server" class="form-control"></asp:TextBox>                                                            
                                                        </div>                                                                                                              
                                               </div>
                                                  
                                          </div>
                                      </div>
                                    <br />
                                        <div class="col-md-12 col-xs-12 col-sm-12">
                                            <asp:Button ID="btnFinish" runat="server" Text="送出" class="btn btn-info" OnClick="btnFinish_Click" /> 
                                            
                                        </div>
                                        
                                          
                                    </form>

                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>      
                </div>                   
            </div>                
        </div>
    </div> 
    <script src="js/jquery.ui.datepicker-zh-TW.js"></script>
   
    <script src="js/jquery-ui.min.js"></script>

    <script type="text/javascript">
        $(function () {  //網頁就緒
            //日期選擇器

            $(".datepicker").datepicker({ numberOfMonths: [1, 1], changeYear: true, yearRange: "c-5:c+5" });
$("#datepicker").datepicker({
  showOn: 'button',
  buttonImage: '../images/calendar.png',
  buttonImageOnly: true
});
        });
    </script>
   


    <footer id="fh5co-footer" role="contentinfo">

        <div class="col-md-12 fh5co-copyright text-center">
            <p>&copy; 2016 Free HTML5 template. All Rights Reserved. <span>Designed with <i class="icon-heart"></i> by <a href="http://freehtml5.co/" target="_blank">FreeHTML5.co</a> Colored Icons by <a href="https://dribbble.com/TrinhHo" target="_blank">Trinh Ho</a> Demo Images by <a href="http://unsplash.com/" target="_blank">Unsplash</a></span></p>
        </div>


    </footer>


    <!-- jQuery -->

    <!-- jQuery Easing -->
    <script src="js/jquery.easing.1.3.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Waypoints -->
    <script src="js/jquery.waypoints.min.js"></script>
    <!-- Flexslider -->
    <script src="js/jquery.flexslider-min.js"></script>
    <!-- Stellar -->
    <script src="js/jquery.stellar.min.js"></script>

    <!-- MAIN JS -->
    <script src="js/main.js"></script>

</body>
</html>
