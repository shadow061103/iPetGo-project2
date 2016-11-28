using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class News : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.DataSource = SqlDataSource1;
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewsPostings.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        //GridView2.DataSource = sds.Select(DataSourceSelectArguments.Empty);
        //GridView2.DataBind();
    }

    private string getSelecteSql(string s)
    {
        string sql = "SELECT * FROM [tArticle] a inner join [Member] m on a.MemberId = m.MemberId WHERE fType=N'" + s + "'";

        return sql;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            return;
        }
       

        SqlDataSource sds = new SqlDataSource();
        //sds.ConnectionString = @"Data Source=.;Initial Catalog=iPetGo;Integrated Security=True";
        sds.ConnectionString = @"Data Source=ipetgo.database.windows.net;Initial Catalog=IPETGODATABASE;User ID=IPGDATABASE;Password=P@ssw0rd";
        sds.SelectCommand = getSelecteSql(DropDownList1.SelectedValue);
        GridView1.DataSource = sds.Select(DataSourceSelectArguments.Empty);
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
    }
}