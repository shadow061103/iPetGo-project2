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

public partial class jsonpostnews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //String myName = Request.QueryString["id"];
        ArrayList eventList = new ArrayList();
        String message = Request.Params["message"];
        String title = Request.Params["title"];
        String type = Request.Params["type"];

        String memberid = Request.Params["memberid"];
        DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

        if (title == "" || message == "")
        {
            return;
        }

        SqlConnectionStringBuilder scsb;
        scsb = new SqlConnectionStringBuilder();
        scsb.DataSource = "ipetgo.database.windows.net";
        scsb.InitialCatalog = "IPETGODATABASE";
        scsb.UserID = "IPGDATABASE";
        scsb.Password = "P@ssw0rd";

        //SqlConnection con = new SqlConnection(scsb.ToString());
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
           .ConnectionString);
        con.Open();
        //string strSQL = "insert into tMessage values('" + "4" + "','" + "5" + "', N'" + "ohno~~~" + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "')";
        string strSQL = "insert into tArticle values('" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "', N'" + title + "', N'" + message + "', '" + memberid + "', N'" + type + "');";
        SqlCommand cmd = new SqlCommand(strSQL, con);

        cmd.ExecuteNonQuery();
        con.Close();

        SqlConnection con2 = new SqlConnection(scsb.ToString());
        con2.Open();
        string strSQL2 = "select*from tArticle where fTitle=N'" + title + "' and MemberId='"+ memberid+"'";
        SqlCommand cmd2 = new SqlCommand(strSQL2, con2);
        SqlDataReader reader = cmd2.ExecuteReader();
        //2.將讀取的資料轉成放入ArrayList
        while (reader.Read())
        {
            //Response.Write(reader.FieldCount);
            Hashtable ht = new Hashtable();
            for (int i = 0; i < reader.FieldCount; i++)
            {
                if (reader.GetValue(i) is DBNull)
                    ht.Add(reader.GetName(i), "");
                else
                    ht.Add(reader.GetName(i), reader.GetValue(i).ToString());
            }
            eventList.Add(ht);
        }

        reader.Close();
        con2.Close();

        //3.用JavaScriptSerializer 將 ArrayList 內的資料轉為陣列 回給client端

        JavaScriptSerializer ser = new JavaScriptSerializer();
        String jsonStr = ser.Serialize(eventList);
        Response.Write(jsonStr);

    }
}