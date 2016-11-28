<%@ Page Language="C#" AutoEventWireup="true" CodeFile="動態網頁.aspx.cs" Inherits="動態網頁" %>
<%@import Namespace="System.Data.SqlClient" %>
<%@import Namespace="System.Data" %>
<%@import Namespace="System.Web" %>

<%
   // MemberFactory factory = new MemberFactory();
  //  factory.textweb(Response);
   SqlConnectionStringBuilder scsb;
        scsb = new SqlConnectionStringBuilder();
        scsb.DataSource = ".";
        scsb.InitialCatalog = "iPetGo";
        scsb.IntegratedSecurity = true;
        SqlConnection con = new SqlConnection(scsb.ToString());
        con.Open();
        string strsql = "select * from Member";
        SqlCommand cmd = new SqlCommand(strsql, con);

        SqlDataReader reader = cmd.ExecuteReader();
        Response.Write("<table><tr><th>會員編號</th><th>會員帳號</th><th>密碼</th><th>姓名</th><th>性別</th><th>郵件</th><th>權限</th></tr>");

        if (reader.HasRows)
        {
            while (reader.Read())
            {
                Response.Write("<tr>");
                Response.Write("<td>" + reader.GetInt32(0) + "</td>");
                Response.Write("<td>" + reader.GetString(1) + "</td>");
                Response.Write("<td>" + reader.GetString(2) + "</td>");
                Response.Write("<td>" + reader.GetString(3) + "</td>");
                Response.Write("<td>" + reader.GetString(4) + "</td>");
                Response.Write("<td>" + reader.GetString(5) + "</td>");
                Response.Write("<td>" + reader.GetInt32(6) + "</td>");
                Response.Write("</tr>");
            }

        }
        Response.Write("</table>");
        reader.Close();
        con.Close();


    %>