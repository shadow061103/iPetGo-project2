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

public partial class jsonnewscomment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        String myName = Request.QueryString["id"];
        String igid = Request.Params["igid"];
        String message = Request.Params["message"];

        String memberid = Request.Params["memberid"];
        DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

        //Response.Write(message);

        ArrayList eventList = new ArrayList();
        
        if (Request.HttpMethod == "POST")
        {
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
            string strSQL = "insert into tComment values('" + igid + "','" + memberid + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "', N'" + message + "');";
            SqlCommand cmd = new SqlCommand(strSQL, con);

            cmd.ExecuteNonQuery();

            con.Close();
        }
        /*
        //test post parameters
        Hashtable ht = new Hashtable();
        if (igid != null)
        {
            ht.Add("igid", igid);
            ht.Add("message", message);
            ht.Add("memberid", memberid);
            ht.Add("time", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
            eventList.Add(ht);
        }


        JavaScriptSerializer ser = new JavaScriptSerializer();
        String jsonStr = ser.Serialize(eventList);
        Response.Write(jsonStr);
        */


        //if (Request.HttpMethod == "GET")
        if (Request.HttpMethod == "GET")
        {     

            //1.先從資料庫讀資料
            SqlConnectionStringBuilder scsb;
            scsb = new SqlConnectionStringBuilder();
            scsb.DataSource = "ipetgo.database.windows.net";
            scsb.InitialCatalog = "IPETGODATABASE";
            scsb.UserID = "IPGDATABASE";
            scsb.Password = "P@ssw0rd";

            SqlConnection con = new SqlConnection(scsb.ToString());
            con.Open();
            //string strSQL = "select*from AdvancedMember where MemberId=@MemberId";
            string strSQL = "SELECT fArticleId,MemberAccount,fCommentId,fContent FROM tComment t inner join Member m on t.MemberId = m.MemberId where fArticleId = N'" + myName + "' order by fCommentId;";
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
}