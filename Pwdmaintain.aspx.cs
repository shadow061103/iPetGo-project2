using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pwdmaintain : System.Web.UI.Page
{
    kMember member = new kMember();
    protected void Page_Load(object sender, EventArgs e)
    {
      
        if (Session[Dictionary.SK_memberInfo] != null)
            member = (kMember)Session[Dictionary.SK_memberInfo];
    }
    protected void btnFinish_Click(object sender, EventArgs e)
    {
        MemberFactory factory = new MemberFactory();
        string key = factory.key;
        string pwd = factory.GetMD5(txtOldpwd.Text + key);
        //比對舊密碼
        if (pwd.Equals(member.MemberPassword) && txtNewpwd.Text.Length > 0)
        {
            member = factory.updatePwd(member.MemberAccount, txtNewpwd.Text);
            if (member != null)
                Session[Dictionary.SK_memberInfo] = member;
            else
                Response.Write("更新密碼失敗");

            Response.Redirect("MemberProfile.aspx");


        }
        else
        {
            Response.Write("舊密碼輸入錯誤");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("MemberProfile.aspx");
    }
}