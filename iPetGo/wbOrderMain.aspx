<%@ Page Title="" Language="C#" MasterPageFile="~/iPetGo/Master.master" AutoEventWireup="true" CodeFile="wbOrderMain.aspx.cs" Inherits="iPetGo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style13 {
            height: 20px;
        }
        .auto-style14 {
            font-family: 微軟正黑體;
        }
        .auto-style15 {
            border-collapse: collapse;
            width: 100%;
            max-width: 100%;
            font-size: large;
            margin-bottom: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="auto-style14">訂購單管理</h1>
    <table class="nav-justified">
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoAzureConnectionString %>" SelectCommand="SELECT * FROM [vOrderMain] ORDER BY [fOrderId] DESC">
                </asp:SqlDataSource>
                <table class="nav-justified">
                    <tr>
                        <td style="width:20%">
                <asp:TextBox ID="KeyWord" runat="server" CssClass =" form-control" Width="90%" ></asp:TextBox>
                        </td>
                        <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="搜尋" CssClass="btn btn-default"/>
                            　</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" Width="50%" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem>全部</asp:ListItem>
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
                </table>
                <p></p>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="fOrderId" DataSourceID="SqlDataSource1" BorderColor="White" Width="100%" CssClass="auto-style15 table" AllowPaging="True" Font-Names="微軟正黑體">
                    <Columns>
                        <asp:BoundField DataField="fOrderId" HeaderText="編號" ReadOnly="True" SortExpression="fOrderId" />
                        <asp:BoundField DataField="MemberName" HeaderText="會員姓名" SortExpression="MemberName" />
                        <asp:TemplateField HeaderText="訂購日期" SortExpression="fOrderDate">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fOrderDate") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("fOrderDate", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="fPaymentMT" HeaderText="付款方式" SortExpression="fPaymentMT" />
                        <asp:BoundField DataField="fStatus" HeaderText="狀態" SortExpression="fStatus" />
                        <asp:TemplateField HeaderText="總金額" SortExpression="fTotal">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("fTotal") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("fTotal", "{0:C}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="fOrderId" DataNavigateUrlFormatString="wbOrderDetail.aspx?oid={0}" Text="觀看明細" >
                        <ControlStyle CssClass="btn btn-default" />
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="fOrderId" DataNavigateUrlFormatString="wbOrderStatus.aspx?oid={0}" Text="更新狀態" >
                        <ControlStyle CssClass="btn btn-danger" />
                        </asp:HyperLinkField>
                    </Columns>
                    <PagerStyle Font-Bold="True" Font-Italic="False" Font-Names="微軟正黑體" Font-Overline="False" Font-Size="X-Large" Font-Underline="True" HorizontalAlign="Center" Wrap="False" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

