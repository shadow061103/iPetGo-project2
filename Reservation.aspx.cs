using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reservation : System.Web.UI.Page
{
    PetSitterfactory factory = new PetSitterfactory();
    kMember member = new kMember();

    int sitterid;
   // petSitter sitter = new petSitter();
    protected void Page_Load(object sender, EventArgs e)
    {
      
       if (Session[Dictionary.SK_memberInfo] != null)
            member = (kMember)Session[Dictionary.SK_memberInfo];
       
       if(Session[Dictionary.SK_sitterId]!=null)
        sitterid = (int)Session[Dictionary.SK_sitterId];
        
      

       

    }


    protected void btnFinish_Click(object sender, EventArgs e)
    {
        if (cbAgree.Checked && txtPetname.Text.Length > 0 && txtStartdate.Text.Length > 0 &&
            txtEnddate.Text.Length > 0)
        {
            DateTime now = DateTime.Now;
            DateTime dt1 = DateTime.Parse(txtStartdate.Text);
            DateTime dt2 = DateTime.Parse(txtEnddate.Text);
            if (dt1.CompareTo(dt2) > 0)
            {
                Response.Write("<Script language='JavaScript'>alert('開始日不得大於結束日');</Script>");
                return;
            }
            if (dt1.CompareTo(now) < 0) {
                Response.Write("<Script language='JavaScript'>alert('開始日不得小於現在日期');</Script>");
                return;

            }

            PetsitterService service = new PetsitterService();
            service.SitterId = sitterid;
            service.MemberId = member.MemberId;
            service.fPetId = txtPetname.Text;
            service.fService = rdbService.SelectedItem.Text;
            service.fStartDate = txtStartdate.Text;
            service.fEndDate = txtEnddate.Text;
            service.fMessage = Request.Form["txtMessage"];

            /* Response.Write("sitterid" + service.SitterId + "<br/>");
             Response.Write("MemberId" + service.MemberId + "<br/>");
             Response.Write("fPetId" + service.fPetId + "<br/>");
             Response.Write("fService" + service.fService + "<br/>");
             Response.Write("fStartDate" + service.fStartDate + "<br/>");
             Response.Write("fEndDate" + service.fEndDate + "<br/>");
             Response.Write("fMessage" + service.fMessage + "<br/>");*/
            int num = factory.ReserveService(service);
            if (num > 0)
            {
                Response.Write("<Script language='JavaScript'>alert('預約成功，等候保母回應');window.location=('petSisterInfo.aspx');</Script>");
                Response.End();
            }
          
        }
        else
        {
           // Response.Write("輸入資料不正確");
            Response.Write("<Script language='JavaScript'>alert('輸入資料不正確');</Script>");
        }




    }

 protected void btnClear_Click(object sender, EventArgs e)
    {
        txtPetname.Text = "";

    }
}