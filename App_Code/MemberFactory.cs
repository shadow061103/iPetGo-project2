using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.IO;




/// <summary>
/// MemberFactory 的摘要描述
/// </summary>
public class MemberFactory
{
    public String key = ":cookie@hello>haha.pet";
    SqlConnectionStringBuilder scsb;
    public MemberFactory()
    {
        scsb = new SqlConnectionStringBuilder();
        scsb.DataSource = ".";
        scsb.InitialCatalog = "iPetGo";
        scsb.IntegratedSecurity = true;
    }
    //檢查帳號是否有人使用
    public bool userExit(string account) {
        //SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = "select*from Member where MemberAccount=@account";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"account", account);
        SqlDataReader reader = cmd.ExecuteReader();
        if (!reader.Read())
            return true;

        reader.Close();
        con.Close();
        return false;
    
    
    
    }

    //註冊會員
    public void register(kMember member)
    {
        // SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();

        string strSQL = "Insert into Member(MemberAccount, MemberPassword, MemberName"
                  + ",sex,MemberEmail,fRight,MemberImage,fCheck) values (@account,@pwd,@name,@sex,"
                + "@mail,'3',@MemberImage,0)";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"account",member.MemberAccount);
        cmd.Parameters.AddWithValue(@"pwd", GetMD5(member.MemberPassword+key));
        cmd.Parameters.AddWithValue(@"name", member.MemberName);
        cmd.Parameters.AddWithValue(@"sex", member.sex);
        cmd.Parameters.AddWithValue(@"mail", member.MemberEmail);
        cmd.Parameters.AddWithValue(@"MemberImage", member.MemberImage);

        cmd.ExecuteNonQuery();
        con.Close();
      }
    //登入
    public kMember login(string account, string password) {
        kMember member = new kMember();

        //  SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = "select*from Member where MemberAccount=@account and MemberPassword=@pwd";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"account", account);
        cmd.Parameters.AddWithValue(@"pwd", password);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            member.MemberId = reader.GetInt32(0);
            member.MemberAccount = reader.GetString(1);
            member.MemberPassword = reader.GetString(2);
            member.MemberName = reader.GetString(3);
            member.sex = reader.GetString(4);
            member.MemberEmail = reader.GetString(5);
            member.fRight = reader.GetInt32(6);
            member.MemberImage = reader.GetString(7);
            reader.Close();
            con.Close();
            return member;
        }
        else
        {
            reader.Close();
            con.Close();
            return null;
        }
    
    
    
    }
    //更新會員資料
    public kMember updateMemberInfo(kMember member) {
        // SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = "update Member set MemberName=@MemberName,"
            + "sex=@sex,MemberEmail=@MemberEmail,MemberImage=@MemberImage where MemberAccount=@MemberAccount";

        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberName",member.MemberName);
        cmd.Parameters.AddWithValue(@"sex", member.sex);
         cmd.Parameters.AddWithValue(@"MemberEmail",member.MemberEmail);
        cmd.Parameters.AddWithValue(@"MemberAccount", member.MemberAccount);
        cmd.Parameters.AddWithValue(@"MemberImage", member.MemberImage);

       cmd.ExecuteNonQuery();
       member = login(member.MemberAccount, member.MemberPassword);
        con.Close();
        if (member != null)
            return member;
        else
            return null;
     }
    //更新密碼
    public kMember updatePwd(string account, string pwd) {
        // SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = "update Member set MemberPassword=@MemberPassword"
            + " where MemberAccount=@MemberAccount";

        SqlCommand cmd = new SqlCommand(strSQL, con);

        cmd.Parameters.AddWithValue(@"MemberPassword", GetMD5(pwd+key));
        cmd.Parameters.AddWithValue(@"MemberAccount",account);

        cmd.ExecuteNonQuery();
        kMember member = login(account, GetMD5(pwd + key));
        con.Close();
        if (member != null)
            return member;
        else
            return null;
    
    
    
    
    
    
    
    }
    //自動登入
    public kMember autoLogin(HttpRequest request) {
        String account = "";
        String pwd = "";
        if (request.Cookies[Dictionary.CK_auto] != null) { 
       

            if(request.Cookies[Dictionary.CK_auto][Dictionary.CK_Account]!=null)
             account= request.Cookies[Dictionary.CK_auto][Dictionary.CK_Account];
          if(request.Cookies[Dictionary.CK_auto][Dictionary.CK_Pwd]!=null)
               pwd=request.Cookies[Dictionary.CK_auto][Dictionary.CK_Pwd];
          }
        kMember member = new kMember();
        member = login(account, pwd);
        if (member != null)
            return member;

        return null;
 }
    //登出
    public void Logout(HttpRequest request,HttpResponse response){
        if (request.Cookies[Dictionary.CK_auto] != null)
        {
            HttpCookie cookie = new HttpCookie(Dictionary.CK_auto);
            cookie.Expires = DateTime.Now.AddDays(-10);
            response.Cookies.Add(cookie);
        }

  
    }
    //看寵物是否已存在
    public bool petExit(string pet,int id)
    {
        // SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = "select*from tPet where fPetName=@pet and MemberId=@MemberId";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"pet", pet);
        cmd.Parameters.AddWithValue(@"MemberId", id);
        SqlDataReader reader = cmd.ExecuteReader();
        if (!reader.Read())
            return true;

        reader.Close();
        con.Close();
        return false;



    }
    //列出寵物資料在編輯頁面
    public kPet showPet(int memberid,int petid)
    {
        // SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = "select * from tPet where MemberId=@MemberId and fPetId=@fPetId";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId", memberid);
        cmd.Parameters.AddWithValue(@"fPetId", petid);
        SqlDataReader reader = cmd.ExecuteReader();
        kPet pet = new kPet();
        if (reader.Read()) { 
        pet.MemberId=reader.GetInt32(0);
             pet.fPetId=reader.GetInt32(1);
              pet.fPetName=reader.GetString(2);
               pet.fPetSex=reader.GetString(3);
                pet.fPetType=reader.GetString(4);
                 pet.fPetPic=reader.GetString(5);
                 pet.fAge = reader.GetDateTime(6).ToString("yyyy/MM/dd");
                   pet.fExperience=reader.GetString(7);
                    pet.fNote=reader.GetString(8);
                     pet.fBodytype=reader.GetString(9);
                      pet.fBirthcontrol=reader.GetString(10);
                      pet.fWaferNumber = reader.GetString(11);


        
        
        }
       

        reader.Close();
        con.Close();
        return pet;



    }
    //刪除寵物
    public void deletePet(int memberid,int petid)
    {
        // SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = @"delete from tPet where MemberId=@MemberId and fPetId=@fPetId";

        SqlCommand cmd = new SqlCommand(strSQL, con);

        cmd.Parameters.AddWithValue(@"MemberId",memberid);
        cmd.Parameters.AddWithValue(@"fPetId", petid);

        cmd.ExecuteNonQuery();
        con.Close();
       }
    public int updatePet(kPet pet) {
        // SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = @"update tPet set fPetName=@fPetName,fPetSex=@fPetSex,fPetType=@fPetType
,fPetPic=@fPetPic,fAge=@fAge,fExperience=@fExperience,fNote=@fNote,fBodyType=@fBodyType,
fBirthControl=@fBirthControl,fWaferNumber=@fWaferNumber where MemberId=@MemberId and 
fPetId=@fPetId";


        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId", pet.MemberId);
        cmd.Parameters.AddWithValue(@"fPetId", pet.fPetId);
        cmd.Parameters.AddWithValue(@"fPetName", pet.fPetName);
        cmd.Parameters.AddWithValue(@"fPetSex", pet.fPetSex);
        cmd.Parameters.AddWithValue(@"fPetType", pet.fPetType);
        cmd.Parameters.AddWithValue(@"fPetPic", pet.fPetPic);
        cmd.Parameters.AddWithValue(@"fAge", pet.fAge);
        cmd.Parameters.AddWithValue(@"fExperience", pet.fExperience);
        cmd.Parameters.AddWithValue(@"fNote", pet.fNote);
        cmd.Parameters.AddWithValue(@"fBodyType", pet.fBodytype);
        cmd.Parameters.AddWithValue(@"fBirthControl", pet.fBirthcontrol);
        cmd.Parameters.AddWithValue(@"fWaferNumber", pet.fWaferNumber);

        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    //登錄寵物資料
    public void registerPet(kPet pet)
    {
        // SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();

        string strSQL = "Insert into tPet(MemberId, fPetName, fPetSex,fPetType,fPetPic"
                  + ",fAge,fExperience,fNote,fBodyType,fBirthControl,fWaferNumber) "
        +"values (@MemberId,@fPetName,@fPetSex,@fPetType,@fPetPic,@fAge,"
                + "@fExperience,@fNote,@fBodyType,@fBirthControl,@fWaferNumber)";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId", pet.MemberId);
        cmd.Parameters.AddWithValue(@"fPetName",pet.fPetName );
        cmd.Parameters.AddWithValue(@"fPetSex", pet.fPetSex);
        cmd.Parameters.AddWithValue(@"fPetType", pet.fPetType);
        cmd.Parameters.AddWithValue(@"fPetPic",pet.fPetPic);
         cmd.Parameters.AddWithValue(@"fAge",pet.fAge);
         cmd.Parameters.AddWithValue(@"fExperience",pet.fExperience);
         cmd.Parameters.AddWithValue(@"fNote",pet.fNote);
         cmd.Parameters.AddWithValue(@"fBodyType",pet.fBodytype);
         cmd.Parameters.AddWithValue(@"fBirthControl",pet.fBirthcontrol);
         cmd.Parameters.AddWithValue(@"fWaferNumber", pet.fWaferNumber);

        cmd.ExecuteNonQuery();
        con.Close();
    }
    public  string GetMD5(string original)
    {
        MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
        byte[] b = md5.ComputeHash(Encoding.UTF8.GetBytes(original));
        return BitConverter.ToString(b).Replace("-", string.Empty);
    }
   public void textweb(HttpResponse response)
    {



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
        response.Write("<table><tr><th>會員編號</th><th>會員帳號</th><th>密碼</th><th>姓名</th><th>性別</th><th>郵件</th><th>權限</th></tr>");

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                response.Write("<tr>");
                response.Write("<td>" + reader.GetInt32(0) + "</td>");
                response.Write("<td>" + reader.GetString(1) + "</td>");
                response.Write("<td>" + reader.GetString(2) + "</td>");
                response.Write("<td>" + reader.GetString(3) + "</td>");
                response.Write("<td>" + reader.GetString(4) + "</td>");
                response.Write("<td>" + reader.GetString(5) + "</td>");
                response.Write("<td>" + reader.GetInt32(6) + "</td>");
                response.Write("</tr>");
            }

        }
        response.Write("</table>");
        reader.Close();
        con.Close();
    }
    //秀出寵物資料
   public string showPetList(HttpRequest request, HttpResponse response,int id)
   {
       Boolean haveRec = false;

       // p 就是「目前在第幾頁?」
       int p = Convert.ToInt32(request["p"]);



       //SqlConnection Conn = new SqlConnection(scsb.ToString());
       // SqlConnection Conn = new SqlConnection("Data Source=CR1-16;Initial Catalog=iPetGo;Integrated Security=True;MultipleActiveResultSets=True");
       //webconfig的連線字串 連雲端**********
       SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
           .ConnectionString);
       ////*******************************
       con.Open();
       string str = "select count(MemberId) from tPet where MemberId="+id;
      
       SqlCommand cmd = new SqlCommand(str, con);


       //每頁展示 6筆資料
       int PageSize = 6;
       StringBuilder htmlcode = new StringBuilder();

       //SQL指令共撈到多少筆（列）資料。RecordCount資料總筆（列）數
       int RecordCount = (int)cmd.ExecuteScalar();

       //如果撈不到資料，程式就結束。-- Start --------------
       if (RecordCount == 0)
       {
           htmlcode.Append("<label style = 'font-size:larger' > 您尚無寵物，請點選上方連結新增您的第一隻寵物!</ label >");

           con.Close();
           return htmlcode.ToString();
       }    //-- End ----------

       //Pages 資料的總頁數。搜尋到的所有資料，共需「幾頁」才能全部呈現？
       int Pages = ((RecordCount + PageSize) - 1) / (PageSize);    //除法，取得「商」。

       //  底下這一段IF判別式，是用來防呆，防止一些例外狀況。-- start --        
       if (request["p"] == null)
       {
           p = 1;
       }
       else
       {
           if (IsNumeric(request["p"]))
           {
               //有任何問題，就強制跳回第一頁（p=1）。
               //頁數（p）務必是一個整數。而且需要大於零、比起「資料的總頁數」要少
               if ((p > 0) & (p <= Pages))
               {
                   p = Convert.ToInt32(request["p"]);
               }
               else
               {
                   p = 1;
               }
           }
           else
           {
               p = 1;
           }
       }  //上面這一段IF辦別式，是用來防呆，防止一些例外狀況。-- end --

       //NowPageCount，目前這頁的資料
       int NowPageCount = 0;
       if (p > 0)
       {
           NowPageCount = (p - 1) * PageSize;    //PageSize，每頁展示6筆資料（上面設定過了）
       }



       SqlDataReader reader = null;
       string strSQL = " select  fPetId,fPetName,fPetPic,fAge,fExperience,fBodyType from (select ROW_NUMBER() OVER(ORDER BY MemberId) AS 'RowNo', * from tPet where MemberId="+id+") as t where t.RowNo between " + (NowPageCount + 1) + " and " + (NowPageCount + PageSize) +"and MemberId="+id;
       
       //==SQL指令的 ROW_NUMBER。參考資料： http://technet.microsoft.com/zh-tw/library/ms186734.aspx 
       SqlCommand cmd1 = new SqlCommand(strSQL, con);
       reader = cmd1.ExecuteReader();
       //========================
       while (reader.Read())
       {        int i = DateTime.Now.Year;
                int j = reader.GetDateTime(3).Year;
               int Age = i - j;
               if (Age < 1)//未滿一歲算1歲
                   Age = 1;
           haveRec = true;
            htmlcode.Append("<form action='MemberPetProFile.aspx' method='post'><div class='col-md-4 col-sm-4 hero-feature'><div class='thumbnail' style=\"heigt: 700px;\"><img src='" + reader.GetString(2) + "' style=\"height:210px\" /><div class='caption'><h3>" + reader.GetString(1) + "</h3><p>" + Age + "歲</p><p>" + reader.GetString(5) + "</p><p>" + reader.GetString(4) + "</p><input type='hidden' name='id' value='" + reader.GetInt32(0) + "'/><p> <input  type='submit' name='action' class='btn btn-success active' value='編輯' /><input  type='submit'  name='action' class='btn btn-success' value='刪除' onclick=\"return confirm('你確定刪除嗎?')\"/></p></div></div></div></form>");

       }

       if (haveRec)  // 以下區塊，是畫面下方的分頁功能---------------------------------------------------------
       {



           if (Pages > 0)
           {




               //========= MIS2000 Lab.自製的「每十頁」一間隔，分頁功能=========start====
               htmlcode.Append("<hr width='97%' size=1>");


               int block_page = 0;
               block_page = p / 10;   //--只取除法的整數成果（商），若有餘數也不去管它。

               if (block_page > 0)
               {
                   htmlcode.Append("<a href='petSisterInfo.aspx?p=" + (((block_page - 1) * 10) + 9) + "'> [前十頁]  </a>&nbsp;&nbsp;");

               }

               for (int K = 0; K <= 10; K++)
               {
                   if ((block_page * 10 + K) <= Pages)
                   {   //--- Pages 資料的總頁數。共需「幾頁」來呈現所有資料？
                       if (((block_page * 10) + K) == p)
                       {   //--- p 就是「目前在第幾頁」
                           htmlcode.Append("[<b>" + p + "</b>]" + "&nbsp;&nbsp;&nbsp;");

                       }
                       else
                       {
                           if (((block_page * 10) + K) != 0)
                           {
                               htmlcode.Append("<a href='petSisterInfo.aspx?p=" + (block_page * 10 + K) + "'>" + (block_page * 10 + K) + "</a>");

                               htmlcode.Append("&nbsp;&nbsp;&nbsp;");

                           }
                       }
                   }
               }  //for迴圈 end

               if ((block_page < (Pages / 10)) & (Pages >= (((block_page + 1) * 10) + 1)))
               {
                   htmlcode.Append("&nbsp;&nbsp;<a href='petSisterInfo.aspx?p=" + ((block_page + 1) * 10 + 1) + "'>  [後十頁]  </a>");

               }
               htmlcode.Append("</div>");

               //========= MIS2000 Lab.自製的「每十頁」一間隔，分頁功能=========end====
           }
       }
       reader.Close();
       con.Close();
       return htmlcode.ToString();






   }
   // 檢查是否為整數型態
   static bool IsNumeric(object Expression)
   {

       bool isNum;
       double retNum;
       isNum = Double.TryParse(Convert.ToString(Expression), System.Globalization.NumberStyles.Any, System.Globalization.NumberFormatInfo.InvariantInfo, out retNum);
       return isNum;
   }
}