using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// CartItem 的摘要描述
/// </summary>
public class CartItem
{
   public int MemberId { get; set; }
    public int ProductId { get; set; }
    public string Productname { get; set; }
    public int Qty { get; set; }
    public int Price { get; set; }
    public decimal Amount {
        get {
            return this.Qty * this.Price;
        }
    }
}