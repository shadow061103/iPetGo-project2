<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" %>

<%@ Register Src="~/DefenseWebControl.ascx" TagPrefix="uc1" TagName="DefenseWebControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style3 {
            height: 20px;
        }
        .auto-style5 {
            font-size: x-large;
            
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<body>
    <uc1:DefenseWebControl runat="server" ID="DefenseWebControl" />
    <form id="form1" runat="server">
    <div>
    



        <table class="nav-justified">
            <tr>
                <td>
                    <table class="nav-justified">

                        <tr>
                            <td class="img-width-200">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IPETGODATABASEConnectionString %>" SelectCommand="SELECT * FROM [tArticle] a inner join [Member] m on a.MemberId = m.MemberId order by [fArticleId] desc">
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button1" class="btn btn-info" runat="server" Text="我要發文" OnClick="Button1_Click" />
                              

                        
                                


                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="auto-style5">
                                    <asp:ListItem>全部</asp:ListItem>
                                    <asp:ListItem>寵物美容</asp:ListItem>
                                    <asp:ListItem>寵物活動</asp:ListItem>
                                    <asp:ListItem>寵物餐廳</asp:ListItem>
                                    <asp:ListItem>寵物醫療</asp:ListItem>
                                    <asp:ListItem>認養資訊</asp:ListItem>
                                    <asp:ListItem>其他</asp:ListItem>
                                </asp:DropDownList>
                              

                        
                                


                            </td>
                        </tr>
                        <tr>
                            <td class="img-width-200">
                                <table class="nav-justified">
                                    <tr>
                                        <td class="text-center">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style3"></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style3"></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">&nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <div class="panel-heading">
                                <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False" DataKeyNames="fArticleId" CellPadding="4" Width="80%" CssClass="auto-style5" ForeColor="#333333" GridLines="None" AllowPaging="True" EnableSortingAndPagingCallbacks="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="14">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="MemberAccount" HeaderText="發佈者" SortExpression="fAccount" >
                                        <HeaderStyle Width="13%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fDate" HeaderText="發佈日期" SortExpression="fDate" DataFormatString="{0:yyyy-MM-dd}" >
                                        <HeaderStyle Width="15%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fType" HeaderText="類型" SortExpression="fType" >
                                        <HeaderStyle Width="15%" />
                                        </asp:BoundField>
                                        <asp:HyperLinkField DataNavigateUrlFields="fArticleId" DataNavigateUrlFormatString="NewsContent.aspx?fArticleId={0}" DataTextField="fTitle" HeaderText="標題" ControlStyle-ForeColor="#0000CC" >
<ControlStyle ForeColor="#0000CC"></ControlStyle>
                                        </asp:HyperLinkField>
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                                    </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="img-width-200">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="img-width-200">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="img-width-200">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="img-width-200">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="img-width-200">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="img-width-200">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="img-width-200">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="img-width-200">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="img-width-200">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="img-width-200">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            </table>
    



    </div>
    </form>
</body>
</html>
      <!-- jQuery -->
    <script src="js/jquery.min.js"></script>

</asp:Content>





