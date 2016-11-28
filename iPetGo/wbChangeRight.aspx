<%@ Page Title="" Language="C#" MasterPageFile="~/iPetGo/Master.master" AutoEventWireup="true" CodeFile="wbChangeRight.aspx.cs" Inherits="iPetGo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-family: 微軟正黑體;
        }
        .auto-style2 {
            font-size: large;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="auto-style1">變更權限</h1><hr />
    <table class="nav-justified">
        <tr>
            <td>
                <table class="table" style="border-color:#FFFFFF">
                    <tr>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width:10%" class="auto-style2">權限</td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server" class="form-control" Width="50%">
                                <asp:ListItem Value="1">會員停權</asp:ListItem>
                                <asp:ListItem Value="2">保母停權</asp:ListItem>
                                <asp:ListItem Value="3">會員</asp:ListItem>
                                <asp:ListItem Value="4">保母</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    </table>
                <asp:Button ID="Button1" runat="server" Text="送出" OnClick="Button1_Click" CssClass="auto-style1 btn btn-primary" Height="38px" /><span class="auto-style1">&nbsp;&nbsp;
                </span>
                <asp:Button ID="Button2" runat="server" Text="取消" OnClick="Button2_Click" CssClass="auto-style1 auto-style1 btn btn-default" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

