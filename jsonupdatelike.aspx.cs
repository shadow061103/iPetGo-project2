using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class jsonupdatelike : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        String igid = Request.Params["igid"];
        String like = Request.Params["like"];

        ArrayList eventList = new ArrayList();

        //String account = "a001";
        SqlConnectionStringBuilder scsb;
        scsb = new SqlConnectionStringBuilder();
        scsb.DataSource = "ipetgo.database.windows.net";
        scsb.InitialCatalog = "IPETGODATABASE";
        scsb.UserID = "IPGDATABASE";
        scsb.Password = "P@ssw0rd";

        // SqlConnection con = new SqlConnection(scsb.ToString());
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        con.Open();
        //string strSQL = "select*from AdvancedMember where MemberId=@MemberId";
        //string strSQL = "select * from Member where MemberAccount = '" + account + "'";
        String strSQL = "update tIG set LikeIg='" + like + "' where IGId='" + igid + "'";

        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.ExecuteNonQuery();

        con.Close();
    }
}