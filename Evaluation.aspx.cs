using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Evaluation : System.Web.UI.Page
{
    PetSitterfactory factory = new PetSitterfactory();
    protected void Page_Load(object sender, EventArgs e)
    {//服務編號
        
        if (!Page.IsPostBack)
        {
            int id = Convert.ToInt32(Request.QueryString["fId"]);
            if (factory.QueryEvaluation(id) > 0)
            {
               /* btnYes.Enabled = false;
                Response.Write("您已評價過，請點選取消回上一頁");*/
                Response.Redirect("mySisterService.aspx");

            }
            else
            {


                txtid.Text = Request.QueryString["fId"];
            }
        }


        }
    protected void btnYes_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(txtid.Text);
   
        iPetGoDataContext db = new iPetGoDataContext();
        tSitterDetail detail = db.tSitterDetail.FirstOrDefault(m => m.fId == id);
        if(detail !=null){
            detail.fEvaluation = Convert.ToInt32(rdbPetsex.SelectedValue);
            detail.fComment = Request.Form["txtNote"];
            db.SubmitChanges();
            Response.Redirect("mySisterService.aspx");
        
        }

    }
    protected void btnNo_Click(object sender, EventArgs e)
    {
        Response.Redirect("mySisterService.aspx");
    }
}