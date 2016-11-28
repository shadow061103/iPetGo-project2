<%@ Page Title="" Language="C#" MasterPageFile="~/iPetGo/Master.master" AutoEventWireup="true" CodeFile="wbArticle.aspx.cs" Inherits="iPetGo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 10%;
        }
        .auto-style2 {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoAzureConnectionString %>" SelectCommand="SELECT tArticle.fDate, tArticle.fTitle, Member.MemberAccount, tArticle.fContent, tArticle.fType, tArticle.fArticleId FROM tArticle INNER JOIN Member ON tArticle.MemberId = Member.MemberId">
        </asp:SqlDataSource>
        <h1>文章管理</h1><hr />
        <table >
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  DataKeyNames="fArticleId" DataSourceID="SqlDataSource1" Width="100%" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="4" GridLines="Horizontal" AllowPaging="True" PageSize="5">
                        <Columns>
                            <asp:TemplateField ConvertEmptyStringToNull="False" SortExpression="fContent">
                                <EditItemTemplate>
                                    <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="fContent" Mode="Edit" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <table class="table" style="font-family:微軟正黑體">
                                        <tr class="info">
                                            <td style="width:20%">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("fDate", "{0:d}") %>'></asp:Label>
                                            </td>
                                            <td style="width:60% ;" ><strong>
                                                
                                                <span class="auto-style2" >
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("fTitle") %>'></asp:Label>
                                                </span>
                                                </strong><span class="auto-style2"></span></td>
                                            <td style="width:10%">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("MemberAccount") %>'></asp:Label>
                                                </span>
                                            </td>
                                            <td style="width:10%">
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("fType") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("fContent") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:HyperLinkField DataNavigateUrlFields="fArticleId" DataNavigateUrlFormatString="wbComment.aspx?fid={0}" Text="留言" ><HeaderStyle Width="7%"/>
<ControlStyle CssClass="btn btn-primary"></ControlStyle>
                                
                            </asp:HyperLinkField>
                            <asp:HyperLinkField DataNavigateUrlFields="fArticleId" DataNavigateUrlFormatString="wbArticle.aspx?fid={0}" Text="刪除">
                            <ControlStyle CssClass="btn btn-danger" />
                            </asp:HyperLinkField>
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#FFFFFF" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="Black" HorizontalAlign="Center" Font-Size="X-Large" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    </p>
</asp:Content>

