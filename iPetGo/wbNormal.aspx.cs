using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
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
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = WebConfigurationManager.ConnectionStrings["iPetGoAzureConnectionString"].ConnectionString;
        sds.SelectCommand = "select m.MemberId,m.MemberAccount,m.MemberName,m.sex,m.MemberEmail,r.fRight,r.fId "+
                                "from Member m inner join tRight r on m.fRight = r.fId "+
                                "where m.MemberAccount LIKE @account OR m.MemberName LIKE @account OR m.MemberEmail LIKE @account";
        sds.SelectParameters.Add("account", "%"+SearchKey.Text+ "%");
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;
        GridView1.DataSource = dv;
        GridView1.DataBind();
    }
}