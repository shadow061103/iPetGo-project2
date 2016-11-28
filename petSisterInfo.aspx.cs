using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;    //-- StringBuilder需要用到
using Microsoft.VisualBasic;   //-- for Timer
//寵物保母列表  可搜尋地區
public partial class petSisterInfo : System.Web.UI.Page
{
    PetSitterfactory factory = new PetSitterfactory();
    string area = "請選擇";
    string htmlcode = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        htmlcode = factory.showPetSitter(Request,Response,area);
        webcontent.InnerHtml = htmlcode;
       
    }
  
  
   
    protected void btnChoose_Click(object sender, EventArgs e)
    {
        area = Request.Form["city"];
        htmlcode = factory.showPetSitter(Request,Response,area);
        webcontent.InnerHtml = htmlcode;

    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        area = "請選擇";
        htmlcode = factory.showPetSitter(Request, Response, area);
        webcontent.InnerHtml = htmlcode;
    }
}