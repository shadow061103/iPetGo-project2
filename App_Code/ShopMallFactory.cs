using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// ShopMallFactory 的摘要描述
/// </summary>
public class ShopMallFactory
{//首頁秀熱門商品
    public string showproductIndex(int type,int num)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
          .ConnectionString);
        con.Open();
        string strSQL = "SELECT TOP "+num+" * FROM Product as p join tProductType as t on p.product_type=t._id"
 + " where t.tClass=@type ORDER BY NEWID()";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"type", type);
        SqlDataReader reader = cmd.ExecuteReader();
        StringBuilder htmlcode = new StringBuilder();
        while (reader.Read())
        {
            htmlcode.Append("<form action='ProductDetail.aspx' method='post'><div class='col-sm-4 col-lg-4 col-md-4'><div class='thumbnail'><img src='"+reader.GetString(6)+"'  style='width: 320px; height: 200px'><div class='caption' style='height: 170px'><h4 class='pull - right'>NT" + reader.GetInt32(2) + "</h4><input type='hidden' name='id' value='" + reader.GetInt32(0) + "'/><input  type='submit' name='action' class='linkButton wrap' value='" + reader.GetString(1) + "'/></div></div></div></form>");

        }
        reader.Close();
        con.Close();
        return htmlcode.ToString();

    }
    //查商品資料 顯示在頁面上
     public kProduct QueryProduct(int id)
    {
        kProduct product = new kProduct();
        //SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = "select * from Product where product_id=@id";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"id", id);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            product.id = reader.GetInt32(0);
            product.name = reader.GetString(1);
            product.price = reader.GetInt32(2);
            product.addDate = reader.GetDateTime(3).ToString();
            product.type = reader.GetInt32(4);
            product.description = reader.GetString(5);
            product.image = reader.GetString(6);
        }
        reader.Close();
        con.Close();
        return product;
    }
    //看是否購物車內是否有這項商品
    public CartItem CartitemExit(int memberid,int productid)
    {
        //SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = "select * from Cart where MemberId=@MemberId and product_id=@product_id";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId", memberid);
        cmd.Parameters.AddWithValue(@"product_id", productid);
        SqlDataReader reader = cmd.ExecuteReader();
        CartItem item = new CartItem();
        if (reader.Read())
        {

            item.MemberId = reader.GetInt32(0);
            item.ProductId = reader.GetInt32(1);
            item.Productname = reader.GetString(2);
            item.Qty = reader.GetInt32(3);
            item.Price = reader.GetInt32(4);
            

        }
        else
            return null;



        reader.Close();
        con.Close();

        return item;


    }
    //把商品加到購物車
    public int AddtoCart(CartItem item)
    {
        // SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();

        string strSQL = @"Insert into Cart(MemberId, product_id, Productname
                  ,qty,Price,Amount) values (@MemberId,@product_id,@Productname,@qty,
@Price,@Amount)";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId", item.MemberId);
        cmd.Parameters.AddWithValue(@"product_id", item.ProductId);
        cmd.Parameters.AddWithValue(@"Productname", item.Productname);
        cmd.Parameters.AddWithValue(@"qty", item.Qty);
        cmd.Parameters.AddWithValue(@"Price", item.Price);
        cmd.Parameters.AddWithValue(@"Amount", item.Amount);

       int i= cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    //更新購物車資料
    public int CartItemUpdate(CartItem item)
    {
        // SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = "update Cart set qty=@qty,"
            + "Amount=@Amount where MemberId=@MemberId and product_id=@product_id";

        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId",item.MemberId);
        cmd.Parameters.AddWithValue(@"product_id",item.ProductId);
        cmd.Parameters.AddWithValue(@"qty",item.Qty);
        cmd.Parameters.AddWithValue(@"Amount",item.Amount);

        int i=cmd.ExecuteNonQuery();
       
        con.Close();
        return i;
       
    }
    //購物清單
    public string showCartList(int memberid)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
          .ConnectionString);
        con.Open();
        string strSQL = @"select * from Cart where MemberId=@MemberId";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId", memberid);
        SqlDataReader reader = cmd.ExecuteReader();
        StringBuilder htmlcode = new StringBuilder();
        while (reader.Read())
        {
            htmlcode.Append("<form action='basketCart.aspx' method='post'><input type='hidden' name='id' value='"+reader.GetInt32(1)+ "'/><table class='table1'><tr><td style='width: 500px'>" + reader.GetString(2)+"</td><td>"+reader.GetInt32(3)+"</td><td>"+reader.GetInt32(4)+"</td><td>"+reader.GetInt32(5)+ "</td><td><input type='submit' name='action' value='delete' class='trash' /></td></tr></table></form>");

        }
        reader.Close();
        con.Close();
        return htmlcode.ToString();

    }
    public string checkCartList(int memberid)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
          .ConnectionString);
        con.Open();
        string strSQL = @"select * from Cart where MemberId=@MemberId";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId", memberid);
        SqlDataReader reader = cmd.ExecuteReader();
        StringBuilder htmlcode = new StringBuilder();
        while (reader.Read())
        {
            htmlcode.Append("<tr><td colspan='4'>"+reader.GetString(2)+"</td><td>"+reader.GetInt32(3)+"</td><td>"+reader.GetInt32(4)+"</td><td>"+reader.GetInt32(5)+"</td></tr>");

        }
        reader.Close();
        con.Close();
        return htmlcode.ToString();

    }
    //算總價
    public int CartAmount(int memberid)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
          .ConnectionString);
        con.Open();
        string strSQL = @"select * from Cart where MemberId=@MemberId";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId", memberid);
        SqlDataReader reader = cmd.ExecuteReader();
        StringBuilder htmlcode = new StringBuilder();
        int total = 0;
        while (reader.Read())
        {
            total += reader.GetInt32(5);

        }
        reader.Close();
        con.Close();
        return total;

    }
    //刪除購物車內的商品
    public void deleteCartitem(int memberid, int productid)
    {
        // SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = @"delete from Cart where MemberId=@MemberId and product_id=@product_id";

        SqlCommand cmd = new SqlCommand(strSQL, con);

        cmd.Parameters.AddWithValue(@"MemberId", memberid);
        cmd.Parameters.AddWithValue(@"product_id", productid);

        cmd.ExecuteNonQuery();
        con.Close();
    }
    //取得購物車的所有商品
    public List<CartItem> getCartItem(int MemberId)
    {
        kProduct product = new kProduct();
        //SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = "select * from Cart where MemberId=@MemberId";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId", MemberId);
        SqlDataReader reader = cmd.ExecuteReader();
        //Cart cartitem = new Cart();
        List<CartItem> cart = new List<CartItem>();
        while (reader.Read())
        {
            CartItem item = new CartItem();
            item.MemberId = reader.GetInt32(0);
            item.ProductId = reader.GetInt32(1);
            item.Productname = reader.GetString(2);
            item.Qty = reader.GetInt32(3);
            item.Price = reader.GetInt32(4);
            cart.Add(item);
            
        }
        reader.Close();
        con.Close();
        return cart;
    }
    //商品列表
    public string showproductList(HttpRequest request, HttpResponse response, int id)
    {
        Boolean haveRec = false;

        // p 就是「目前在第幾頁?」
        int p = Convert.ToInt32(request["p"]);



        //SqlConnection Conn = new SqlConnection(scsb.ToString());
        // SqlConnection Conn = new SqlConnection("Data Source=CR1-16;Initial Catalog=iPetGo;Integrated Security=True;MultipleActiveResultSets=True");
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string str = "select count(product_id) from Product where product_type="+id;
        
        SqlCommand cmd = new SqlCommand(str, con);


        //每頁展示 6筆資料
        int PageSize = 9;
        StringBuilder htmlcode = new StringBuilder();

        //SQL指令共撈到多少筆（列）資料。RecordCount資料總筆（列）數
        int RecordCount = (int)cmd.ExecuteScalar();

        //如果撈不到資料，程式就結束。-- Start --------------
        if (RecordCount == 0)
        {
            htmlcode.Append("<label style = 'font-size:larger' > 此種類商品尚未上架，請耐心等候!</ label >");

            con.Close();
            return htmlcode.ToString();
        }    //-- End ----------

        //Pages 資料的總頁數。搜尋到的所有資料，共需「幾頁」才能全部呈現？
        int Pages = ((RecordCount + PageSize) - 1) / (PageSize);    //除法，取得「商」。

        //  底下這一段IF判別式，是用來防呆，防止一些例外狀況。-- start --        
        if (request["p"] == null)
        {
            p = 1;
        }
        else
        {
            if (IsNumeric(request["p"]))
            {
                //有任何問題，就強制跳回第一頁（p=1）。
                //頁數（p）務必是一個整數。而且需要大於零、比起「資料的總頁數」要少
                if ((p > 0) & (p <= Pages))
                {
                    p = Convert.ToInt32(request["p"]);
                }
                else
                {
                    p = 1;
                }
            }
            else
            {
                p = 1;
            }
        }  //上面這一段IF辦別式，是用來防呆，防止一些例外狀況。-- end --

        //NowPageCount，目前這頁的資料
        int NowPageCount = 0;
        if (p > 0)
        {
            NowPageCount = (p - 1) * PageSize;    //PageSize，每頁展示6筆資料（上面設定過了）
        }



        SqlDataReader reader = null;
        string strSQL = " select   product_id,product_name,product_price,product_pic,product_type from (select ROW_NUMBER() OVER(ORDER BY product_type) AS 'RowNo', * from Product where product_type = "+id+") as t where t.RowNo between " + (NowPageCount + 1) + " and " + (NowPageCount + PageSize)+ " and product_type="+id;
       
        //==SQL指令的 ROW_NUMBER。參考資料： http://technet.microsoft.com/zh-tw/library/ms186734.aspx 
        SqlCommand cmd1 = new SqlCommand(strSQL, con);
        reader = cmd1.ExecuteReader();
        //========================
        while (reader.Read())
        {
            haveRec = true;
            htmlcode.Append("<form action='ProductDetail.aspx' method='post'><div class='col-sm-4 col-lg-4 col-md-4'><div class='thumbnail'><img src='"+reader.GetString(3)+"'  style='width: 320px; height: 200px'><div class='caption' style='height: 160px'><h4 class='pull - right'>NT" + reader.GetInt32(2) + "</h4><input type='hidden' name='id' value='" + reader.GetInt32(0) + "'/><input  type='submit' name='action' class='linkButton wrap' value='" + reader.GetString(1) + "'/></div></div></div></form>");

        }

        if (haveRec)  // 以下區塊，是畫面下方的分頁功能---------------------------------------------------------
        {



            if (Pages > 0)
            {




                //========= MIS2000 Lab.自製的「每十頁」一間隔，分頁功能=========start====
                htmlcode.Append("<hr width='97%' size=1>");


                int block_page = 0;
                block_page = p / 10;   //--只取除法的整數成果（商），若有餘數也不去管它。

                if (block_page > 0)
                {
                    htmlcode.Append("<a href='petShopClass.aspx?_id="+id+"&p=" + (((block_page - 1) * 10) + 9) + "'> [前十頁]  </a>&nbsp;&nbsp;");

                }

                for (int K = 0; K <= 10; K++)
                {
                    if ((block_page * 10 + K) <= Pages)
                    {   //--- Pages 資料的總頁數。共需「幾頁」來呈現所有資料？
                        if (((block_page * 10) + K) == p)
                        {   //--- p 就是「目前在第幾頁」
                            htmlcode.Append("[<b>" + p + "</b>]" + "&nbsp;&nbsp;&nbsp;");

                        }
                        else
                        {
                            if (((block_page * 10) + K) != 0)
                            {
                                htmlcode.Append("<a href='petShopClass.aspx?_id=" + id + "&p=" + (block_page * 10 + K) + "'>" + (block_page * 10 + K) + "</a>");

                                htmlcode.Append("&nbsp;&nbsp;&nbsp;");

                            }
                        }
                    }
                }  //for迴圈 end

                if ((block_page < (Pages / 10)) & (Pages >= (((block_page + 1) * 10) + 1)))
                {
                    htmlcode.Append("&nbsp;&nbsp;<a href='petShopClass.aspx?_id=" + id + "&p=" + ((block_page + 1) * 10 + 1) + "'>  [後十頁]  </a>");

                }
                htmlcode.Append("</div>");

                //========= MIS2000 Lab.自製的「每十頁」一間隔，分頁功能=========end====
            }
        }
        reader.Close();
        con.Close();
        return htmlcode.ToString();






    }
    static bool IsNumeric(object Expression)
    {

        bool isNum;
        double retNum;
        isNum = Double.TryParse(Convert.ToString(Expression), System.Globalization.NumberStyles.Any, System.Globalization.NumberFormatInfo.InvariantInfo, out retNum);
        return isNum;
    }
    //完成訂單第一動-新增主檔
    public int Insertordermain(kOrderMain ordermain)
    {
        // SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();

        string strSQL = @"Insert into tOrderMain(MemberId, fOrderDate, fPaymentMT
                  ,fStatus,fTotal,fOrderName,fAddress,fPhone) 
values (@MemberId,@fOrderDate,@fPaymentMT,@fStatus,
@fTotal,@fOrderName,@fAddress,@fPhone)";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId", ordermain.MemberId);
        cmd.Parameters.AddWithValue(@"fOrderDate", ordermain.OrderDate);
        cmd.Parameters.AddWithValue(@"fPaymentMT", ordermain.Payment);
        cmd.Parameters.AddWithValue(@"fStatus", ordermain.Status);
        cmd.Parameters.AddWithValue(@"fTotal", ordermain.Total);
        cmd.Parameters.AddWithValue(@"fOrderName", ordermain.OrderName);
        cmd.Parameters.AddWithValue(@"fAddress", ordermain.Address);
        cmd.Parameters.AddWithValue(@"fPhone", ordermain.Phone);

      int i=cmd.ExecuteNonQuery();
      
      con.Close();
      return i;
       
    }
    //第二動-取得主檔編號
    public int getOrderid(int memberId) {
        // SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = @"select top 1 fOrderId from tOrderMain 
  where MemberId = @MemberId
  order by fOrderId desc";
        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberId", memberId);
        SqlDataReader reader = cmd.ExecuteReader();

        int orderid = 0;
        while (reader.Read())
        {
            orderid = reader.GetInt32(0);

        }
        reader.Close();
        return orderid;
    
    
    
    }
    //完成訂單第三動-從購物車新增訂單明細  
    public void InsertCartdetil(CartItem cart, int orderId)
    {
        // SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
       
        
       
            string strSQL = @"Insert into tOrderDetail(fOrderId, product_id, fQty
                  ,fSubtotal) values (@fOrderId,@product_id,@fQty,@fSubtotal)";
            SqlCommand cmd = new SqlCommand(strSQL, con);
            cmd.Parameters.AddWithValue(@"fOrderId", orderId);
            cmd.Parameters.AddWithValue(@"product_id", cart.ProductId);
            cmd.Parameters.AddWithValue(@"fQty", cart.Qty);
            cmd.Parameters.AddWithValue(@"fSubtotal", cart.Amount);
            cmd.ExecuteNonQuery();
            
        
        
        con.Close();
      
    }
    //第四動-刪除購物車資料
    public void deleteCartAll(int memberid)
    {
        // SqlConnection con = new SqlConnection(scsb.ToString());
        //webconfig的連線字串 連雲端**********
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
            .ConnectionString);
        ////*******************************
        con.Open();
        string strSQL = @"delete from Cart where MemberId=@MemberId ";

        SqlCommand cmd = new SqlCommand(strSQL, con);

        cmd.Parameters.AddWithValue(@"MemberId", memberid);
        

        cmd.ExecuteNonQuery();
        con.Close();
    }
}