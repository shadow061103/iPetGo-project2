using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization; //JavaScriptSerializer 所要引用的命名
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class jsonlogin : System.Web.UI.Page
{
    MemberFactory m = new MemberFactory();
    protected void Page_Load(object sender, EventArgs e)
    {
        String myName = Request.Params["name"];
        //String myName = Request.QueryString["name"];
        String myNum = Request.Params["num"];
        //String myNum = Request.QueryString["num"];
        String myNumMD5 = m.GetMD5(myNum + m.key);


        ArrayList eventList = new ArrayList();


        //1.先從資料庫讀資料
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
        //string strSQL = "select*from AdvancedMember where MemberId=@MemberId";
        //string strSQL = "select * from Member where MemberAccount='@MemberAccount' and MemberPassword='@MemberAccount'";
        string strSQL = "select * from Member where MemberAccount='" + myName + "' and MemberPassword='" + myNumMD5 + "'";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        //cmd.Parameters.AddWithValue(@"MemberAccount", myName);
       // cmd.Parameters.AddWithValue(@"MemberPassword", myNum);
        SqlDataReader reader = cmd.ExecuteReader();
        //2.將讀取的資料轉成放入ArrayList
        /*
        if (reader.HasRows)
        {
            if (reader.Read()) {
                String s = reader.GetInt32(0).ToString();
            Response.Write(s);
        }
        }
        else
        {
            Response.Write("failed");
        }

        reader.Close();
        con.Close();
        */
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
        con.Close();

        //3.用JavaScriptSerializer 將 ArrayList 內的資料轉為陣列 回給client端

        JavaScriptSerializer ser = new JavaScriptSerializer();
        String jsonStr = ser.Serialize(eventList);
        Response.Write(jsonStr);
    }
}