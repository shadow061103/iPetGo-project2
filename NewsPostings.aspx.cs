using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewsPostings : System.Web.UI.Page
{
    
    String AccountId;

    protected void Page_Load(object sender, EventArgs e)
    {
        

            
    }

    protected void InsertButton_Click(object sender, EventArgs e)
    {

        
    }

    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        e.Values["fDate"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        e.Values["MemberId"] = (int)Session[Dictionary.SK_memberId];
        //e.Values["MemberId"] = 2;
        if (string.IsNullOrEmpty(e.Values["fTitle"].ToString()))
        {
            e.Cancel = true;
        }
        
    }

    protected void InsertCancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("News.aspx");
    }


    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {      
        Response.Redirect("News.aspx");
    }
}