using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class iPetGo_Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = "";
        GridView1.PagerSettings.Visible = false;
        GridView1.PageSize = 100;
        DataView dv = (new Orders()).dataviewForSearch(KeyWord.Text);
        GridView1.DataSource = dv;
        GridView1.DataBind();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            GridView1.DataSourceID = SqlDataSource1.ID;
            GridView1.DataBind();
            return;
        }
        GridView1.DataSourceID = "";
        GridView1.PagerSettings.Visible = false;
        GridView1.PageSize = 100;
        DataView dv = (new Orders()).SeachOrderStatus(DropDownList1.SelectedItem.Text);
        GridView1.DataSource = dv;
        GridView1.DataBind();
    }


}