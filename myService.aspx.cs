using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;


public partial class myService2 : System.Web.UI.Page
{  
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataSource = SqlDataSource2;//我的預約
            GridView1.DataBind();
            GridView2.DataSource = SqlDataSource3;//進行中服務
            GridView2.DataBind();
            GridView3.DataSource = SqlDataSource4;//完成的服務
            GridView3.DataBind();
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.Columns[0].ControlStyle.ForeColor = System.Drawing.Color.Red;
        lblId.Text = GridView1.SelectedRow.Cells[1].Text;
        txtName.Text = GridView1.SelectedRow.Cells[2].Text;
        txtEmail.Text = GridView1.SelectedRow.Cells[3].Text;
        txtPetname.Text = GridView1.SelectedRow.Cells[4].Text;
        txtService.Text = GridView1.SelectedRow.Cells[5].Text;
        txtStartdate.Text=GridView1.SelectedRow.Cells[6].Text;
        txtEnddate.Text=GridView1.SelectedRow.Cells[7].Text;
        txtMessage.Text = GridView1.SelectedRow.Cells[8].Text;

    }
    protected void btnAgree_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(lblId.Text);
        iPetGoDataContext db = new iPetGoDataContext();
        tSitterDetail detail = db.tSitterDetail.FirstOrDefault(m => m.fId == id);
        if (detail != null)
        {
            detail.fStatus = 2;//保母同意
            db.SubmitChanges();
            GridView1.DataSource = SqlDataSource2;
            GridView1.DataBind();
            GridView2.DataSource = SqlDataSource3;
            GridView2.DataBind();
        }
        Clear();

    }

    private void Clear()
    {
        lblId.Text = "";
        txtName.Text = "";
        txtEmail.Text = "";
        txtPetname.Text = "";
        txtService.Text = "";
        txtStartdate.Text = "";
        txtEnddate.Text = "";
        txtMessage.Text = "";
    }

    protected void btnNo_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(lblId.Text);
        iPetGoDataContext db = new iPetGoDataContext();
        tSitterDetail detail = db.tSitterDetail.FirstOrDefault(m => m.fId == id);
        if (detail != null)
        {
            detail.fStatus = 7;//保母拒絕
            db.SubmitChanges();
            GridView1.DataSource = SqlDataSource2;
            GridView1.DataBind();
        }
        Clear();
    }

    //把欄位create再隱藏 這樣才能取值
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow)
        {
            //要隱藏的欄位    
            e.Row.Cells[1].Visible = false;
        }     
        
    }

    
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtfId.Text = GridView2.SelectedRow.Cells[1].Text;
        GridView2.Columns[0].ControlStyle.ForeColor = System.Drawing.Color.Red;

    }
    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(txtfId.Text);
        iPetGoDataContext db = new iPetGoDataContext();
        tSitterDetail detail = db.tSitterDetail.FirstOrDefault(m => m.fId == id);
        if (detail != null)
        {
            detail.fStatus = DropDownList1.SelectedIndex + 2;
            db.SubmitChanges();
            GridView2.DataSource = SqlDataSource3;
            GridView2.DataBind();
            GridView3.DataSource = SqlDataSource4;
            GridView3.DataBind();
        }

    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow) {
            GridView1.Columns[0].ItemStyle.Width = 60;
            GridView1.Columns[0].ControlStyle.ForeColor = System.Drawing.Color.Red;
            GridView2.Columns[6].ItemStyle.Width = 100;
            GridView2.Columns[6].ItemStyle.Wrap = true;
            GridView2.Columns[7].ItemStyle.Width = 100;
            GridView2.Columns[7].ItemStyle.Wrap = true;
            GridView1.Columns[8].ItemStyle.Width = 200;
            GridView1.Columns[8].ItemStyle.Wrap = true;




        }
    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            GridView2.Columns[0].ItemStyle.Width = 90;
            GridView2.Columns[0].ControlStyle.ForeColor = System.Drawing.Color.Red;
            GridView2.Columns[4].ItemStyle.Width = 100;
            GridView2.Columns[4].ItemStyle.Wrap = true;
            GridView2.Columns[6].ItemStyle.Width = 100;
            GridView2.Columns[6].ItemStyle.Wrap = true;
            GridView2.Columns[7].ItemStyle.Width = 100;
            GridView2.Columns[7].ItemStyle.Wrap = true;
            GridView2.Columns[8].ItemStyle.Width = 200;
            GridView2.Columns[8].ItemStyle.Wrap = true;



        }
    }

    protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            GridView3.Columns[1].ItemStyle.Width = 100;
           
            GridView3.Columns[2].ItemStyle.Width = 130;
            GridView3.Columns[3].ItemStyle.Width = 100;
            GridView3.Columns[4].ItemStyle.Width = 80;
            GridView3.Columns[4].ItemStyle.Wrap = true;
            GridView3.Columns[5].ItemStyle.Width = 100;
           
            GridView3.Columns[6].ItemStyle.Width = 100;
            GridView3.Columns[7].ItemStyle.Width = 50;
            GridView3.Columns[7].ItemStyle.Wrap = true;
            GridView3.Columns[8].ItemStyle.Width = 200;
            GridView3.Columns[8].ItemStyle.Wrap = true;
            GridView3.Columns[9].ItemStyle.Width = 100;
        }
    }
}
