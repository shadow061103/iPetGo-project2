using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// IGFactory 的摘要描述
/// </summary>
public class IGFactory
{
    SqlConnectionStringBuilder scsb;
    public IGFactory()
    {
        scsb = new SqlConnectionStringBuilder();
        scsb.DataSource = ".";
        scsb.InitialCatalog = "iPetGoDataBase";
        scsb.IntegratedSecurity = true;
    }

    //取會員名字的
    public string takeMemberName(int MemberId)
    {
        string memberName = "";
        string strSQL = "select*from Member where MemberId=@MemberId";
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
        .ConnectionString);
        //SqlConnection con = new SqlConnection(scsb.ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId", MemberId);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                memberName = reader.GetString(3);
            }
        }
        reader.Close();
        con.Close();
        return memberName;
    }

 
    //秀全部全會員的IG
    public List<IG> showAllIG()
    {
        List<IG> allIG = new List<IG>();
        //List<int> memberids = new List<int>();
        //List<int> igids = new List<int>();
        //string strSQL = "select*from tIG order by IGId Desc";
        string strSQL = "select A.IGId ,A.MemberId,A.ImagePath,A.UserMessage,A.CreatDate,";
        strSQL += "B.LikeCount,C.MemberName ";
        strSQL += "from tIG AS A ";
        strSQL += "LEFT OUTER JOIN (select IGId, count(IGId) as LikeCount from tIGCountLike group by IGId) as B ";
        strSQL += "ON A.IGId = B.IGId ";
        strSQL += "LEFT OUTER JOIN(select MemberId, MemberName from Member) as C ";
        strSQL += "ON A.MemberId = C.MemberId ";
        strSQL += "order by IGId Desc";

        //SqlConnection con = new SqlConnection(scsb.ToString());
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
        .ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(strSQL, con);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                IG oneIG = new IG();
                int IGId =0;
                int.TryParse(reader["IGId"].ToString(),out IGId);
                oneIG.IGId = IGId;


                oneIG.MemberId = reader.GetInt32(1);
                oneIG.ImagePath = reader.GetString(2);
                oneIG.UserMessage = reader.GetString(3);
                oneIG.CreatDate = reader.GetDateTime(4);

                int LikeIG = 0;
                int.TryParse(reader["LikeCount"].ToString(), out LikeIG);
                oneIG.LikeIG = LikeIG;

                oneIG.MamberName=reader.GetString(6);
                //oneIG.LikeIG = reader.GetInt32(5);
                allIG.Add(oneIG);
                //memberids.Add(reader.GetInt32(1));
                //igids.Add(reader.GetInt32(0));
            }
        }
        reader.Close();
        con.Close();

        //比對留言後加進去
        List<IGMessage> allMessage = showAllMessage();
        foreach (IG item in allIG) {
            List<IGMessage> igmessage = new List<IGMessage>();
            foreach (IGMessage m in allMessage) {
                if (item.IGId==m.IGId) {
                    igmessage.Add(m);
                }               
            }
            item.allmessage = igmessage;
        }



        //撈留言
        //int aa = 0;
        //foreach (IG item in allIG)
        //{
        //    item.allmessage = showMessage(igids[aa]);
        //    aa++;
        //}


        //撈IG使用者名字
        //int bb = 0;
        //foreach (IG item in allIG)
        //{
        //    item.MamberName = takeMemberName(memberids[bb]);
        //    bb++;
        //}

        //撈讚數
        //int cc = 0;
        //foreach (IG item in allIG)
        //{
        //    item.LikeIG = takeLikeIGCount(igids[cc]);
        //    cc++;
        //}


        return allIG;
    }

    //確定有沒有按過讚
    public bool checklikeIG(int IGId, int MemberId)
    {
        bool isHave = false;
        string strSQL = "select * from tIGCountLike where IGId=@IGId and MemberId=@MemberId";
        //SqlConnection con = new SqlConnection(scsb.ToString());
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
        .ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"IGId", IGId);
        cmd.Parameters.AddWithValue(@"MemberId", MemberId);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            isHave = true;
        }
        reader.Close();
        con.Close();
        return isHave; //按過了
    }

    //新增按讚
    public void addlikeIG(int IGId, int MemberId)
    {
        String strSQL = "INSERT INTO tIGCountLike (IGId,MemberId,CreateDate) Values (@IGId,@MemberId,@CreateDate)";
        //SqlConnection con = new SqlConnection(scsb.ToString());
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
        .ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"IGId", IGId);
        cmd.Parameters.AddWithValue(@"MemberId", MemberId);
        cmd.Parameters.AddWithValue(@"CreateDate", DateTime.Now);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    //刪除按讚
    public void lesslikeIG(int IGId, int MemberId) {

        String strSQL = "DELETE FROM tIGCountLike WHERE IGId=@IGId and MemberId=@MemberId";
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
        .ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"IGId", IGId);
        cmd.Parameters.AddWithValue(@"MemberId", MemberId);
        SqlDataReader reader = cmd.ExecuteReader();
        con.Close();
    }

    //撈讚數
    public int takeLikeIGCount(int IGId)
    {
        int LikeCount = 0;
        string strSQL = "select count(*) from tIGCountLike where IGId=@IGId";
        //SqlConnection con = new SqlConnection(scsb.ToString());
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
        .ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"IGId", IGId);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                LikeCount = reader.GetInt32(0);
            }
        }
        reader.Close();
        con.Close();
        return LikeCount;
    }

    //新增留言
    public void addMessage(int MemberId, int IGId, string Message)
    {
        String strSQL = "INSERT INTO tMessage (MemberId,IGId,Message,CreateDate) Values (@MemberId,@IGId,@Message,@CreateDate)";
        //SqlConnection con = new SqlConnection(scsb.ToString());
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
        .ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId", MemberId);
        cmd.Parameters.AddWithValue(@"IGId", IGId);
        cmd.Parameters.AddWithValue(@"Message", Message);
        cmd.Parameters.AddWithValue(@"CreateDate", DateTime.Now);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    //撈全部留言
    public List<IGMessage> showAllMessage()
    {
        List<IGMessage> allMessage = new List<IGMessage>();
        //string strSQL = "select*from tMessage";
        string strSQL = "select A.IGMessageId,A.MemberId,A.IGId,A.Message,A.CreateDate,B.MemberName ";
        strSQL += "from tMessage as A ";
        strSQL += "LEFT OUTER JOIN(select MemberId, MemberName from Member) as B ";
        strSQL += "ON A.MemberId = B.MemberId";     

        //SqlConnection con = new SqlConnection(scsb.ToString());
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
        .ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(strSQL, con);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                IGMessage message = new IGMessage();
                message.MemberId = reader.GetInt32(1);
                message.IGId = reader.GetInt32(2);
                message.Message = reader.GetString(3);
                message.CreatDate = reader.GetDateTime(4);
                
                if (!String.IsNullOrEmpty(reader["MemberName"].ToString())) {
                    message.MamberName = reader.GetString(5);                    
                }
                else{ message.MamberName = "無名氏"; }
                
                allMessage.Add(message);
            }
        }
        reader.Close();
        con.Close();

        return allMessage;
    }

    //撈某張IG的留言
    public List<IGMessage> showMessage(int IGId)
    {
        List<IGMessage> allMessage = new List<IGMessage>();
        List<int> MemberIds = new List<int>();
        string strSQL = "select*from tMessage where IGId=@IGId";
        //SqlConnection con = new SqlConnection(scsb.ToString());
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
        .ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"IGId", IGId);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                IGMessage message = new IGMessage();
                message.MemberId = reader.GetInt32(1);
                message.IGId = reader.GetInt32(2);
                message.Message = reader.GetString(3);
                message.CreatDate = reader.GetDateTime(4);
                allMessage.Add(message);

                MemberIds.Add(reader.GetInt32(1));
            }
        }
        reader.Close();
        con.Close();

        int aa = 0;
        foreach (IGMessage item in allMessage)
        {
            item.MamberName = takeMemberName(MemberIds[aa]);
            aa++;
        }
        return allMessage;
    }

    //取讚數  ---停用
    public int takeIGLikeCount(int IGId)
    {
        int LikeIg = 0;
        string strSQL = "select LikeIg from IG where IGId=@IGId";
        //SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoAzureConnectionString"]
        //.ConnectionString);
        SqlConnection con = new SqlConnection(scsb.ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"IGId", IGId);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                LikeIg = reader.GetInt32(0);
            }
        }
        reader.Close();
        con.Close();
        return LikeIg;
    }
    //更新讚數 ---停用
    public void likeIG(int IGId, int LikeCount)
    {
        //int IGLike = 0;
        string strSQL = " UPDATE tIG SET LikeIG = @LikeCount WHERE IGId = @IGId";
        SqlConnection con = new SqlConnection(scsb.ToString());
        //SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoAzureConnectionString"]
        //.ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"LikeCount", LikeCount);
        cmd.Parameters.AddWithValue(@"IGId", IGId);
        cmd.ExecuteNonQuery();
        con.Close();
        //IGLike = takeIGLikeCount(IGId);
        //return IGLike;
    }

}

public class IG
{
    public int IGId { get; set; }
    public int MemberId { get; set; }
    public string ImagePath { get; set; }
    public string UserMessage { get; set; }
    public DateTime CreatDate { get; set; }
    public int LikeIG { get; set; }
    //另外撈會員名字
    public string MamberName { get; set; }
    //另外撈所有留言
    public List<IGMessage> allmessage { get; set; }
}

public class IGMessage
{
    public int IGMessageId { get; set; }
    public int MemberId { get; set; }
    public int IGId { get; set; }
    public string Message { get; set; }
    public DateTime CreatDate { get; set; }
    //另外撈留言會員名字
    public string MamberName { get; set; }
}
