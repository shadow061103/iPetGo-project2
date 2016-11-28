<%@ Page Title="" Language="C#" MasterPageFile="~/ShopMaster.master" AutoEventWireup="true" CodeFile="petShopClass.aspx.cs" Inherits="PetShop_Default" %>

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
        <p class="h3"></p>
            
                                 <!--商品1-->
                      <%-- <form action="ProductDetail.aspx" method="post">
                        <div class="col-sm-4 col-lg-4 col-md-4">
                            <div class="thumbnail">
                                <img src="../img/da4f022f-f922-42e2-ae1e-c5b5d5f7837c.jpg" alt="" style="width: 320px; height: 200px">
                                <div class="caption" style="height: 130px">
                                    <h4 class="pull-right">NT500</h4>
                                    <input type="hidden" name="id" value="3"/>
                                    <input  type="submit" name="action" class='linkButton wrap' value="【娜莎廚房】自製寵物零食DIY 原味雞胸肉片。食譜"/>
                                </div>
                               
                            </div>
                        </div>
                             </form>--%>
                        <!--商品-->

        <%-- <label style = 'font-size:larger' > 此種類商品尚未上架，請耐心等候!</ label >--%>
                               <div id="webcontent" runat="server"></div>

        </div>
    <script src="js/jquery.min.js"></script>
</asp:Content>

