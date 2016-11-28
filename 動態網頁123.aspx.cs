using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class 動態網頁123 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string str =
   "Please enter your name:<br/>" +
   "<input type='text' name='userName'/>";

        string test = @"Please enter your name:<br/>
   <input type='text' name='userName'/>
   <input type='text' name='userName'/>
   <input type='text' name='userName'/>
   <input type='text' name='userName'/>
";
        webcontent.InnerHtml = str;
    }
    public void testWeb() {

        SqlConnectionStringBuilder scsb;
        scsb = new SqlConnectionStringBuilder();
        scsb.DataSource = ".";
        scsb.InitialCatalog = "iPetGo";
        scsb.IntegratedSecurity = true;
        SqlConnection con = new SqlConnection(scsb.ToString());
        con.Open();
        string strsql = "select * from Member";
        SqlCommand cmd = new SqlCommand(strsql, con);

        SqlDataReader reader = cmd.ExecuteReader();
        Response.Write("<table><tr><th>會員編號</th><th>會員帳號</th><th>密碼</th><th>姓名</th><th>性別</th><th>郵件</th><th>權限</th></tr>");

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                Response.Write("<tr>");
                Response.Write("<td>" + reader.GetInt32(0) + "</td>");
                Response.Write("<td>" + reader.GetString(1) + "</td>");
                Response.Write("<td>" + reader.GetString(2) + "</td>");
                Response.Write("<td>" + reader.GetString(3) + "</td>");
                Response.Write("<td>" + reader.GetString(4) + "</td>");
                Response.Write("<td>" + reader.GetString(5) + "</td>");
                Response.Write("<td>" + reader.GetInt32(6) + "</td>");
                Response.Write("</tr>");
            }

        }
        Response.Write("</table>");
        reader.Close();
        con.Close();
    
    
    }
}