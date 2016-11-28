<%@ Page Title="" Language="C#" MasterPageFile="~/ShopMaster.master" AutoEventWireup="true" CodeFile="ProductDetail.aspx.cs" Inherits="PetShop_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     
     <form id="form" runat="server">
      <%
       
        ShopMallFactory factory=new ShopMallFactory();
        int productid = Convert.ToInt32(Request.Form["id"]);
        if (productid != 0)
            Session[Dictionary.SK_productid]=productid;

        int id = (int)Session[Dictionary.SK_productid];

        kProduct product = factory.QueryProduct(id);
         %>
    <div class="col-md-6" >
        <p class="lead"></p>
        <!--圖片要改-->
        <img src="<%=product.image %>" class="" width="535" height="440" />
    </div>

   
      
        <p class="lead"></p>
        <div class="col-md-3">
            <div class="form-group">
                <label>商品名稱</label>
                <h3 style="font-weight:bold;font-family:Microsoft JhengHei;"><%=product.name %></h3>
                <br />

                <label>商品價格</label>
                 <h3 style="font-family:Microsoft JhengHei;color:#FF0000">NT<%=product.price %></h3>
                <br />
                <label>運送方式</label>
                <h3 style="font-weight:bold;font-family:Microsoft JhengHei;">宅配</h3>
                <br/>
                <label>購買數量</label>
                <asp:TextBox ID="txtNum" runat="server" CssClass="form-control" TextMode="Number"  min="1" max="99" step="1" Style="background-color:#F3F7B4;" >1</asp:TextBox>
                <br />
                <asp:Button ID="btnAddtocart" runat="server" Text="加入購物車" CssClass="btn btn-info" OnClientClick="return countClick()" OnClick="btnAddtocart_Click" />
            </div>

        </div>
         
        <div class="col-md-9">
            <p class="lead"></p>
            <h4><label>商品簡介</label></h4>
            <label><%=product.description %></label>
          </div>
          </form>
    <div class="col-md-3"><!--佔個版面哈哈哈-->
        </div>
      <div class="col-md-9">
            <br />
            <h4><label>其他產品推薦</label></h4>
             <div class="tab-content">

                    <div role="tabpanel" class="tab-pane active" id="myOrder">
                       
                        
                        <!--商品1-->
                    <%-- <form action="ProductDetail.aspx" method="post">
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
                         <div id="webcontent" runat="server"></div>
                    </div>
                 
         </div>
  </div>

    <script type="text/javascript">
        
        function countClick() {
            var tb3 = document.getElementById('<%=txtNum.ClientID%>').value;

            if (tb3 == "") {
                alert("請輸入購買數量!");       
                return false;
            }

            else if (tb3 <= 0){
                alert("請輸入正確的購買數量");
                return false;
            }
        }

       
       
    </script>
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
    <script src="js/jquery.min.js"></script>
</asp:Content>

