using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 測試圖片上傳 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Upload(object sender, EventArgs e)
    {
        int contentLength = avatarUpload.PostedFile.ContentLength;//You may need it for validation
        string contentType = avatarUpload.PostedFile.ContentType;//You may need it for validation
        string fileName = avatarUpload.PostedFile.FileName;
        avatarUpload.PostedFile.SaveAs(@"c:\test.tmp");//Or code to save in the DataBase.
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
}