using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class RegisterMember : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (txtname.Text.Length>0&&
            password1.Text.Length>0&&
            txtEmail.Text.Length>0&&
            password2.Text.Length>0&&
            fileupload()!=null
           )
        {
            MemberFactory factory = new MemberFactory();
            if (factory.userExit(MemberAccount.Text))
            {

                kMember member = new kMember();

                member.MemberAccount = MemberAccount.Text;
                member.MemberPassword = password1.Text;
                member.MemberName = txtname.Text;
                member.sex = rdbSex.SelectedItem.Text;
                member.MemberEmail = txtEmail.Text;
                member.MemberImage = fileupload();
                factory.register(member);
                Response.Write("<Script language='JavaScript'>alert('註冊成功!');window.location=('login.aspx');</Script>");
                Response.End();
                //Response.Redirect("login.aspx");
            }
            else
               // Response.Write("帳號已有人使用");
                Response.Write("<Script language='JavaScript'>alert('帳號已有人使用');</Script>");


        }
        else
           // Response.Write("輸入格式有誤，請記得上傳大頭照");
        Response.Write("<Script language='JavaScript'>alert('輸入格式有誤，請記得上傳大頭照');</Script>");

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
                //Response.Write("上傳的檔案必須小於1MB");
                Response.Write("<Script language='JavaScript'>alert('上傳的檔案必須小於1MB');</Script>");
                return null;
            }
        }
        else
            return null;





    }
}