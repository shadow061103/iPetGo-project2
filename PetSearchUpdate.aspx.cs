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

    PetSearchFactory factory = new PetSearchFactory();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request.QueryString["pid"];
            
            if (string.IsNullOrEmpty(id))
            {
                Response.Redirect("PetSearchEdit.aspx");
            }

            PetSearch search = factory.showLosingPetInfo(id);
            
            txtMemberAccount.Text = search.MemberAccount;
            txtName.Text = search.fName;
            txtPhone.Text = search.fPhone;
            txtPetName.Text = search.fPetName;
            txtPetDescription.Text = search.fPetDescription;
            txtLosingDate.Text = search.fLosingDate.ToString();
            txtLosingAddress.Text = search.fLosingAddress;
            txtlatitude.Text = search.fLatitude;
            txtlongitude.Text = search.fLongitude;
            rdPetSelect.SelectedValue = search.fPetType;
            listArea.SelectedValue = search.fLosingArea;
            ImagePrevious.ImageUrl = search.fPetPic;
            listStatus.SelectedValue = search.fStatus;

            txtMemberAccount.Attributes.Add("readonly", "readonly");
            txtlatitude.Attributes.Add("readonly", "readonly");
            txtlongitude.Attributes.Add("readonly", "readonly");
            txtLosingAddress.Attributes.Add("readonly", "readonly");

        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        PetSearch search = new PetSearch();

        string id = Request.QueryString["pid"];
        search.fId = Convert.ToInt32(id);
        search.MemberAccount = txtMemberAccount.Text;
        search.fName = txtName.Text;
        search.fPhone = txtPhone.Text;
        search.fPetType = rdPetSelect.SelectedItem.Text;
        search.fPetName = txtPetName.Text;
        search.fPetDescription = txtPetDescription.Text;
        search.fPetPic = fileupload();
        search.fLosingArea = listArea.SelectedValue.ToString();
        search.fLosingDate = txtLosingDate.Text;
        search.fLosingAddress = txtLosingAddress.Text;
        search.fLatitude = txtlatitude.Text;
        search.fLongitude = txtlongitude.Text;
        search.fLosingPoint = txtlatitude.Text + "," + txtlongitude.Text;
        search.fStatus = listStatus.SelectedValue.ToString();

        factory.UpdateLosingPetInfo(search);

        Response.Write("<script>alert('資訊更新成功'); location.href='PetSearchInfo.aspx';</script>");

      
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("PetSearchEdit.aspx");
    }

    public string fileupload()
    {
        PetSearch search = new PetSearch();
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
        {
          return  search.fPetPic = ImagePrevious.ImageUrl;
        }
            

    }
}
