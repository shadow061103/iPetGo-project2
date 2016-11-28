using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PetShop_Default : System.Web.UI.Page
{
    ShopMallFactory factory = new ShopMallFactory();
    string htmlcode1 = "";
    string htmlcode2 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        htmlcode1 = factory.showproductIndex(1,6);
        webcontent1.InnerHtml = htmlcode1;
        htmlcode2 = factory.showproductIndex(2,6);
        webcontent2.InnerHtml = htmlcode2;
    }
}