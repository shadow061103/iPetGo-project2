using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        (new Orders()).m已付款(Request.QueryString["o_id"], txt輸入後五碼.Text);
        Response.Redirect("MembersOrder.aspx");
    }
}