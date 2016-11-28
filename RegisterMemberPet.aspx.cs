using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class RegisterMemberPet3 : System.Web.UI.Page
{
    kMember member = new kMember();
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (Session[Dictionary.SK_memberInfo] != null)
            member = (kMember)Session[Dictionary.SK_memberInfo];
    }
    protected void btnFinish_Click(object sender, EventArgs e)
    {
        if (txtPetName.Text.Length>0&&
          txtWFnumber.Text.Length>0&&
          datepicker.Text.Length>0)
        {

            MemberFactory factory = new MemberFactory();
            if (factory.petExit(txtPetName.Text, member.MemberId))
            {




                kPet pet = new kPet();
                pet.MemberId = member.MemberId;
                pet.fPetName = txtPetName.Text;
                pet.fPetSex = rdbPetsex.SelectedItem.Text;
                pet.fPetType = rdbPetType.SelectedItem.Text;
                pet.fExperience = Request.Form["txtExperience"];
                pet.fNote = Request.Form["txtNote"];
                pet.fBodytype = rdbBodyType.SelectedItem.Text;
                pet.fBirthcontrol = rdbBirthcontrol.SelectedItem.Text;
                pet.fWaferNumber = txtWFnumber.Text;
                /*int i = DateTime.Now.Year;
                int j = DateTime.Parse(datepicker.Text).Year;
                pet.fAge = i - j;*/
                pet.fAge = datepicker.Text;

                if (fileupload() != null)
                {
                    pet.fPetPic = fileupload();
                    factory.registerPet(pet);
                    Response.Redirect("MemberPetList.aspx");
                }
                else {
                    //Response.Write("請選擇寵物照片");
                    Response.Write("<Script language='JavaScript'>alert('請選擇寵物照片');</Script>");
                }


            }
            else
               // Response.Write("已有這隻寵物");
            Response.Write("<Script language='JavaScript'>alert('已有這隻寵物');</Script>");

        }

    }
    public string fileupload()
    {
        if (fileUpload1.HasFile)
        {

            string fileName = fileUpload1.FileName;
            string savePath = Server.MapPath("~/Petpic/");
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
                    return "../Petpic/" + fileName;

                }
                else
                    return null;


            }
            else
            {
              //  Response.Write("上傳的檔案必須小於1MB");
                Response.Write("<Script language='JavaScript'>alert('上傳的檔案必須小於1MB');</Script>");
                return null;
            }
        }
        else
            return null;





    }
}