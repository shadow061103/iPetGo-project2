using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// IGInfoUse 的摘要描述
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允許使用 ASP.NET AJAX 從指令碼呼叫此 Web 服務，請取消註解下列一行。
// [System.Web.Script.Services.ScriptService]
public class IGInfoUse : System.Web.Services.WebService
{

    public IGInfoUse()
    {

        //如果使用設計的元件，請取消註解下列一行
        //InitializeComponent(); 
    }

    [WebMethod]
	[ScriptMethod(UseHttpPost = true)]
    public int addlikeIG(int igid, int memberid)
    {        
        IGFactory igf = new IGFactory();
        if (igf.checklikeIG(igid, memberid))
        {
            igf.lesslikeIG(igid, memberid);
            int likecount = igf.takeLikeIGCount(igid);
            return likecount;
        }
        else {
            igf.addlikeIG(igid, memberid);
            int likecount = igf.takeLikeIGCount(igid);
            return likecount;
        }        
    }

    [WebMethod]
	[ScriptMethod(UseHttpPost = true)]
    public string sentMessage(int memberid, int igid, string message)
    {
        string messageArea = "";

        IGFactory igf = new IGFactory();
        igf.addMessage(memberid, igid, message);

        List<IGMessage> alligMeaagae = igf.showMessage(igid);


        foreach (IGMessage item in alligMeaagae)
        {
            messageArea += "<div class=\"col-lg-12 text-left\" style=\"padding: 0px;height:25px\">";
            messageArea += "<h5><mark>" + item.MamberName + "</mark>"+item.Message+"</h5>";
            messageArea += "</div>";
        }
        return messageArea;
    }

}
