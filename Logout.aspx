<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Logout" %>

<% 
    MemberFactory factory = new MemberFactory();
    factory.Logout(Request, Response);
    Session.RemoveAll();
    Response.Redirect("index.aspx");
   

     %>

