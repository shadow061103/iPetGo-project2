using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegisterMember : System.Web.UI.Page
{
    Member member = new Member();
    int i ;
  
    string memberAccount = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[Dictionary.SK_memberAccount] != null)
        {
            memberAccount = (string)Session[Dictionary.SK_memberAccount];
            txtMemberAccount.Text = memberAccount;
        }
        else
        {

        }

        txtMemberAccount.Attributes.Add("readonly", "readonly");
        txtlatitude.Attributes.Add("readonly", "readonly");
        txtlongitude.Attributes.Add("readonly", "readonly");
        txtLosingAddress.Attributes.Add("readonly", "readonly");
    }



    protected void btnFinish_Click(object sender, EventArgs e)
    {
        if (txtMemberAccount.Text.Length > 0 &&
            txtName.Text.Length > 0 &&
            txtPhone.Text.Length > 0 &&
            txtPetDescription.Text.Length > 0 &&
            txtLosingDate.Text.Length > 0 &&
            txtLosingAddress.Text.Length > 0 &&
            txtlatitude.Text.Length > 0 && 
            txtlongitude.Text.Length > 0 &&
            listArea.SelectedValue != "" &&
            fileUpload1.HasFile
            )
        {
            PetSearchFactory factory = new PetSearchFactory();
            PetSearch search = new PetSearch();

            search.MemberAccount = txtMemberAccount.Text;
            search.fName = txtName.Text;
            search.fPhone = txtPhone.Text;
            search.fPetType = rdPetSelect.SelectedItem.Text;
            search.fPetName = txtPetName.Text;
            search.fPetPic = fileupload();
            search.fPetDescription = txtPetDescription.Text;
            search.fLosingArea = listArea.SelectedValue.ToString();
            search.fLosingDate = txtLosingDate.Text;
            search.fLosingAddress = txtLosingAddress.Text;
            search.fLatitude = txtlatitude.Text;
            search.fLongitude = txtlongitude.Text;
            search.fLosingPoint = txtlatitude.Text + "," + txtlongitude.Text;
            search.fStatus = "協尋中";

            i = factory.InsertMissPetInfo(search);

            if (i > 0)
            {
                Response.Write("<script>alert('資訊登記成功'); location.href='PetSearchInfo.aspx';</script>");
               
            }
           
            
            

            /*
            txtMemberAccount.Text = memberAccount;
            txtName.Text = "";
            txtPhone.Text = "";
            txtPetName.Text = "";
            txtPetDescription.Text = "";
            txtLosingDate.Text = "";
            */

            /*
           
            */
        }
        else
        {

            Response.Write("<script>alert('資訊登記失敗，請檢查是否有欄位沒填')</script>");

        }

      

    }

    public string fileupload()
    {
        if (fileUpload1.HasFile)
        {

            string fileName = fileUpload1.FileName;
            string savePath = Server.MapPath("~/petsearchpic/");
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
                    return "../petsearchpic/" + fileName;

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
            //Response.Write("<script>alert('請選擇寵物照片');</script>");
        return null;
            
    }
}
