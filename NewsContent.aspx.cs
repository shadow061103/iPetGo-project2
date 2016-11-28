using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewsContent : System.Web.UI.Page
{
    String Account;
    String newsId;

    protected void Page_Load(object sender, EventArgs e)
    {
        
       
            
        newsId = Request.QueryString["fArticleId"];
        
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("News.aspx");
    }

    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        
        e.Values["fDate"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        e.Values["MemberId"] = (int)Session[Dictionary.SK_memberId];
        //e.Values["MemberId"] = 3;
        e.Values["fArticleId"] = newsId;
        if (string.IsNullOrEmpty(e.Values["fContent"].ToString()))
        {
            e.Cancel = true;
        }
        
    }
}