using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PetShop_Default : System.Web.UI.Page
{
    ShopMallFactory factory = new ShopMallFactory();
    string htmlcode = "";
    int productid = 0;
    int memberid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        htmlcode = factory.showproductIndex(1, 3);//寵物食品隨機取3樣
        webcontent.InnerHtml = htmlcode;
        

    }

 protected void btnAddtocart_Click(object sender, EventArgs e)
    {
       
        if (Session[Dictionary.SK_productid] != null)
             productid = (int)Session[Dictionary.SK_productid];

        kProduct product = factory.QueryProduct(productid);//找到購買的產品
        CartItem item = new CartItem();
        if (Session[Dictionary.SK_memberId] != null)
        {
            memberid = (int)Session[Dictionary.SK_memberId];
            item.MemberId = memberid;
            item.ProductId = product.id;
            item.Productname = product.name;
            item.Qty = Convert.ToInt32(txtNum.Text);
            item.Price = product.price;
            //目前購物車沒這項商品，加進購物車
            CartItem cart = factory.CartitemExit(memberid, productid);
            if (cart == null)
            {
                int i = factory.AddtoCart(item);
                if (i < 1)
                   // Response.Write("加入購物車失敗");
                Response.Write("<Script language='JavaScript'>alert('加入購物車失敗');</Script>");
             else
                    Response.Write("<Script language='JavaScript'>alert('加入購物車成功');</Script>");
            }
            else
            {
                //購物車有這項商品 update
                cart.Qty = cart.Qty + item.Qty;
                int i = factory.CartItemUpdate(cart);
                if (i < 1)
                    //Response.Write("加入購物車失敗");
                Response.Write("<Script language='JavaScript'>alert('加入購物車失敗');</Script>");

            }



        }
        else
            Response.Redirect("Petshopmall.aspx");

        






    }
}