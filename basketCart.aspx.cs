using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PetShop_Default : System.Web.UI.Page
{ int memberid;
    string htmlcode = "";
    int total;
    ShopMallFactory factory = new ShopMallFactory();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[Dictionary.SK_memberId] != null)
        memberid = (int)Session[Dictionary.SK_memberId];
        int productid = Convert.ToInt32(Request.Form["id"]);

        if (Request["action"] == "delete")
        {

            factory.deleteCartitem(memberid, productid);
            Response.Write("<Script language='JavaScript'>alert('刪除成功');</Script>");

        }



        htmlcode = factory.showCartList(memberid);
        webcontent.InnerHtml = htmlcode;
         total = factory.CartAmount(memberid);
        txtTotal.Text =total.ToString();
    }
}