using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class igupload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        String fileName = "";
        try
        {
            HttpPostedFile file = Request.Files.Count > 0 ? Request.Files[0] : null;
            if (file == null)
            {
                Response.Output.Write("No file found");
                Response.Output.Close();
                return;
            }
            else
            {
                string newFileName = Guid.NewGuid().ToString() + ".jpg";
                fileName = newFileName;
                file.SaveAs(Server.MapPath("~/igimage/") + newFileName);
                //Response.Output.Write("Success");
                //Response.Output.Close();
                //return;
            }
        }
        catch (Exception ex)
        {
            Response.Output.Write("Error:{0}", ex.ToString());
            Response.Output.Close();
            return;
        }

        String memberid = Request.Params["memberid"];
        String message = Request.Params["message"];
        DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        String storePath = "../igimage/" + fileName;
        int likeAmount = 0;
        ArrayList eventList = new ArrayList();

        SqlConnectionStringBuilder scsb;
        scsb = new SqlConnectionStringBuilder();
        scsb.DataSource = "ipetgo.database.windows.net";
        scsb.InitialCatalog = "IPETGODATABASE";
        scsb.UserID = "IPGDATABASE";
        scsb.Password = "P@ssw0rd";

        SqlConnection con = new SqlConnection(scsb.ToString());
        con.Open();
        string strSQL = "insert into tIG values('" + memberid + "','" + storePath + "', N'" + message + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "','" + likeAmount + "');";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.ExecuteNonQuery();
        con.Close();

        SqlConnection con2 = new SqlConnection(scsb.ToString());
        con2.Open();
        string strSQL2 = "SELECT IGid,MemberAccount,MemberImage,ImagePath,UserMessage,LikeIg FROM tIG t inner join Member m ON (t.MemberId = m.MemberId) where t.MemberId = '" + memberid + "' and ImagePath = '" + storePath + "'";
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