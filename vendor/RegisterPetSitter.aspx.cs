using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class RegisterPetSitter2 : System.Web.UI.Page
{
    kMember member = new kMember();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[Dictionary.SK_memberInfo] != null)
            member = (kMember)Session[Dictionary.SK_memberInfo];

        
    }
    protected void btnFinish_Click(object sender, EventArgs e)
    {
        if (txtServiceName.Text.Length > 0 &&
            txtPhone.Text.Length > 0 &&
            txtAddress.Text.Length > 0 &&
            txtPay.Text.Length > 0)
        {
            PetSitterfactory factory = new PetSitterfactory();
            if (factory.petSitterExit(member.MemberId))
            {
                kpetSitter sitter = new kpetSitter();
                sitter.MemberId = member.MemberId;
                sitter.fserviceName = txtServiceName.Text;
                sitter.fIntro = Request.Form["Selfintro"];
                sitter.fMainType = rdbMainType.SelectedItem.Text;
                sitter.fSeniority = Convert.ToInt32(txtSeniority.Text);
                sitter.fNote = Request.Form["note"];
                sitter.fPhone = txtPhone.Text;
                if (rdbtellTime1.SelectedItem.Text.Equals("不想接到電話面談")) {
                    sitter.fTeltime = "無";
                    sitter.fTeltimeWeek = rdbtellTime1.SelectedItem.Text;
                }
                else
                {
                    sitter.fTeltime = rdbtellTime2.SelectedItem.Text;
                    sitter.fTeltimeWeek = rdbtellTime1.SelectedItem.Text;
                }
                sitter.fSurround = Request.Form["surround"];
                sitter.fCountry = Request.Form["county"];
                sitter.fArea = Request.Form["district"];
                sitter.fAddress = txtAddress.Text;
                sitter.fStayPay = txtPay.Text;
                if (rdbLicense.SelectedItem.Text == "有")
                    sitter.fLicenseHave = true;
                else
                    sitter.fLicenseHave = false;


                sitter.fImage = fileupload();//上傳圖片

                if (sitter.fImage != null && sitter.fCountry != "選擇縣市" && sitter.fArea != "選擇區域")
                {
                    factory.registerPetSitter(sitter);
                    factory.checkpetSitter(member.MemberId);//改會員為待審核
                    // Response.Write("註冊成功");
                    Response.Write("<Script language='JavaScript'>alert('註冊成功，等待審核');window.location=('MemberIndex.aspx');</Script>");
                   // Response.Redirect("MemberIndex.aspx");
                }
                else
                    // Response.Write("請選擇圖片、地區<br/>");
                    Response.Write("<Script language='JavaScript'>alert('請選擇圖片、地區');</Script>");

                /*Response.Write(sitter.MemberId + "<br/>");
                Response.Write(sitter.fserviceName + "<br/>");
                Response.Write(sitter.fIntro + "<br/>");
                Response.Write(sitter.fMainType + "<br/>");
                Response.Write(sitter.fSeniority + "<br/>");
                Response.Write(sitter.fNote + "<br/>");
                Response.Write(sitter.fPhone + "<br/>");
                Response.Write(sitter.fTeltime + "<br/>");
                Response.Write(sitter.fSurround + "<br/>");
                Response.Write(sitter.fCountry + "<br/>");
                Response.Write(sitter.fArea + "<br/>");
                Response.Write(sitter.fAddress + "<br/>");
                Response.Write(sitter.fStayPay + "<br/>");
                Response.Write(sitter.fLicenseHave + "<br/>");
                Response.Write(sitter.fImage + "<br/>");*/

               
               
            }
            else
            {
                //Response.Write("您已是保母");
                Response.Write("<Script language='JavaScript'>alert('您已是保母');</Script>");
            }








        }
        else
            //Response.Write("不能空白");
        Response.Write("<Script language='JavaScript'>alert('不能空白');</Script>");
    }
    public string fileupload()
    {
        if (fileUpload1.HasFile)
        {

            string fileName = fileUpload1.FileName;
            string savePath = Server.MapPath("~/Admemberpic/");
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
                    return "../Admemberpic/" + fileName;

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

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("MemberIndex.aspx");
    }
}