<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkout4.aspx.cs" Inherits="PetShop_checkout4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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

    <!-- Bootstrap  -->
    <link rel="stylesheet" href="css/bootstrap.css" />
    <!-- Flexslider  -->
    <link rel="stylesheet" href="css/flexslider.css" />
    <!-- Owl Carousel  -->
    <link rel="stylesheet" href="css/owl.carousel.min.css" />
    <link rel="stylesheet" href="css/owl.theme.default.min.css" />
    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css" />
    <script src="js/jquery.min.js"></script>
    <script src="js/respond.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/modernizr.js"></script>
    <script src="js/bootstrap-hover-dropdown.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/front.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
   
     <div id="all">

        <div id="content">
             <form method="post" action="checkout4.aspx" runat="server">
                  <%  kOrderMain detail=new kOrderMain();
        kMember member=new kMember();
        ShopMallFactory factory = new ShopMallFactory();
        if(Session[Dictionary.SK_memberInfo]!=null)
            member=(kMember)Session[Dictionary.SK_memberInfo];
        if (Session[Dictionary.SK_ordermain] != null)
            detail = (kOrderMain)Session[Dictionary.SK_ordermain];
            
          %>
            <div class="container">
               
                

                <div class="col-md-9" id="checkout">

                    <div class="box">
                        
                            <h1>確認訂單</h1>
                            

                            <div class="content">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th colspan="4">產品</th>
                                                <th>數量</th>
                                                <th>單價</th>
                                                
                                                <th>小計</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!--商品-->
<%--<tr><td colspan="4">產品名字</td><td>數量</td><td>價錢</td><td>小計</td></tr>--%>
                                             <!--商品-->
                                             <%=factory.checkCartList(member.MemberId) %>
                                            
                                        </tbody>
                                      
                                    </table>

                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.content -->
                            <div>
							<label>名字:</label><%=detail.OrderName %><br/>
							<label>地址：</label><%=detail.Address %><br/>
							
							<label>手機：</label><%=detail.Phone %><br/>
							<label>EMAIL:</label><%=member.MemberEmail%><br/>
							<label>運送方式：</label>宅配<br/>
						    <label>付款方式：</label><%=detail.Payment %><br/>
							</div>
                            <div class="box-footer">
                                <div class="pull-left">
                                    <a href="checkOut.aspx" class="btn btn-default"><i class="fa fa-chevron-left"></i>返回上頁</a>
                                </div>
                                <div class="pull-right">

                                    <asp:Button ID="btnFinish" class="btn btn-primary" runat="server" Text="完成訂單" OnClick="btnFinish_Click" /><i class="fa fa-chevron-right"></i>
                                    
                                </div>
                            </div>
                      
                    </div>
                    <!-- /.box -->


                </div>
                <!-- /.col-md-9 -->

                <div class="col-md-3">

                    <div class="box" id="order-summary">
                        <div class="box-header">
                            <h3>訂單總覽</h3>
                        </div>
                        <p class="text-muted">運費一律以宅配的物流公司定價金額計算。</p>

                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                     <tr>
                                        <td>訂單小計 </td>
                                        <th>NT$<%=factory.CartAmount(member.MemberId) %></th>
                                    </tr>
                                    <tr>
                                        <td>運費</td>
                                        <th>NT$100</th>
                                    </tr>
                                    <tr class="total">
                                        <td>總計</td>
                                        <th>NT$<%=factory.CartAmount(member.MemberId)+100 %></th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>
            </div>
            <!-- /.container -->
           </form>
        </div>
       
    </div>

    
</asp:Content>

