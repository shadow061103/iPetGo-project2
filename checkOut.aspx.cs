using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class checkOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session[Dictionary.SK_memberInfo] != null)
            {
                kMember member = (kMember)Session[Dictionary.SK_memberInfo];
                txtName.Text = member.MemberName;
            }
        }
    }
    protected void btnCheck_Click(object sender, EventArgs e)
    {
        if (txtName.Text.Length > 0 &&
            txtAddress.Text.Length > 0 &&
            txtPhone.Text.Length > 0)
        {
            kOrderMain detail = new kOrderMain();
            detail.OrderName = txtName.Text;
            detail.Address = txtAddress.Text;
            detail.Phone = txtPhone.Text;
            detail.Payment = rdbPaytype.SelectedItem.Text;
            Session[Dictionary.SK_ordermain] = detail;


            Response.Redirect("checkout4.aspx");

        }
        else
            Response.Write("請輸入正確文字");
    }



  
}