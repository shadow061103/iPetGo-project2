using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;

public partial class MemberPetProFile : System.Web.UI.Page
{
    MemberFactory factory = new MemberFactory();
    
   
    kPet pet =new kPet();

    protected void Page_Load(object sender, EventArgs e)
    {
        
       int  memberid = (int)Session[Dictionary.SK_memberId];
        if(!Page.IsPostBack){
         int petid = Convert.ToInt32(Request.Form["id"]);
         if (petid != 0)
              Session[Dictionary.SK_petid]= petid; ;

            if (Request["action"] == "刪除")
            {

                factory.deletePet(memberid, petid);
                Response.Redirect("MemberPetList.aspx");
            }
            else
            {
                pet = factory.showPet(memberid, petid);
                if (pet != null)
                {
                    reloaddata();
                }
            }
         
         
         }

        
    }

    private void reloaddata()
    {
        txtPetName.Text = pet.fPetName;
        rdbPetType.SelectedValue = pet.fPetType;
        rdbPetsex.SelectedValue = pet.fPetSex;
        datepicker.Text = pet.fAge;
        rdbBodyType.SelectedValue = pet.fBodytype;
        txtExperience.Text = pet.fExperience;
        txtNote.Text = pet.fNote;
        rdbBirthcontrol.SelectedValue = pet.fBirthcontrol;
        txtWFnumber.Text = pet.fWaferNumber;
        Avatar.ImageUrl = pet.fPetPic;
    }
    protected void btnFinish_Click(object sender, EventArgs e)
    {
        if (txtPetName.Text.Length > 0 &&
          datepicker.Text.Length > 0 &&
           txtWFnumber.Text.Length > 0)
        {






            int petid = (int)Session[Dictionary.SK_petid];
            int memberid = (int)Session[Dictionary.SK_memberId];
            pet = factory.showPet(memberid, petid);
            pet.MemberId = memberid;
            pet.fPetId = petid;
            pet.fPetName = txtPetName.Text;
            pet.fPetSex = rdbPetsex.SelectedItem.Text;
            pet.fPetType = rdbPetType.SelectedItem.Text;
            pet.fExperience = txtExperience.Text;
            pet.fNote = txtNote.Text;
            pet.fBodytype = rdbBodyType.SelectedItem.Text;
            pet.fBirthcontrol = rdbBirthcontrol.SelectedItem.Text;
            pet.fWaferNumber = txtWFnumber.Text;
            pet.fAge = datepicker.Text;

            if (fileupload() != null)
                pet.fPetPic = fileupload();//上傳圖片
            else
                pet.fPetPic = Avatar.ImageUrl;


            if (memberid != 0 && petid != 0)
            {
                int i = factory.updatePet(pet);
                if (i > 0)
                {
                   // Response.Write("更新成功");
                    Response.Write("<Script language='JavaScript'>alert('更新成功');</Script>");
                    reloaddata();
                }
            }
            reloaddata();
            //Response.Redirect("MemberPetList.aspx");



        }
        else {
            //Response.Write("輸入格式有誤");
            Response.Write("<Script language='JavaScript'>alert('輸入格式有誤');</Script>");
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
                Response.Write("上傳的檔案必須小於1MB");
                return null;
            }
        }
        else
            return null;





    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("MemberPetList.aspx");
    }
}