using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Text;    //-- StringBuilder需要用到
using Microsoft.VisualBasic;   

public class PetSitterfactory
{
    SqlConnectionStringBuilder scsb;
	public PetSitterfactory()
	{
        scsb = new SqlConnectionStringBuilder();
        scsb.DataSource = ".";
        scsb.InitialCatalog = "iPetGo";
        scsb.IntegratedSecurity = true;
	}
    public bool petSitterExit(int id)
    {
        //SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = "select*from AdvancedMember where MemberId=@MemberId";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId", id);
        SqlDataReader reader = cmd.ExecuteReader();
        if (!reader.Read())
            return true;

        reader.Close();
        con.Close();
        return false;



    }

    //註冊保母
    public void registerPetSitter(kpetSitter petsitter)
    {
        //SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();

        string strSQL = "Insert into AdvancedMember(MemberId, fserviceName, fIntro"
                  + ",fMainType,fSeniority,fNote,fPhone,fTeltimeWeek,fTeltime,fSurround,fCountry,fArea,fAddress,fStayPay,fLicenseHave,fImage) "
        + "values (@MemberId,@fserviceName,@fIntro,@fMainType,@fSeniority,@fNote,@fPhone,@fTeltimeWeek,@fTeltime,"
                + "@fSurround,@fCountry,@fArea,@fAddress,@fStayPay,@fLicenseHave,@fImage)";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId",petsitter.MemberId );
        cmd.Parameters.AddWithValue(@"fserviceName", petsitter.fserviceName);
        cmd.Parameters.AddWithValue(@"fIntro",petsitter.fIntro);
        cmd.Parameters.AddWithValue(@"fMainType",petsitter.fMainType);
        cmd.Parameters.AddWithValue(@"fSeniority", petsitter.fSeniority);
        cmd.Parameters.AddWithValue(@"fNote",petsitter.fNote);
        cmd.Parameters.AddWithValue(@"fPhone", petsitter.fPhone);
        cmd.Parameters.AddWithValue(@"fTeltimeWeek", petsitter.fTeltimeWeek);
        cmd.Parameters.AddWithValue(@"fTeltime",petsitter.fTeltime);
        cmd.Parameters.AddWithValue(@"fSurround",petsitter.fSurround);
        cmd.Parameters.AddWithValue(@"fCountry", petsitter.fCountry);
        cmd.Parameters.AddWithValue(@"fArea", petsitter.fArea);
        cmd.Parameters.AddWithValue(@"fAddress", petsitter.fAddress);
        cmd.Parameters.AddWithValue(@"fStayPay",petsitter.fStayPay);
        cmd.Parameters.AddWithValue(@"fLicenseHave", petsitter.fLicenseHave);
        cmd.Parameters.AddWithValue(@"fImage", petsitter.fImage);

        cmd.ExecuteNonQuery();

        

        con.Close();
    }
    public void checkpetSitter(int id) {
        //SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL1 = " update Member set [fCheck]=1 where MemberId=@id";
        SqlCommand cmd1 = new SqlCommand(strSQL1, con);
        cmd1.Parameters.AddWithValue(@"id",id);
        cmd1.ExecuteNonQuery();
        con.Close();

    }
    //保母資料維護
    public void updateSitter(kpetSitter petsitter)
    {
        //SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = @"update AdvancedMember set fserviceName=@fserviceName,fIntro=@fIntro,
fMainType=@fMainType,fSeniority=@fSeniority,fNote=@fNote,fPhone=@fPhone,fTeltimeWeek=@fTeltimeWeek,
fTeltime=@fTeltime,fSurround=@fSurround,fCountry=@fCountry,fArea=@fArea,fAddress=@fAddress,
fStayPay=@fStayPay,fLicenseHave=@fLicenseHave,fImage=@fImage where MemberId=@MemberId";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId", petsitter.MemberId);
        cmd.Parameters.AddWithValue(@"fserviceName", petsitter.fserviceName);
        cmd.Parameters.AddWithValue(@"fIntro", petsitter.fIntro);
        cmd.Parameters.AddWithValue(@"fMainType", petsitter.fMainType);
        cmd.Parameters.AddWithValue(@"fSeniority", petsitter.fSeniority);
        cmd.Parameters.AddWithValue(@"fNote", petsitter.fNote);
        cmd.Parameters.AddWithValue(@"fPhone", petsitter.fPhone);
        cmd.Parameters.AddWithValue(@"fTeltimeWeek", petsitter.fTeltimeWeek);
        cmd.Parameters.AddWithValue(@"fTeltime", petsitter.fTeltime);
        cmd.Parameters.AddWithValue(@"fSurround", petsitter.fSurround);
        cmd.Parameters.AddWithValue(@"fCountry", petsitter.fCountry);
        cmd.Parameters.AddWithValue(@"fArea", petsitter.fArea);
        cmd.Parameters.AddWithValue(@"fAddress", petsitter.fAddress);
        cmd.Parameters.AddWithValue(@"fStayPay", petsitter.fStayPay);
        cmd.Parameters.AddWithValue(@"fLicenseHave", petsitter.fLicenseHave);
        cmd.Parameters.AddWithValue(@"fImage", petsitter.fImage);
        cmd.ExecuteNonQuery();

        con.Close();




    }
    //秀出保母資料
    public string showPetSitter(HttpRequest request,HttpResponse response,string area) {
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
        string str = @"select count(a.MemberId) from Member as m join AdvancedMember as a on m.MemberId=a.MemberId  where m.fRight=4 ";
        if (!area.Equals("請選擇"))
            str += " and a.fCountry=(N'" + area + "')";
        SqlCommand cmd = new SqlCommand(str, con);


        //每頁展示 6筆資料
        int PageSize = 6;
        StringBuilder htmlcode = new StringBuilder();

        //SQL指令共撈到多少筆（列）資料。RecordCount資料總筆（列）數
        int RecordCount = (int)cmd.ExecuteScalar();

        //如果撈不到資料，程式就結束。-- Start --------------
        if (RecordCount == 0)
        {
            htmlcode.Append("<label style = 'font-size:larger' > 此地區尚無保母!</ label >");

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
        string strSQL = @"select   t.MemberId,t.fImage,t.fserviceName,t.fCountry,t.fArea,t.fStayPay 
  from ( select ROW_NUMBER() OVER(ORDER BY a.MemberId) AS 'RowNo',a.* 
   from AdvancedMember as a join Member as m on m.MemberId=a.MemberId 
   where m.fRight=4 ) as t
  join Member as w on w.MemberId=t.MemberId 
   where w.fRight=4 and t.RowNo between " + (NowPageCount + 1) + " and " + (NowPageCount + PageSize);


      // string strSQL = " select   t.MemberId,t.fImage,t.fserviceName,t.fCountry,t.fArea,t.fStayPay from (select ROW_NUMBER() OVER(ORDER BY MemberId) AS 'RowNo', * from AdvancedMember) as t  join Member as m on m.MemberId=t.MemberId   where t.RowNo between " + (NowPageCount + 1) + " and " + (NowPageCount + PageSize)+ " and m.fRight=4";
        if (!area.Equals("請選擇"))
            strSQL += " and t.fCountry=(N'" + area +"')";
        //==SQL指令的 ROW_NUMBER。參考資料： http://technet.microsoft.com/zh-tw/library/ms186734.aspx 
        SqlCommand cmd1 = new SqlCommand(strSQL, con);
        reader = cmd1.ExecuteReader();
        //========================
        while (reader.Read())
        {
            haveRec = true;
            htmlcode.Append("<form action='ReservationPetSister.aspx' method='post'><div class='col-md-6 col-sm-6 hero-feature'><div class='thumbnail' style=\"height:600px;\"><img style=\"width:340px;height:300px\" src='" + reader.GetString(1) + "' ><div class='caption'><h1>" + reader.GetString(2) + "</h1><p><h3>安親/到府/住宿&nbsp;" + reader.GetString(3) + reader.GetString(4) + "</h3></p><p><h3>每晚$" + reader.GetInt32(5) + "</h3></p><input type='hidden' name='id' value="+reader.GetInt32(0)+ "> <p><input  type='submit' class='btn btn-info' value='預約' /></p></div></div></div></form>");

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
    public kpetSitter QueryPetSitter(int id) {
        kpetSitter sitter = new kpetSitter();
        //SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = "select * from AdvancedMember where MemberId=@id";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"id", id);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read()) {
            sitter.MemberId = reader.GetInt32(0);
            sitter.fserviceName = reader.GetString(1);
            sitter.fIntro = reader.GetString(2);
            sitter.fMainType = reader.GetString(3);
            sitter.fSeniority = reader.GetInt32(4);
            sitter.fNote = reader.GetString(5);
            sitter.fPhone = reader.GetString(6);
            sitter.fTeltimeWeek = reader.GetString(7);
            sitter.fTeltime = reader.GetString(8);
            sitter.fSurround = reader.GetString(9);
            sitter.fCountry = reader.GetString(10);
            sitter.fArea = reader.GetString(11);
            sitter.fAddress = reader.GetString(12);
            sitter.fStayPay = reader.GetInt32(13).ToString();
             sitter.fLicenseHave = reader.GetBoolean(14);
            sitter.fImage = reader.GetString(15);
            }
        reader.Close();
        con.Close();
        return sitter;
 }
    public int ReserveService(PetsitterService service) {
        //SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = @"insert into tSitterDetail(fSitterid,MemberId,
fPetId,fService,fStartDate,fEndDate,fMessage,fEvaluation,fComment,fStatus) values (@SitterId,@MemberId,
@fPetId,@fService,@fStartDate,@fEndDate,@fMessage,0,N'尚未給評',1) ";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"SitterId", service.SitterId);
        cmd.Parameters.AddWithValue(@"MemberId", service.MemberId);
        cmd.Parameters.AddWithValue(@"fPetId", service.fPetId);
        cmd.Parameters.AddWithValue(@"fService", service.fService);
        cmd.Parameters.AddWithValue(@"fStartDate", service.fStartDate);
        cmd.Parameters.AddWithValue(@"fEndDate", service.fEndDate);
        cmd.Parameters.AddWithValue(@"fMessage", service.fMessage);

       int i= cmd.ExecuteNonQuery();
        con.Close();

        return i;



    }
    public int QueryEvaluation(int id)
    {
        int fid = 0;
        //SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = "select * from tSitterDetail where fId=@fId";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"fId", id);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            fid = reader.GetInt32(8);
        }
        reader.Close();
        con.Close();
        return fid;
        
    }

}