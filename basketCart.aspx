<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="basketCart.aspx.cs" Inherits="PetShop_Default" %>
<asp:Content ID="Content1"  ContentPlaceHolderID="head" runat="Server">
     <!-- styles -->
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/animate.min.css" rel="stylesheet" />
    <link href="css/owl.carousel.css" rel="stylesheet" />
    <link href="css/owl.theme.css" rel="stylesheet" />
    <!-- theme stylesheet -->
    <link href="css/style.default.css" rel="stylesheet" id="theme-stylesheet" />

    <!-- your stylesheet with modifications -->
    <link href="css/custom.css" rel="stylesheet" />
     <script src="js/jquery.min.js"></script>
     <%--<script src="js/respond.min.js"></script>--%>
    </asp:Content>
<asp:Content  ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
   

   
    
    
    <!-- Owl Carousel  -->
    <%--<link rel="stylesheet" href="css/owl.carousel.min.css" />--%>
    
    

   
    <style>
        .table1{ 
    width:1000px;
    table-layout:fixed;  /*固定欄寬*/
    word-wrap:break-word;   
    overflow:hidden;
                 }
/*欄位寬也要設定*/ 
.table1 th {
    width:20%; 
} 
 .table1 td{
   width:100px;
   word-wrap:break-word;
   font-size:20px
}
        .trash {
   background:url(../images/trash.png);
    background-repeat: no-repeat;
    width:32px;
    height:32px;
     
     border: none;
     font-size: 1em;
    color: transparent;
        }

    </style>


    <!-- *** NAVBAR END *** -->

    <div id="all">
        <p class="lead"></p>
        <div id="content">
            <div class="container">

                

                <div class="col-md-9" id="basket" style="width:100%">

                    <div class="box">

                        <%--<form method="post" action="checkout1.aspx">--%>

                            <h1>購物車</h1>
                            
                           

                           <table class="table1">
                                      
                                       
                                        <tr>
                                            <td style="width:500px"><h4>產品名稱</h4></td>
                                            <td><h4>數量</h4></td>
                                            <td><h4>價格</h4></td>
                                            <td><h4>小計</h4></td>
                                            <td>
                                              

                                               
                                            </td>
                                        </tr>
                                      
                                          
                                        </table>       
                               <!--清單-->
<%--                                                          <form action="basketCart.aspx" method="post">
                                      <input type="hidden" name="id" value="3"/>
                                      <table class="table1">
                                       <tr>
                                            <td style="width:500px">產品名稱
                                            </td>
                                            <td>
                                               數量
                                            </td>
                                            <td>價格</td>
                                            <td>小計</td>
                                            <td>
                                                <input name="action" type="submit" value="delete" class="trash" />
                                             </td>
                                        </tr>
                                       </table>                          
                                  </form>--%>
                          <!--清單-->
                              <!--清單-->
                        <%--<form action="basketCart.aspx" method="post"><input type="hidden" name="id" value="3"/><table class="table1"><tr><td >產品名稱</td><td>數量</td><td>價格</td><td>小計</td><td><input type="submit" value="delete" class="trash" /></td></tr></table></form>--%>
                          <!--清單-->
                           <div id="webcontent" runat="server"></div>

                            
                            <!-- /.table-responsive -->
                        <form runat="server">
                            <div class="box-footer">
                                 <div align="center">
                                    <label>總計:
                                        <asp:TextBox ID="txtTotal" runat="server" Enabled="False"></asp:TextBox>
                                    </label>

                                </div>
                                <div class="pull-left">
                                    <a href="Petshopmall.aspx" class="btn btn-default"><i class="fa fa-chevron-left"></i>繼續購物</a>
                                </div>

                               
                                <div class="pull-right">
                                    
                                    <a href="checkout.aspx" class="btn btn-primary"><i class="fa fa-chevron-right"></i>結帳</a>
                                </div>
                            </div>

                        </form>

                    </div>



                </div>


            </div>
            <!-- /.col-md-3 -->

        </div>
        <!-- /.container -->
    </div>


  
  
   
    
  <%--  <script src="js/jquery.cookie.js"></script>--%>
   <%-- <script src="js/waypoints.min.js"></script>--%>
  <%--  <script src="js/modernizr.js"></script>--%>
   <%-- <script src="js/bootstrap-hover-dropdown.js"></script>--%>
   <%-- <script src="js/owl.carousel.min.js"></script>--%>
    <%--<script src="js/front.js"></script>--%>

</asp:Content>

