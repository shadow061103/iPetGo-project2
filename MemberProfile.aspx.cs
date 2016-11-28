using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class changePassword : System.Web.UI.Page
{
    kMember member = new kMember();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[Dictionary.SK_memberInfo] != null)
            member = (kMember)Session[Dictionary.SK_memberInfo];
        
        if (!IsPostBack) {
            reloaddata();
        }
      
    }
    
    protected void btnFinish_Click(object sender, EventArgs e)
    {
        if (txtname.Text.Length > 0 &&
            txtmail.Text.Length > 0 &&
            txtsex.Text.Length > 0)
        {
            member = (kMember)Session[Dictionary.SK_memberInfo];
            member.MemberName = txtname.Text;
            member.MemberEmail = txtmail.Text;
            member.sex = txtsex.Text;
            member.MemberAccount = member.MemberAccount;
            member.MemberPassword = member.MemberPassword;
            if (fileupload() != null)
                member.MemberImage = fileupload();//上傳圖片
            else
                member.MemberImage = icon.ImageUrl;


           
            MemberFactory factory = new MemberFactory();


            member = factory.updateMemberInfo(member);
            if (member != null)
           {
               Session[Dictionary.SK_memberInfo] = member;

           }
           else { Response.Write("沒存進去"); }

           reloaddata();
            Endedit();

}
        else
            //Response.Write("不能空白");
        Response.Write("<Script language='JavaScript'>alert('不能空白');</Script>");


    }

    private void reloaddata()
    {
        txtname.Text = member.MemberName;
        txtsex.Text = member.sex;
        txtmail.Text = member.MemberEmail;
        icon.ImageUrl = member.MemberImage;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {//返回列表
        Endedit();

    }

    private void Endedit()
    {
        editmode(false);
    }
    protected void btnEdit_Click1(object sender, EventArgs e)
    {
        //編輯模式
        editmode(true);
    }
    public void editmode(bool t) {
        //編輯模式
        txtmail.Enabled = t;
        txtname.Enabled = t;
        txtsex.Enabled = t;
        btnCancel.Visible = t;
        btnFinish.Visible = t;
        btnEdit.Visible = !t;
        fileUpload1.Enabled = t;



    }
    public string fileupload()
    {
        if (fileUpload1.HasFile)
        {

            string fileName = fileUpload1.FileName;
            string savePath = Server.MapPath("~/Memberpic/");
            int fileSize = fileUpload1.PostedFile.ContentLength;

            if (fileSize < 1000000)
            {

                /////////////////檢查副檔名
                if (Path.GetExtension(fileName) == ".jpg" ||
                    Path.GetExtension(fileName) == ".jpeg" ||
                    Path.GetExtension(fileName) == ".png")
                {
                    //判斷檔名是否重複
                    string pathToCheck = savePath + fileName;
                    string tempfilename = "";
                    if (File.Exists(pathToCheck))
                    {
                        int count = 2;
                        while (File.Exists(pathToCheck))
                        {
                            tempfilename = count.ToString() + "_" + fileName;
                            pathToCheck = savePath + tempfilename;
                            count++;
                        }
                        fileName = tempfilename;
                    }
                    fileUpload1.SaveAs(savePath + fileName);
                    return "../Memberpic/" + fileName;

                }
                else
                    return null;


            }
            else
            {
                Response.Write("上傳的檔案必須小於1MB");
                return null;
            }
        }
        else
            return null;





    }
}