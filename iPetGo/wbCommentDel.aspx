<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wbCommentDel.aspx.cs" Inherits="iPetGo_wbAdvancedChecking" %>

<%@ Import Namespace="System.Web.Configuration" %>
<%
    string id = Request.QueryString["fid"];
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = WebConfigurationManager.ConnectionStrings["iPetGoAzureConnectionString"].ConnectionString;
            sds.DeleteCommand = "Delete from tComment where fCommentId=@aid";
            sds.DeleteParameters.Add("aid", id);
            sds.Delete();
    Response.Write("<script>alert('刪除成功'); location.href='wbComment.aspx';</script>");

     %>
