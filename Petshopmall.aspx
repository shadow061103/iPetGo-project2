<%@ Page Title="" Language="C#" MasterPageFile="~/ShopMaster.master" AutoEventWireup="true" CodeFile="PetShopmall.aspx.cs" Inherits="PetShop_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <style>

       .linkButton {
           background: none;
           border: none;
           color: #AA7700;
           width: 250px;
           cursor: pointer;
       }
      .wrap { 
          white-space: normal;
          width: 130px;
          text-align:left;
      }
}
   </style>
    <div class="col-md-9">
        <p class="lead"></p>
        <div class="row carousel-holder">

            <div class="col-md-12">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img class="img-rounded" src="http://aronpetfood.com/wp-content/uploads/2013/10/banner01.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-rounded" src="http://www.everythingunscripted.com/wp-content/uploads/2015/09/775505_24a6cb5265a2dd38cd60137233622930.png" alt="">
                        </div>
                        <div class="item">
                            <img class="img-rounded" src="http://www.cbpetfoodandsupplies.com/images/header/rotation/fromm-dog-food-whitefish.jpg" alt="">
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <p></p>

        <div class="col-md-9 container" style="width: 100%">
            <div role="tabpanel">

                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#myOrder" aria-controls="myOrder" role="tab" data-toggle="tab">熱門寵物食品</a>
                    </li>
                    <li role="presentation">
                        <a href="#ServerIng" aria-controls="ServerIng" role="tab" data-toggle="tab">熱門寵物用品</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">

                    <div role="tabpanel" class="tab-pane active" id="myOrder">
                       
                        <!--商品1-->
<%--                         <form action="ProductDetail.aspx" method="post">
                        <div class="col-sm-4 col-lg-4 col-md-4">
                            <div class="thumbnail">
                                <img src="../img/da4f022f-f922-42e2-ae1e-c5b5d5f7837c.jpg" alt="" style="width: 320px; height: 200px">
                                <div class="caption" style="height: 130px">
                                    <h4 class="pull-right">價格500</h4>
                                    <input type="hidden" name="id" value="3"/>
                                    <input  type="submit" name="action" class='linkButton wrap' value="【娜莎廚房】自製寵物零食DIY 原味雞胸肉片。食譜"/>
                                </div>
                               
                            </div>
                        </div>
                             </form>--%>
                        <!--商品-->
                         <!--商品1-->
<%--<form action="ProductDetail.aspx" method="post"><div class="col-sm-4 col-lg-4 col-md-4"><div class="thumbnail"><img src="../img/da4f022f-f922-42e2-ae1e-c5b5d5f7837c.jpg" alt="" style="width: 320px; height: 200px"><div class="caption" style="height: 130px"><h4 class="pull-right">價格500</h4><input type="hidden" name="id" value="3"/><input  type="submit" name="action" class='linkButton wrap' value="【娜莎廚房】自製寵物零食DIY 原味雞胸肉片。食譜"/></div></div></div></form>--%>
                        <!--商品-->
                       <div id="webcontent1" runat="server"></div>
                      

                    </div>


                    <div role="tabpanel" class="tab-pane" id="ServerIng">
                       
                         
                        <!--商品2-->
                        <%-- <form action="ProductDetail.aspx" method="post">
                        <div class="col-sm-4 col-lg-4 col-md-4">
                            <div class="thumbnail">
                                <img src="../img/da4f022f-f922-42e2-ae1e-c5b5d5f7837c.jpg" alt="" style="width: 320px; height: 150px">
                                <div class="caption" style="height: 80px">
                                    <h4 class="pull-right">價格500</h4>
                                    <input type="hidden" name="id" value="3"/>
                                    <input  type="submit" name="action" class='linkButton' value="貓糧" />
                                </div>
                               
                            </div>
                        </div>
                             </form>--%>
                        <!--商品-->
                       <div id="webcontent2" runat="server"></div>

                    </div>

                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery.min.js"></script>
</asp:Content>

