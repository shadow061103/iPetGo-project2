<%@ Page Title="" Language="C#" MasterPageFile="~/iPetGo/Master.master" AutoEventWireup="true" CodeFile="wbAdvancedCheck.aspx.cs" Inherits="iPetGo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>進階會員審核</h1><hr />

<br />
<table class="nav-justified">
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MemberId" DataSourceID="SqlDataSource1" Width="80%" BorderColor="White" Font-Names="微軟正黑體" Font-Size="Large">
                <Columns>
                    <asp:BoundField DataField="MemberId" HeaderText="編號" InsertVisible="False" ReadOnly="True" SortExpression="MemberId" />
                    <asp:BoundField DataField="MemberAccount" HeaderText="會員帳號" SortExpression="MemberAccount" />
                    <asp:BoundField DataField="MemberName" HeaderText="會員姓名" SortExpression="MemberName" />
                    <asp:HyperLinkField DataNavigateUrlFields="MemberId" DataNavigateUrlFormatString="wbAdvancedDetail.aspx?mid={0}" Text="申請資料">
                    <ControlStyle CssClass="btn btn-default" />
                    </asp:HyperLinkField>
                    <asp:HyperLinkField DataNavigateUrlFields="MemberId" DataNavigateUrlFormatString="wbAdvancedChecking.aspx?mid={0}" Text="審核確認">
                    <ControlStyle CssClass="btn btn-danger" />
                    </asp:HyperLinkField>
                </Columns>
                <HeaderStyle Font-Size="X-Large" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoAzureConnectionString %>" SelectCommand="SELECT [MemberAccount], [MemberName], [MemberId] FROM [Member] WHERE ([fCheck] = @fCheck)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="true" Name="fCheck" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>

</asp:Content>

