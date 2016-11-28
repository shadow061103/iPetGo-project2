<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<%--https://dotblogs.com.tw/easonwei/2012/09/20/74926   驗證javascript--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>會員登入</title>

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
    <script type="text/javascript">
        function login(form) {
            if (form.memberAccount.value == "") {
                alert("帳號不能空白");
                return false;
            }
            if (form.memberPwd.value == "") {
                alert("密碼不能空白");
                return false;
            }
        }
    </script>
</head>
<body>
    <div id="fh5co-page" style="background-image:url(images/dogNew4.jpg);background-attachment: fixed;background-repeat:no-repeat">
        <header id="fh5co-header" role="banner">
            <div class="container">
                <div class="header-inner">
                    <h1><a href="index.aspx">iPetGo</a></h1>
                    <nav role="navigation">
                        <ul>
                           
                            <li><a href="RegisterMember.aspx">會員註冊</a></li>
                            <li><a href="#">會員登入</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>


        <%-- <div class="container">
            <div class="col-lg-offset-4 col-lg-4">
                <img src="images/cutecat.jpg">
            </div>
        </div>--%>
        <!-- content -->
        <div align="center">
            <div style="width:80%;padding-left:400px">
                <div class="panel panel-primary">
                    <div class="panel-heading" style="font-size: 24px">會員登入</div>
                    <div class="panel-body">

                        <div>
                            <form id="form1" runat="server" onsubmit="return login(this);">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        &nbsp;<asp:TextBox ID="memberAccount" runat="server" class="form-control" placeholder="輸入帳號"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        &nbsp;<asp:TextBox ID="memberPwd" runat="server" class="form-control" placeholder="密碼" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group" style="padding-top: 200px">
                                    <div class="col-sm-12">
                                        <asp:Button ID="btnlogin" runat="server" Text="登入" class="btn btn-success" OnClick="btnlogin_Click" />
                                        &nbsp;&nbsp;<asp:CheckBox ID="auto" runat="server" class="btn btn-info" Text="一周內自動登入" />
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                    <div class="panel-footer">
                        <label>還沒有帳號？</label>
                        <label><a href="RegisterMember.aspx">註冊</a></label>
                    </div>
                </div>
            </div>
        </div>

        <div style="height:50px"></div>

        <!-- content -->
       <%-- <footer id="fh5co-footer" role="contentinfo">

            <div class="container">

                <div class="col-md-12 fh5co-copyright text-center">
                </div>

            </div>
        </footer>--%>
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

</body>
</html>
