using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class PetSisterProfile : System.Web.UI.Page
{//載入保母資料
    
    PetSitterfactory factory = new PetSitterfactory();
   
    kpetSitter sitter = new kpetSitter();
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
         if (!Page.IsPostBack)
        {
            int id = 0;
            if (Session[Dictionary.SK_memberId] != null)
            {
             id = (int)Session[Dictionary.SK_memberId];
            }
          sitter = factory.QueryPetSitter(id);
            if(sitter!=null)
            reloadData();
            else
                Response.Write("id是空值");
        }

        
    }
        public void reloadData(){
           
         
                txtServiceName.Text = sitter.fserviceName;
                Selfintro.Text = sitter.fIntro;
                txtSeniority.Text = Convert.ToString(sitter.fSeniority);
                note.Text = sitter.fNote;
                txtPhone.Text = sitter.fPhone;
                surround.Text = sitter.fSurround;
                txtPay.Text = sitter.fStayPay;
                txtAddress.Text = sitter.fAddress;
                icon.ImageUrl = sitter.fImage;
                rdbMainType.SelectedValue = sitter.fMainType;
                rdbtellTime1.SelectedValue = sitter.fTeltimeWeek;
                rdbtellTime2.SelectedValue = sitter.fTeltime;
               
                if (sitter.fLicenseHave == true)
                    rdbLicense.SelectedIndex = 0;
                else
                    rdbLicense.SelectedIndex = 1;
            
           
        
        }
protected void btnEdit_Click(object sender, EventArgs e)
    {//開啟編輯模式
        controlEnable(true);
       }

 protected void btnFinish_Click(object sender, EventArgs e)
    {
        controlEnable(false);
        if (txtServiceName.Text.Length > 0 &&
              txtPhone.Text.Length > 0 &&
              txtAddress.Text.Length > 0 &&
              txtPay.Text.Length > 0)
        {
           
              int  id = (int)Session[Dictionary.SK_memberId];

              sitter = factory.QueryPetSitter(id);//找目前保母資料
            sitter.MemberId = id;
            sitter.fserviceName = txtServiceName.Text;
            sitter.fIntro = Selfintro.Text;
            sitter.fMainType = rdbMainType.SelectedItem.Text;
            sitter.fSeniority = Convert.ToInt32(txtSeniority.Text);
            sitter.fNote = note.Text;
            sitter.fPhone = txtPhone.Text;
            if (rdbtellTime1.SelectedItem.Text.Equals("不想接到電話面談"))
            {
                sitter.fTeltime = "無";
                sitter.fTeltimeWeek = rdbtellTime1.SelectedItem.Text;
            }
            else
            {
                sitter.fTeltime = rdbtellTime2.SelectedItem.Text;
                sitter.fTeltimeWeek = rdbtellTime1.SelectedItem.Text;
            }
            sitter.fSurround = surround.Text;
            //縣市
            if (!Request.Form["county"].Equals("選擇縣市"))
                sitter.fCountry = Request.Form["county"];
            
            //選地區
            if (!Request.Form["district"].Equals("選擇區域"))
                sitter.fArea = Request.Form["district"];
           


            sitter.fAddress = txtAddress.Text;
            sitter.fStayPay = txtPay.Text;
            if (rdbLicense.SelectedItem.Text == "有")
                sitter.fLicenseHave = true;
            else
                sitter.fLicenseHave = false;



            if (fileupload() != null)
                sitter.fImage = fileupload();//上傳圖片
            else
                sitter.fImage = icon.ImageUrl;

            

                factory.updateSitter(sitter);//更新資料
                reloadData();
         /*   Response.Write(sitter.MemberId + "ID<br/>");
              Response.Write(sitter.fserviceName + "服務名稱<br/>");
              Response.Write(sitter.fIntro + "自介<br/>");
              Response.Write(sitter.fMainType + "類型<br/>");
              Response.Write(sitter.fSeniority + "<br/>");
              Response.Write(sitter.fNote + "<br/>");
              Response.Write(sitter.fPhone + "<br/>");
              Response.Write(sitter.fTeltime + "<br/>");
              Response.Write(sitter.fSurround + "<br/>");
              Response.Write(sitter.fCountry + "<br/>");
              Response.Write(sitter.fArea + "<br/>");
              Response.Write(sitter.fAddress + "地址<br/>");
              Response.Write(sitter.fStayPay + "費用<br/>");
              Response.Write(sitter.fLicenseHave + "證照<br/>");
              Response.Write(sitter.fImage + "圖片<br/>");*/
             

        }
        else
            Response.Write("不能空白");

    }
    


    protected void btnCancel_Click(object sender, EventArgs e)
    {
        controlEnable(false);
    }
    private void controlEnable(bool t)
    {
        btnEdit.Visible = !t;
        btnFinish.Visible = t;
        btnCancel.Visible = t;
        txtServiceName.Enabled = t;
        Selfintro.Enabled = t;
        txtSeniority.Enabled = t;
        note.Enabled = t;
        txtPhone.Enabled = t;
        surround.Enabled = t;
        txtAddress.Enabled = t;
        txtPay.Enabled = t;
        fileUpload1.Enabled = t;
        rdbLicense.Enabled = t;
        rdbMainType.Enabled = t;
        rdbtellTime1.Enabled = t;
        rdbtellTime2.Enabled = t;
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
                Response.Write("上傳的檔案必須小於1MB");
                return null;
            }
        }
        else
            return null;





    }
}