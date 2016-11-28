using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    MemberFactory factory = new MemberFactory();
    protected void Page_Load(object sender, EventArgs e)
    {//自動登入
         var member= factory.autoLogin(Request);
         if (member != null) {//不能用member 因為int初始化為0!!!!!!
             Session[Dictionary.SK_memberInfo] = member;
             Session[Dictionary.SK_right] = member.fRight;
            Session[Dictionary.SK_memberAccount] = member.MemberAccount;
             Response.Redirect("MemberIndex.aspx");
         }
        

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        if (memberAccount.Text.Length > 0 &&
            memberPwd.Text.Length > 0) {
                kMember member = new kMember();
               
                string pwd = factory.GetMD5(memberPwd.Text + factory.key);
                member = factory.login(memberAccount.Text, pwd);
               
                  if (member != null) {
                    Session[Dictionary.SK_memberInfo] = member;
                    Session[Dictionary.SK_right] = member.fRight;
                    Session[Dictionary.SK_memberId] = Convert.ToInt32(member.MemberId);
                Session[Dictionary.SK_memberAccount] = member.MemberAccount;
                if (auto.Checked)
                    { //有勾自動登入
                        HttpCookie cookie = new HttpCookie(Dictionary.CK_auto);
                        cookie.Values.Add(Dictionary.CK_Account, member.MemberAccount);
                        cookie.Values.Add(Dictionary.CK_Pwd, pwd);
                        cookie.Expires = DateTime.Now.AddDays(7);
                        Response.Cookies.Add(cookie);
                    }
                       // Response.Write("登入成功");
                   Response.Redirect("MemberIndex.aspx");
                  }
                 else
                //Response.Write("登入失敗");

            Response.Write("<Script language='JavaScript'>alert('登入失敗');</Script>");



        }
                  else
                    // Response.Write("請輸入帳號密碼");
            Response.Write("<Script language='JavaScript'>alert('請輸入帳號密碼');</Script>");
        
    }
}