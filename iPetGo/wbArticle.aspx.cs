using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class iPetGo_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string id = Request.QueryString["fid"];
        if (!String.IsNullOrEmpty(id))
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = WebConfigurationManager.ConnectionStrings["iPetGoAzureConnectionString"].ConnectionString;
            sds.DeleteCommand = "Delete from tComment where fArticleId=@aid";
            sds.DeleteParameters.Add("aid", id);
            sds.Delete();
            sds.DeleteCommand = "Delete from tArticle where fArticleId=@id";
            sds.DeleteParameters.Add("id", id);
            sds.Delete();
            Response.Write("<script>alert('刪除成功'); location.href='wbArticle.aspx';</script>");
        }


    }

}