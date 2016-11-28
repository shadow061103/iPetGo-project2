<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wbProductDelete.aspx.cs" Inherits="iPetGo_wbProductDelete" %>
<%

    (new productFoctory()).DeleteProduct(Request.QueryString["p_id"]);
    Response.Redirect("wbProduct.aspx");

     %>