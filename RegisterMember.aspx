<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterMember.aspx.cs" Inherits="RegisterMember" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>會員註冊</title>

    <!-- Animate.css -->
    <link rel="stylesheet" href="css/animate.css" />
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="css/icomoon.css" />
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="css/bootstrap.css" />
    <!-- Flexslider  -->
    <link rel="stylesheet" href="css/flexslider.css" />
    <!-- Owl Carousel  -->
    <%--<link rel="stylesheet" href="css/owl.carousel.min.css"/>--%>
    <link rel="stylesheet" href="css/owl.theme.default.min.css" />
    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css" />

    <!-- Modernizr JS -->
    <script src="js/modernizr-2.6.2.min.js"></script>

    <style type="text/css">
        .auto-style1 {
            text-align: right;
            width: 314px;
        }
    </style>
    <script type="text/javascript">
        function register(form) {
            if (form.MemberAccount.value == "") {
                alert("帳號不能空白");
                return false;
            }
            if (form.password1.value == "") {
                alert("密碼不能空白");
                return false;
            }
            if (form.password2.value == "") {
                alert("確認密碼不能空白");
                return false;
            }
            if (form.password2.value !== form.password1.value) {
                alert("密碼與確認密碼不相符");
                return false;
            }

            if (form.txtname.value == "") {
                alert("名字不能空白");
                return false;
            }
            if (form.txtEmail.value.search(/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/) != -1) {

            } else {
                alert("Email 資料錯誤？請重新輸入！");
                document.form.txtEmail.focus();
            }
        }
        function previewFile() {
            var preview = document.querySelector('#<%=Avatar.ClientID %>');
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
    </script>




</head>
<body>

    <div id="fh5co-page" style="background-image: url(images/dogNew4.jpg); background-attachment: fixed; background-repeat: no-repeat">
        <header id="fh5co-header" role="banner">
            <div class="container">
                <div class="header-inner">
                    <h1><a href="index.aspx">iPetGo</a></h1>

                    <nav role="navigation">
                        <ul>

                            <li><a href="#">會員註冊</a></li>
                            <li><a href="login.aspx">會員登入</a></li>

                        </ul>
                    </nav>
                </div>
            </div>
        </header>
        <div>
            <div style="width:90%; padding-left: 500px">
                <!-- Basic Form -->
                <div class="panel panel-primary">
                    <div class="panel-heading text-center" style="font-size: 24px">會員註冊</div>
                    <div class="panel-body">
                        <form id="form1" runat="server" onsubmit="return register(this);">

                            <div class="form-group">
                                會員帳號&nbsp; 
                       <asp:TextBox CssClass="form-control" ID="MemberAccount" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                密碼
                         <asp:TextBox CssClass="form-control" ID="password1" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                確認密碼
                       <asp:TextBox CssClass="form-control" ID="password2" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                名字
                     <asp:TextBox CssClass="form-control" ID="txtname" runat="server"></asp:TextBox>

                            </div>
                            <div class="form-group">
                                性別
                  <asp:RadioButtonList CssClass="form-control" ID="rdbSex" runat="server" RepeatDirection="Horizontal">
                      <asp:ListItem Selected="True">男</asp:ListItem>
                      <asp:ListItem>女</asp:ListItem>
                  </asp:RadioButtonList>
                            </div>
                            <div class="form-group">
                                Email
                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"></asp:TextBox>

                            </div>
                            <div class="form-group">
                                上傳圖片&nbsp; 
                       <asp:FileUpload CssClass="form-control" ID="fileUpload1" runat="server" onchange="previewFile()" />
                                <asp:Image ID="Avatar" runat="server" Height="225px" ImageUrl="~/Memberpic/emoticon.png" Width="225px" />
                            </div>

                            <asp:Button ID="btnRegister" runat="server" Text="註冊" class="btn btn-primary" OnClick="btnRegister_Click" />


                        </form>
                    </div>
                </div>

            </div>
        </div>

    </div>

    <!-- jQuery -->
    <%--<script src="js/jquery.min.js"></script>--%>

    <!-- jQuery Easing -->
    <script src="js/jquery.easing.1.3.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Waypoints -->
    <script src="js/jquery.waypoints.min.js"></script>
    <!-- Flexslider -->
    <script src="js/jquery.flexslider-min.js"></script>
    <!-- Stellar -->
    <%-- <script src="js/jquery.stellar.min.js"></script>--%>

    <!-- MAIN JS -->
    <script src="js/main.js"></script>

</body>
</html>
