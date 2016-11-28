<%@ Page Title="" Language="C#" MasterPageFile="~/iPetGo/Master.master" AutoEventWireup="true" CodeFile="wbOrderStatus.aspx.cs" Inherits="iPetGo_Default" %>

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
    <h1 class="auto-style1">狀態更新</h1><hr />
    <table class="nav-justified">
        <tr>
            <td>
                <table class="table" style="border-color:#FFFFFF">
                    <tbody class="auto-style1">
                    <tr>
                        <td colspan="2" class="auto-style2">
                            <table class="nav-justified">
                                <tr>
                                    <td>編號：<asp:Label ID="lblID" runat="server" Text="Label"></asp:Label>
                                        　</td>
                                    <td>訂購人：<asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                                        　</td>
                                    <td>訂購日期：<asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label>
                                        　</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">目前狀態</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" Width="50%">
                                <asp:ListItem>未付款</asp:ListItem>
                                <asp:ListItem>已付款</asp:ListItem>
                                <asp:ListItem>未出貨</asp:ListItem>
                                <asp:ListItem>已出貨</asp:ListItem>
                                <asp:ListItem>已收到商品</asp:ListItem>
                                <asp:ListItem>訂單取消</asp:ListItem>
                                <asp:ListItem>訂單完成</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            &nbsp;</td>
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

