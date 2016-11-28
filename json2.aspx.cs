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

public partial class json2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*
        String day = DateTime.Now.ToString("yyyy-MM-dd");
        //String myTitle = Request.QueryString["title"];
        //String myTitle = Request.Params["title"];
        String myContent = Request.QueryString["content"];
        String myTitle = Request["title"];
        int myMemberID = 6;
        String myType = Request.QueryString["type"];


        Response.Output.Write(myTitle);
        */

        ///select IGid,t.MemberId,ImagePath,UserMessage,LikeIg,MemberAccount,MemberImage from tIG t inner join Member m on t.MemberId=m.MemberId where t.MemberId = 17!!!!!!
        ///
        String myType = Request.QueryString["type"];
        String account = Request.Params["mid"];

        ArrayList eventList = new ArrayList();

        //String account = "a001";
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
        //string strSQL = "select * from Member where MemberAccount = '" + account + "'";
        String strSQL = "select IGid,t.MemberId,ImagePath,UserMessage,LikeIg,MemberAccount,MemberName,MemberEmail,MemberImage from tIG t inner join Member m on t.MemberId=m.MemberId where t.MemberId = '" + account + "'";
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
                    ht.Add(reader.GetName(i).ToString(), reader.GetValue(i).ToString());
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