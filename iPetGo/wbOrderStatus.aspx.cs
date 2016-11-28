using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class iPetGo_Default : System.Web.UI.Page
{
    Orders orders = new Orders();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        Button1.Attributes["OnClick"] = "return confirm ('確定要更新資料嗎?')";
        string id = Request.QueryString["oid"];
        if (!IsPostBack)
        {
            if (id == null)
            {
                Response.Redirect("wbOrderMain.aspx");
            }
            DataView dv = orders.dataview(id);
            lblID.Text = id;
            lblName.Text = dv.Table.Rows[0]["MemberName"].ToString();
            lblDate.Text= dv.Table.Rows[0]["fOrderDate"].ToString();
            DropDownList1.Text = dv.Table.Rows[0]["fStatus"].ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["oid"];
        orders.UpdateStatus(DropDownList1.Text, id);
        Response.Redirect("wbOrderMain.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("wbOrderMain.aspx");
    }
}