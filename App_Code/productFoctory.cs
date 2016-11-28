using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for productFoctory
/// </summary>
public class productFoctory
{
    SqlDataSource sds;
    public productFoctory()
    {
        sds = new SqlDataSource();
        sds.ConnectionString = WebConfigurationManager.ConnectionStrings["iPetGoAzureConnectionString"].ConnectionString;
    }
    public  product  getProduct(string id)
    {
        sds.SelectCommand = "select *  from vProduct WHERE product_id =@pk";
        sds.SelectParameters.Add("pk", id);
        DataView dv= sds.Select(DataSourceSelectArguments.Empty) as DataView;

        product product = new product();
        product.P_id = Convert.ToInt32(dv.Table.Rows[0]["product_id"]);
        product.P_name = dv.Table.Rows[0]["product_name"].ToString();
        product.P_type = dv.Table.Rows[0]["product_type"].ToString(); 
        product.P_addDate = String.Format("{0:yyyy/MM/dd}", dv.Table.Rows[0]["product_added_date"].ToString());
        product.P_price = Convert.ToInt32(dv.Table.Rows[0]["product_price"]);
        product.P_description = dv.Table.Rows[0]["product_description"].ToString();
        product.P_image = dv.Table.Rows[0]["product_pic"].ToString();

        return product;
    }
    public product UpdateProduct(product m)
    {
        sds.UpdateCommand = "UPDATE Product SET  "
            + "product_name=@name, product_price=@price,product_type=@type, product_added_date=@date, "
            + "product_description=@desc, product_pic=@pic WHERE product_id=@id";
        sds.UpdateParameters.Add("id",m.P_id.ToString());
        sds.UpdateParameters.Add("name", m.P_name.ToString());
        sds.UpdateParameters.Add("price", m.P_price.ToString());
        sds.UpdateParameters.Add("type", m.P_type.ToString());
        sds.UpdateParameters.Add("date", m.P_addDate.ToString());
        sds.UpdateParameters.Add("desc", m.P_description.ToString());
        sds.UpdateParameters.Add("pic", m.P_image.ToString());
        sds.Update();
        return m;
        
    }
    public product InsertProduct(product m, string _id)
    {
        sds.InsertCommand = InsertSQL(m,_id);
        sds.Insert();
        return m;
    }
    private string InsertSQL(product m,string _id) {
        string strSql = "INSERT INTO Product VALUES(";
        strSql += "N'" + m.P_name + "',";
        strSql += "N'" + m.P_price.ToString() + "',";
        strSql += "'" + m.P_addDate + "',";
        strSql += "N'" + _id + "',";
        strSql += "N'" + m.P_description + "',";
        strSql += "N'" + m.P_image + "')";
        return strSql;
    }
    public DataView ProductTable主食()
    {
        sds.SelectCommand = "select *  from Product p inner join tProductType pt on p.product_type = pt._id where tClass =1";
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        return dv;
    }
    public DataView ProductTable商品()
    {
        sds.SelectCommand = "select *  from Product p inner join tProductType pt on p.product_type = pt._id where tClass =2";
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        return dv;
    }
    public DataView ProductClass(string id)
    {
        sds.SelectCommand = "select *  from Product where product_type=@id";
        sds.SelectParameters.Add("id", id);
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        return dv;
    }
    public DataView ProductTableFor商品明細(string id)
    {
        sds.SelectCommand = "select *  from Product p inner join tProductType pt on p.product_type = pt._id where _id =@_id";
        sds.SelectParameters.Add("_id",id);
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        return dv;
    }
    public DataView SeachProduct(string KeyWord)
    {
        sds.SelectCommand = "select *  from Product where product_name LIKE @_id OR product_id LIKE @_id ";
        sds.SelectParameters.Add("_id", "%"+KeyWord+"%");
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        return dv;
    }
    public DataView SeachProductType(string typeId)
    {
        sds.SelectCommand = "select *  from vProduct where product_type = @t_id ";
        sds.SelectParameters.Add("t_id", typeId);
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        return dv;
    }

    public void DeleteProduct(string id)
    {
        sds.DeleteCommand = "DELETE FROM Product WHERE product_id = " + id;
        sds.Delete();
    }
}