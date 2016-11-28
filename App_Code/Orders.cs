using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// OrderDetail 的摘要描述
/// </summary>
public class Orders
{
    SqlDataSource sds;
    public Orders()
    {
        sds = new SqlDataSource();
        sds.ConnectionString = WebConfigurationManager.ConnectionStrings["iPetGoAzureConnectionString"].ConnectionString;
    }
    public DataView dataview (string id)
    {
       
        sds.SelectCommand = "SELECT om.fOrderId,m.MemberName,om.fOrderDate,om.fPaymentMT,om.fStatus,om.fTotal,om.fOrderName,om.fAddress,om.fPhone " +
                    "FROM tOrderMain om inner join Member m ON om.MemberId = m.MemberId where om.fOrderId=@id";
        sds.SelectParameters.Add("id", id);
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;
        return dv;
    }
    public void UpdateStatus(string status,string id)
    {
        sds.UpdateCommand = "UPDATE tOrderMain SET fStatus=@status where fOrderId=@id";
        sds.UpdateParameters.Add("status", status);
        sds.UpdateParameters.Add("id", id);
        sds.Update();
    }
    public DataView dataviewForSearch(string id)
    {
        sds.SelectCommand = "SELECT om.fOrderId,m.MemberName,om.fOrderDate,om.fPaymentMT,om.fStatus,om.fTotal " +
                    "FROM tOrderMain om inner join Member m ON om.MemberId = m.MemberId where om.fOrderId LIKE @id OR m.MemberName LIKE @id";
        sds.SelectParameters.Add("id", "%"+id+"%");
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;
        return dv;
    }
    public List<OrderDetail> OrderCart(string id ,Object session ,int qty )
    {
        sds.SelectCommand = "SELECT * FROM Product WHERE product_id=@kk";
        sds.SelectParameters.Add("kk", id);
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;
        List<OrderDetail> list = (List<OrderDetail>)session;
        if (list == null)
        {
            list = new List<OrderDetail>();
        }
        OrderDetail item = new OrderDetail()
        {
            p_id = Convert.ToInt32(id),
            o_qty = qty,
            p_name = dv.Table.Rows[0]["product_name"].ToString(),
            o_price = Convert.ToInt32(dv.Table.Rows[0]["product_price"].ToString())
        };
        list.Add(item);
        return list;
    }
    public void InsertOrderMain(Object sender)
    {
        OrdersMain main = sender as OrdersMain;
        sds.InsertCommand = "INSERT INTO tOrderMain VALUES (@mid,@date,@PM,@Status,@total,@name,@address,@phone)";
        sds.InsertParameters.Add("mid",main.o_mid);
        sds.InsertParameters.Add("date", main.o_orderDate);
        sds.InsertParameters.Add("PM", main.o_payment);
        sds.InsertParameters.Add("Status", main.o_status);
        sds.InsertParameters.Add("total", main.o_total.ToString());
        sds.InsertParameters.Add("name", main.o_name);
        sds.InsertParameters.Add("address", main.o_address);
        sds.InsertParameters.Add("phone", main.o_phone);
        sds.Insert();
    }
    public string NewOrderID(string account)
    {
        sds.SelectCommand = "SELECT fOrderId FROM tOrderMain where MemberId=@id ORDER BY fOrderId DESC";
        sds.SelectParameters.Add("id", account);
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;
        string id=dv.Table.Rows[0]["fOrderId"].ToString();
        return id;
    }

    public void InsertOrderDetail(string oid ,Object sender)
    {
        OrderDetail detail = sender as OrderDetail;
        sds.InsertCommand = "INSERT INTO tOrderDetail VALUES ("+ oid + "," + detail.p_id.ToString() + "," + detail.o_qty.ToString() + "," + detail.o_price.ToString() + ") ";
        sds.Insert();
    }
    public DataView SeachOrderStatus(string status)
    {
        sds.SelectCommand = "select *  from vOrderMain where fStatus = @status ORDER BY fOrderId DESC";
        sds.SelectParameters.Add("status", status);
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        return dv;
    }
    public DataView NewOrder()
    {
        sds.SelectCommand = "select *  from vOrderMain ORDER BY fOrderId DESC ";
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        return dv;
    }
    public DataView m客戶訂單(string account)
    {
        sds.SelectCommand = "SELECT * FROM tOrderMain where MemberId=@id ORDER BY fOrderId DESC";
        sds.SelectParameters.Add("id", account);
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;
        return dv;
    }
    public DataView m客戶訂單明細(string account)
    {
        sds.SelectCommand = "SELECT * FROM vOrderDetailHaveName where fOrderId=@id";
        sds.SelectParameters.Add("id", account);
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;
        return dv;
    }
    public void m取消訂單(string id)
    {
        sds.UpdateCommand = "UPDATE tOrderMain SET fStatus=N'取消訂單' where fOrderId=@id";
        sds.UpdateParameters.Add("id", id);
        sds.Update();
    }
    public void m已付款(string id, string message)
    {
        sds.InsertCommand = "Insert into tPaid VALUES ('" + id + "',N'" + message + "')";
        sds.Insert();
        sds.UpdateCommand = "UPDATE tOrderMain SET fStatus=N'已付款' where fOrderId=@id";
        sds.UpdateParameters.Add("id", id);
        sds.Update();
    }
}