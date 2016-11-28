<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="MembersOrderCO.aspx.cs" Inherits="Default2" %>

<%
    Orders factory= new Orders();
    factory.m取消訂單(Request.QueryString["o_id"]);
    Response.Redirect("MembersOrder.aspx");

     %>
