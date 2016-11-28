<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MembersOrderPay.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- styles -->
    <link href="../css/font-awesome.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/animate.min.css" rel="stylesheet" />
    <link href="../css/owl.carousel.css" rel="stylesheet" />
    <link href="../css/owl.theme.css" rel="stylesheet" />
    <!-- theme stylesheet -->
    <link href="../css/style.default.css" rel="stylesheet" id="theme-stylesheet" />

    <!-- your stylesheet with modifications -->
    <link href="../css/custom.css" rel="stylesheet" />

    <!-- Bootstrap  -->
    <link rel="stylesheet" href="../css/bootstrap.css" />
    <!-- Flexslider  -->
    <link rel="stylesheet" href="../css/flexslider.css" />
    <!-- Owl Carousel  -->
    <link rel="stylesheet" href="../css/owl.carousel.min.css" />
    <link rel="stylesheet" href="../css/owl.theme.default.min.css" />
    <!-- Theme style  -->
    <link rel="stylesheet" href="../css/style.css" />

    <script src="../js/respond.min.js"></script>
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div id="all">

        <div id="content">
            <div class="container">
                <%if (Session["OrderID"] == null) { Response.Redirect("MembersOrder.aspx");} %>
                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li>編號<%=Session["OrderID"] %></li>
                    </ul>
                </div>
                <div id="all">
                    <p class="lead"></p>
                    <div id="content">
                        <div class="container">



                            <div class="col-md-9" id="basket" style="width: 100%">

                                <div class="box">

                                    <form id="form1" runat="server">

                                        <h1>付款確認系統</h1>
                                        <div class="table-responsive">
                                            <table class="auto-style2">
                                                <tr>
                                                    <td> 請輸入轉帳後五碼</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                            <asp:TextBox ID="txt輸入後五碼" runat="server" CssClass="form-control" Width="90%"></asp:TextBox></td>
                                                    <td><asp:Button ID="Button1" runat="server" Text="送出" CssClass="btn btn-primary" OnClick="Button1_Click" />

                                                    </td>
                                                </tr>
                                            </table>

                                        </div>
                                        <!-- /.table-responsive -->

                                    </form>

                                </div>



                            </div>


                        </div>
                        <!-- /.col-md-3 -->

                    </div>
                    <!-- /.container -->
                </div>


            </div>
            <!-- /.container -->
        </div>
    </div>

    <script src="js/jquery.min.js"></script>

</asp:Content>

