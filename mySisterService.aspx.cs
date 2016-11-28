using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mySisterService2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();
        GridView2.DataSource = SqlDataSource2;
        GridView2.DataBind();
    }





    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            if (Convert.ToInt32(e.Row.Cells[7].Text) > 0)
                e.Row.Cells[0].Text ="已評價";

            GridView2.Columns[0].ItemStyle.Width = 60;
            GridView2.Columns[1].ItemStyle.Width = 100;
            GridView2.Columns[1].ItemStyle.Wrap = true;
            GridView2.Columns[2].ItemStyle.Width = 100;
            GridView2.Columns[3].ItemStyle.Width = 80;
            GridView2.Columns[4].ItemStyle.Width = 100;
            GridView2.Columns[4].ItemStyle.Wrap = true;
            GridView2.Columns[5].ItemStyle.Width = 100;
            GridView2.Columns[5].ItemStyle.Wrap = true;
            GridView2.Columns[6].ItemStyle.Width = 80;
            GridView2.Columns[7].ItemStyle.Width = 70;
            GridView2.Columns[8].ItemStyle.Width = 400;
            GridView2.Columns[8].ItemStyle.Wrap = true;
        }
    }
}