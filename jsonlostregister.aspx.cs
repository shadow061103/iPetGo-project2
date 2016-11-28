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

public partial class jsonlostregister : System.Web.UI.Page
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
                file.SaveAs(Server.MapPath("~/petsearchpic/") + fileName);
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

        String memberAc = Request.Params["memberAc"];
        String comm = Request.Params["comm"];
        String phone = Request.Params["phone"];
        String petName = Request.Params["petName"];
        String petType = Request.Params["petType"];
        String petDescr = Request.Params["petDescr"];
        String lostArea = Request.Params["lostArea"];
        String lostAddress = Request.Params["lostAddress"];
        //String lostPoint = Request.Params["lostPoint"];
        String lostLat = Request.Params["lostLat"];
        String lostLon = Request.Params["lostLon"];
        String status = "協尋中";

        DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        String storePath = "../petsearchpic/" + fileName;

        ArrayList eventList = new ArrayList();

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
        string strSQL = "insert into tLosingPetCheckin values('" + memberAc + "',N'" + comm + "','" + phone + "',N'" + petName + "',N'" + petType + "',N'" + petDescr + "','" + storePath + "',N'" + lostArea + "',N'" + lostAddress + "','" + lostLat + "," + lostLon + "','" + lostLon + "','" + lostLat + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "',N'" + status + "');";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.ExecuteNonQuery();
        con.Close();

        SqlConnection con2 = new SqlConnection(scsb.ToString());
        con2.Open();
        string strSQL2 = "select*from tLosingPetCheckin where fPetPic='" + storePath + "'";
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