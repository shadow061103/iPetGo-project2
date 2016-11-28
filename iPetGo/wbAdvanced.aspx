<%@ Page Title="" Language="C#" MasterPageFile="~/iPetGo/Master.master" AutoEventWireup="true" CodeFile="wbAdvanced.aspx.cs" Inherits="iPetGo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
        }
        .auto-style3 {
            border-collapse: collapse;
            max-width: 100%;
            margin-bottom: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1 class="auto-style2">進階會員資料</h1><hr />
    <br />
    <table style="width:100%" align="center">
    <tr>
        <td class="auto-style1" >
            <table class="nav-justified">
                <tr>
                    <td style="width:20%">
                        <asp:TextBox ID="TextBox1" runat="server" Width="90%" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="搜尋" CssClass="btn btn-default" OnClick="Button1_Click"/>
                    </td>
                </tr>
            </table>
            <p></p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoAzureConnectionString %>" SelectCommand="SELECT * FROM [avTable]">
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
<td class="text-left" >
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MemberId" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" CssClass="auto-style3 table" style="margin-right: 2px; font-size: large; font-family: 微軟正黑體;" HorizontalAlign="Left" AllowPaging="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="MemberId" HeaderText="會員編號" ReadOnly="True" SortExpression="MemberId"/>
                    <asp:BoundField DataField="MemberAccount" HeaderText="會員帳號" SortExpression="MemberAccount" />
                    <asp:BoundField DataField="MemberName" HeaderText="會員姓名" SortExpression="MemberName" />
                    <asp:HyperLinkField DataNavigateUrlFields="MemberId" DataNavigateUrlFormatString="wbAdvancedDetail.aspx?mid={0}" HeaderText="更新資料" Text="編輯" />
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
    </table>

</asp:Content>



