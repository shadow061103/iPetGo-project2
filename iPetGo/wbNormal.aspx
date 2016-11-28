<%@ Page Title="" Language="C#" MasterPageFile="~/iPetGo/Master.master" AutoEventWireup="true" CodeFile="wbNormal.aspx.cs" Inherits="iPetGo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="auto-style2">一般會員資料</h1><hr />
    <br />
    <table style="width:100%" align="center">
    <tr>
        <td class="auto-style1" >
            <table class="nav-justified">
                <tr>
                    <td>
            <asp:TextBox ID="SearchKey" runat="server" CssClass="form-control" Width="90%"></asp:TextBox>
                    </td>
                    <td style="width:80%">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="搜尋"  CssClass="btn btn-default"/></td>
                </tr>
            </table>
            <p></p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoAzureConnectionString %>" SelectCommand="SELECT * FROM [vMemberWithRight]">
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
<td class="text-left" >
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MemberId" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" CssClass="table-condensed" style="margin-right: 2px; font-size: large; font-family: 微軟正黑體;" HorizontalAlign="Left" AllowPaging="True" PageSize="15">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="MemberId" HeaderText="會員編號" InsertVisible="False" ReadOnly="True" SortExpression="MemberId" />
                    <asp:BoundField DataField="MemberAccount" HeaderText="會員帳號" SortExpression="MemberAccount" />
                    <asp:BoundField DataField="MemberName" HeaderText="會員姓名" SortExpression="MemberName" />
                    <asp:BoundField DataField="sex" HeaderText="性別" SortExpression="sex" />
                    <asp:BoundField DataField="MemberEmail" HeaderText="電子郵件" SortExpression="MemberEmail" />
                    <asp:TemplateField HeaderText="權限" SortExpression="fRight" >
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fRight") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("fRight") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:HyperLinkField DataNavigateUrlFields="MemberId,fId" DataNavigateUrlFormatString="wbChangeRight.aspx?mid={0}&amp;rid={1}" Text="變更權限" />
                </Columns>
                <EditRowStyle BackColor="Gray" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="Aqua" Font-Bold="True" ForeColor="#003366" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
<td class="text-left" >
            &nbsp;</td>
    </tr>
    </table>
</asp:Content>



