using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PetShop_Default : System.Web.UI.Page
{
    ShopMallFactory factory = new ShopMallFactory();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string htmlcode = "";
        int type = Convert.ToInt32(Request.QueryString["_id"]);
        htmlcode = factory.showproductList(Request, Response, type);
        webcontent.InnerHtml = htmlcode;
        

    }
}