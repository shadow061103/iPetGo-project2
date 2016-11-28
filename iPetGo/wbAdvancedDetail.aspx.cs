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
        if (!Page.IsPostBack)
        {
            Button2.Attributes["Onclick"] = "return confirm('確定要更新資料嗎?')";
            DisplayAllDetailofAdvancedMember();
            
        }
        Label2.Visible = false;
    }
    private void DisplayAllDetailofAdvancedMember()
    {
        string id = Request.QueryString["mid"];
        if (id == null)
        {
            Response.Redirect("wbAdvanced.aspx");
            return;
        }
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = WebConfigurationManager.ConnectionStrings["iPetGoAzureConnectionString"].ConnectionString;
        sds.SelectCommand = "select am.MemberId,m.MemberAccount,m.MemberPassword,m.MemberName,m.sex,m.MemberEmail,m.fRight,am.fServiceName,am.fMainType,am.fSeniority,am.fIntro,am.fCountry,am.fArea,am.fAddress,am.fNote,am.fPhone,am.fSurround,am.fLicenseHave,am.fTeltime,am.fStayPay,am.fImage" +
" from AdvancedMember am inner join Member m on am.MemberId = m.MemberId WHERE am.MemberId =@pk";
        sds.SelectParameters.Add("pk", id);
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;
        if (dv.Count == 0)
        {
            Response.Redirect("WfrmShopping.aspx");
            return;
        }
        mId.Text = dv.Table.Rows[0]["MemberId"].ToString();
        mAccount.Text = dv.Table.Rows[0]["MemberAccount"].ToString();
        mPassword.Text = dv.Table.Rows[0]["MemberPassword"].ToString();
        mName.Text = dv.Table.Rows[0]["MemberName"].ToString();
        mSex.Text = dv.Table.Rows[0]["sex"].ToString();
        mEmail.Text = dv.Table.Rows[0]["MemberEmail"].ToString();
        DropDownList2.SelectedValue = dv.Table.Rows[0]["fRight"].ToString();
        mServiceName.Text = dv.Table.Rows[0]["fServiceName"].ToString();
        mIntro.Text= dv.Table.Rows[0]["fIntro"].ToString();
        mMainType.Text = dv.Table.Rows[0]["fMainType"].ToString();
        mSeniorty.Text = dv.Table.Rows[0]["fSeniority"].ToString();
        mCountry.Text = dv.Table.Rows[0]["fCountry"].ToString();
        mArea.Text = dv.Table.Rows[0]["fArea"].ToString();
        mAddress.Text = dv.Table.Rows[0]["fAddress"].ToString();
        mNote.Text = dv.Table.Rows[0]["fNote"].ToString();
        mPhone.Text = dv.Table.Rows[0]["fPhone"].ToString();
        mSurround.Text = dv.Table.Rows[0]["fSurround"].ToString();
        ck_l.Checked = Convert.ToBoolean( dv.Table.Rows[0]["fLicenseHave"]);
        mTeltime.Text = dv.Table.Rows[0]["fTeltime"].ToString();
        mStayPay.Text = dv.Table.Rows[0]["fStayPay"].ToString();
        //mPicPath.Text = dv.Table.Rows[0]["fImage"].ToString();
        Image1.ImageUrl= dv.Table.Rows[0]["fImage"].ToString();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
       
            string id = Request.QueryString["mid"];
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = WebConfigurationManager.ConnectionStrings["iPetGoAzureConnectionString"].ConnectionString; ;
            sds.UpdateCommand = updateToMember(id);
        sds.Update();
        if (!Page.IsPostBack)
        {
            DisplayAllDetailofAdvancedMember();
        }

        Label2.Visible = true;
        Label2.Text = "Complete";

    }
    private string updateToMember(string id)
    {
        string sql = "UPDATE Member SET ";
        /*sql += "MemberName=" + "N'"+mName.Text+"',";
        sql += "sex=" + "N'" + mSex.Text + "',";
        sql += "MemberEmail=" + "'" + mEmail.Text + "',";*/
        sql += "fRight=" + "'" + DropDownList2.SelectedItem.Value + "' ";
        sql += " WHERE MemberId=" + id;
        return sql;
    }
   /* private string updateToAdvancedMember(string id)
    {
        string sql = "UPDATE AdvancedMember SET ";
        sql += "fServiceName=" + "N'" + mServiceName.Text + "',";
        sql += "fMainType=" + "N'" + mMainType.Text + "',";
        sql += "fSeniorty=" + "'" + mSeniorty.Text + "',";
        sql += "fCountry=" + "N'" + mCountry.Text + "',";
        sql += "fArea=" + "N'" + mArea.Text + "',";
        sql += "fAddress=" + "N'" + mAddress.Text + "',";
        sql += "fIntro=" + "N'" + mIntro.Text + "',";
        sql += "fNote=" + "N'" + mNote.Text + "',";
        sql += "fPhone=" + "'" + mPhone.Text + "',";
        sql += "fSurround=" + "N'" + mSurround.Text + "',";
        sql += "fLicenseHave=" + "'" + ck_l .Checked.ToString()+ "',";
        sql += "fTeltime=" + "'" + mTeltime.Text + "',";
        sql += "fPicPath=" + "'" + mPicPath.Text + "'";
        sql += " WHERE MemberId=" + id;
        return sql;
    }*/
}