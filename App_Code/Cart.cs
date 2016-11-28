using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Cart 的摘要描述
/// </summary>
public class Cart
{
    public List<CartItem> cart;
    public Cart()
    {
        this.cart = new List<CartItem>();
    }
    public decimal TotalAmount{//計算購物車商品總價
        get {
            decimal totalAmount = 0.0m;
            foreach (CartItem item in this.cart) {

                totalAmount += item.Amount;

            }
            return totalAmount;

        }

    }
    public int Count {//回傳目前有幾筆商品
        get {
            return this.cart.Count;
        }

    }
}