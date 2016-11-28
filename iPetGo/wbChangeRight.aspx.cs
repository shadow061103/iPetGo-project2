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

    SqlDataSource sds = new SqlDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["mid"];
        string rid = Request.QueryString["rid"];
        if (id == null)
        {
            Response.Redirect("wbNormal.aspx");
        }
        if (!IsPostBack)
        {
            DropDownList2.SelectedValue = rid;
        }
        Button1.Attributes["Onclick"] = "return confirm('確定要更新嗎?')";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
            string id = Request.QueryString["mid"];
            
            sds.ConnectionString = WebConfigurationManager.ConnectionStrings["iPetGoAzureConnectionString"].ConnectionString;
            sds.UpdateCommand = "UPDATE Member SET fRight =@right WHERE MemberId = @id ";
            sds.UpdateParameters.Add("id", id);
            sds.UpdateParameters.Add("right", DropDownList2.SelectedItem.Value);
            sds.Update();

        Response.Redirect("wbNormal.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("wbNormal.aspx");
    }
}