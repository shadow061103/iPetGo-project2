<%@ Page Title="" Language="C#" MasterPageFile="~/iPetGo/Master.master" AutoEventWireup="true" CodeFile="wbComment.aspx.cs" Inherits="iPetGo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>留言管理</h1>
    <table class="nav-justified">
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoAzureConnectionString %>" SelectCommand="SELECT * FROM [vCommentHaveAccount] WHERE ([fArticleId] = @fArticleId)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="fArticleId" QueryStringField="fid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="fArticleId,MemberId,fCommentId" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="50%">
                    <Columns>
                        <asp:TemplateField SortExpression="fContent">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fContent") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <table class="table table-striped">
                                    <tr class="auto-style1">
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("MemberAccount") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("fDate", "{0:d}") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("fContent") %>' CssClass="auto-style1"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField DataNavigateUrlFields="fCommentId" DataNavigateUrlFormatString="wbCommentDel.aspx?fid={0}" Text="刪除">
                        <ControlStyle CssClass="btn btn-danger" />
                        
                        </asp:HyperLinkField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#FFFFFF" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

