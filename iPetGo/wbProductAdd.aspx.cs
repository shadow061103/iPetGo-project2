using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class iPetGo_Default : System.Web.UI.Page
{
    productFoctory foctory = new productFoctory();
    protected void Page_Load(object sender, EventArgs e)
    {
        Button1.Attributes["Onclick"] = "return confirm('確定要送出資料嗎?')";
        txtAdd.Text = DateTime.Now.ToString("yyyy-MM-dd");
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        product product = new product();
        string photoName = Guid.NewGuid().ToString() + ".jpg";
        
            product.P_name = txtName.Text;
            product.P_price = Convert.ToInt32(txtPrice.Text);
            product.P_addDate = txtAdd.Text;
            product.P_description = txtDescription.Text;
            if (FileUpload1.HasFile)
            {
                product.P_image = "../img/" + photoName;
                FileUpload1.SaveAs(Server.MapPath("../img/" + photoName));
            }
            else
            {
                product.P_image = "None";
            }
        
        foctory.InsertProduct(product, DropDownList1.SelectedItem.Value);
        refresh();
    }

    private void refresh()
    {
        txtAdd.Text = DateTime.Now.ToString("yyyy-MM-dd"); ;
        txtDescription.Text = "";
        txtName.Text = "";
        txtPrice.Text = "";
        DropDownList1.SelectedValue = "1";
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        refresh();
    }
}