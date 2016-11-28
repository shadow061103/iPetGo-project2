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

public partial class jsonaroundpet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String myName = Request.QueryString["name"];
        String myNum = Request.QueryString["num"];
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
        string strSQL = "select m.MemberId,MemberAccount,MemberName,MemberEmail,MemberImage,longitude,latitude from[Member] m inner join[tGPS] g on (m.MemberId = g.MemberId)";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        //cmd.Parameters.AddWithValue(@"MemberId", myName);
        SqlDataReader reader = cmd.ExecuteReader();
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