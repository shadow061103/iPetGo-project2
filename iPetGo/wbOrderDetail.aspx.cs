using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class iPetGo_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["oid"];
        if (id == null)
        {
            Response.Redirect("wbOrderMain.aspx");
        }

        DataView dv = (new Orders()).dataview(id);
        DateTime date =Convert.ToDateTime(dv.Table.Rows[0]["fOrderDate"].ToString());
        float total= Convert.ToSingle(dv.Table.Rows[0]["fTotal"].ToString());
        string strtotal = String.Format("{0:N0}", total.ToString());
        lbl編號.Text = id+ date.ToString("yyyyMMdd"); 
        lbl訂購人.Text = dv.Table.Rows[0]["MemberName"].ToString();
        lbl收件人.Text = dv.Table.Rows[0]["fOrderName"].ToString();
        lbl連絡電話.Text = dv.Table.Rows[0]["fPhone"].ToString();
        lbl地址.Text = dv.Table.Rows[0]["fAddress"].ToString();
        lbl付款方式.Text = dv.Table.Rows[0]["fPaymentMT"].ToString();
        lbl總計.Text = strtotal;
        lbl訂購日期.Text = date.ToString("yyyy-MM-dd");
        
    }
}