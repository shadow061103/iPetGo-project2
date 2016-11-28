using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class iPetGo_Default : System.Web.UI.Page
{
    productFoctory factory = new productFoctory();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = "";
        GridView1.PagerSettings.Visible = false;
        GridView1.PageSize = 100;
        DataView dv= factory.SeachProduct(TextBox3.Text);
        GridView1.DataSource = dv;
        GridView1.DataBind();
        
    }



    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.DataSourceID = "";
        GridView1.PagerSettings.Visible = false;
        GridView1.PageSize = 100;
        DataView dv = factory.SeachProductType(DropDownList1.SelectedItem.Text);
        GridView1.DataSource = dv;
        GridView1.DataBind();
    }
}