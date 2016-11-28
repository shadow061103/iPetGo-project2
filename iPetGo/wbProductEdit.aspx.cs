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
        string id = Request.QueryString["pid"];
        if (string.IsNullOrEmpty(id))
        {
            Response.Redirect("wbProduct.aspx");
        }
        product product = foctory.getProduct(id);
        if (!IsPostBack)
        {
            txtName.Text = product.P_name;
            txtPrice.Text = product.P_price.ToString();
            txtType.Text = product.P_type.ToString();
            txtAddDate.Text = String.Format("{0:yyyy-MM-dd}", Convert.ToDateTime(product.P_addDate));
            txtDescription.Text = product.P_description;
        }
        Image1.ImageUrl = product.P_image;

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        product product = new product();

        string id = Request.QueryString["pid"];
        string photoName = Guid.NewGuid().ToString() + ".jpg";
        product.P_id = Convert.ToInt32(id);
        product.P_name = txtName.Text;
        product.P_price = Convert.ToInt32(txtPrice.Text);
        product.P_type = txtType.Text;
        product.P_addDate = String.Format("{0:yyyy-MM-dd}", txtAddDate.Text);
        product.P_description = txtDescription.Text;
        if (FileUpload1.HasFile)
        {
            product.P_image = "../img/" + photoName;
            FileUpload1.SaveAs(Server.MapPath("../img/" + photoName));
        }
        else
        {
            product.P_image = Image1.ImageUrl;
        }

        foctory.UpdateProduct(product);//update
        if (!IsPostBack)
        {
            txtName.Text = product.P_name;
            txtPrice.Text = product.P_price.ToString();
            txtType.Text = product.P_type.ToString();
            txtAddDate.Text = product.P_addDate;
            Image1.ImageUrl = product.P_image;
            txtDescription.Text = product.P_description;
        }
        Label1.Visible = true;
        Label1.Text = "更新成功";
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

    }
}