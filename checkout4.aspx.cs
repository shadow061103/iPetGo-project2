using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PetShop_checkout4 : System.Web.UI.Page
{
    ShopMallFactory factory = new ShopMallFactory();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnFinish_Click(object sender, EventArgs e)
    {
        if (Session[Dictionary.SK_ordermain] != null&&
            Session[Dictionary.SK_memberId]!=null) {
            int memberid= (int)Session[Dictionary.SK_memberId];
            kOrderMain odermain = (kOrderMain)Session[Dictionary.SK_ordermain];
            odermain.MemberId = memberid;
            odermain.OrderDate = DateTime.Now.ToString("yyyy/MM/dd");
            odermain.Total = factory.CartAmount(memberid);
            odermain.Status = "未付款";
            int i = factory.Insertordermain(odermain);//新增訂單主檔
            if (i > 0) {
                int orderId =factory.getOrderid(memberid);//取得主檔編號
                List<CartItem> cart = factory.getCartItem(memberid);
                foreach(CartItem item in cart){
                    factory.InsertCartdetil(item, orderId);
                }
              
                    factory.deleteCartAll(memberid);//刪除購物車內所有商品
                    Response.Redirect("Petshopmall.aspx");
                
            }
                else
               // Response.Write("失敗，請確認購物車內是否有商品");
            Response.Write("<Script language='JavaScript'>alert('失敗，請確認購物車內是否有商品');</Script>");
        
        }
    }
}