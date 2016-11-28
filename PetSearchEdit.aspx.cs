using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegisterMember : System.Web.UI.Page
{
    string memberAccount = "";
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    

    
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (Session[Dictionary.SK_memberAccount] != null)
        {
            memberAccount = (string)Session[Dictionary.SK_memberAccount];
            e.Command.Parameters["@MemberAccount"].Value = memberAccount;
        }
    }
}
