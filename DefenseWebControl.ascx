<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DefenseWebControl.ascx.cs" Inherits="DefenseWebControl" %>
<%
     kMember member=new kMember();
     int right=0;
     
    if(Session[Dictionary.SK_memberInfo]!=null)
     member = (kMember)Session[Dictionary.SK_memberInfo];
    if(Session[Dictionary.SK_right]!=null)
     right = (int)Session[Dictionary.SK_right];
    
    if (right != 0 && member != null)
    {

        if (right <= 2)
          //Response.Write("停權");
        Response.Redirect("index.aspx");
        else if (right >= 5)
            Response.Redirect("/iPetGo/wbNormal.aspx");
           // Response.Write("管理者");
       
    }
    else
    {
        Response.Redirect("index.aspx");
        Response.Write("不是會員");
    }
    
    
    
    
    
     %>