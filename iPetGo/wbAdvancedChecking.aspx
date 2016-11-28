<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wbAdvancedChecking.aspx.cs" Inherits="iPetGo_wbAdvancedChecking" %>

<%@ Import Namespace="System.Web.Configuration" %>
<%
    string id = Request.QueryString["mid"];
    SqlDataSource sds = new SqlDataSource();
    sds.ConnectionString = WebConfigurationManager.ConnectionStrings["iPetGoAzureConnectionString"].ConnectionString;
    sds.UpdateCommand = "UPDATE Member Set fRight = 4 , fCheck=0 Where MemberId = "+id;
    sds.Update();
    Response.Redirect("wbAdvancedCheck.aspx");
     %>
