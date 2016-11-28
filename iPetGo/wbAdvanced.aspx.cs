using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

public partial class iPetGo_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = "";
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = WebConfigurationManager.ConnectionStrings["iPetGoAzureConnectionString"]
            .ConnectionString;
        sds.SelectCommand = "select * from avTable where MemberAccount LIKE @account OR MemberName LIKE @account";
        sds.SelectParameters.Add("account", "%" + TextBox1.Text + "%");
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;
        GridView1.DataSource = dv;
        GridView1.DataBind();
    }
}