<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewsContent.aspx.cs" Inherits="NewsContent" %>

<%@ Register Src="~/DefenseWebControl.ascx" TagPrefix="uc1" TagName="DefenseWebControl" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style3 {
            height: 23px;
            text-align: right;
        }
        .auto-style4 {
            font-family: 微軟正黑體;
        }
        .auto-style5 {
            font-size: x-large;
            color: #0000CC;
        }
        .auto-style7 {
            width: 200px;
            height: 127px;
        }
        .auto-style8 {
            height: 127px;
        }
        .auto-style9 {
            font-size: large;
        }
        .auto-style10 {
            font-size: medium;
        }
        .auto-style11 {
            font-family: 微軟正黑體;
            font-size: medium;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <uc1:DefenseWebControl runat="server" ID="DefenseWebControl" />
   <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="nav-justified">
            <tr>
                <td class="img-width-200">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IPETGODATABASEConnectionString %>" SelectCommand="SELECT * FROM [tArticle] a inner join [Member] m on a.MemberId = m.MemberId  WHERE ([fArticleId] = @fArticleId)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="fArticleId" QueryStringField="fArticleId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:IPETGODATABASEConnectionString %>" SelectCommand="SELECT  * FROM [tComment] c inner join [Member] m on c.MemberId = m.MemberId  WHERE ([fArticleId] = @fArticleId)" DeleteCommand="DELETE FROM [tComment] WHERE [fArticleId] = @fArticleId AND [MemberId] = @MemberId AND [fCommentId] = @fCommentId" InsertCommand="INSERT INTO [tComment] ([fArticleId], [MemberId], [fDate], [fContent]) VALUES (@fArticleId, @MemberId, @fDate, @fContent)" UpdateCommand="UPDATE [tComment] SET [fDate] = @fDate, [fContent] = @fContent WHERE [fArticleId] = @fArticleId AND [MemberId] = @MemberId AND [fCommentId] = @fCommentId">
                        <DeleteParameters>
                            <asp:Parameter Name="fArticleId" Type="Int32" />
                            <asp:Parameter Name="MemberId" Type="Int32" />
                            <asp:Parameter Name="fCommentId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="fArticleId" Type="Int32" />
                            <asp:Parameter Name="MemberId" Type="Int32" />
                            <asp:Parameter DbType="Date" Name="fDate" />
                            <asp:Parameter Name="fContent" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="fArticleId" QueryStringField="fArticleId" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter DbType="Date" Name="fDate" />
                            <asp:Parameter Name="fContent" Type="String" />
                            <asp:Parameter Name="fArticleId" Type="Int32" />
                            <asp:Parameter Name="MemberId" Type="Int32" />
                            <asp:Parameter Name="fCommentId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:Button ID="Button1" class="btn btn-info" runat="server" OnClick="Button1_Click" Text="回上頁" />
                </td>
            </tr>
            <tr>
                <td class="img-width-200">&nbsp;</td>
                <td>
                    <asp:GridView ID="GridView1" class="table" runat="server" AutoGenerateColumns="False" DataKeyNames="fArticleId" DataSourceID="SqlDataSource1" Width="80%" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            
                            <asp:TemplateField HeaderText="文章內容" SortExpression="fContent">
                                
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fContent") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <table class="nav-justified">
                                        <tr class="auto-style4">
                                            <td rowspan="2"><strong>
                                                <asp:Label ID="Label1" runat="server" CssClass="auto-style5" Text='<%# Bind("fTitle") %>'></asp:Label>
                                                </strong></td>
                                            <td class="auto-style3">
                                                <strong>
                                                <asp:Label ID="Label2" runat="server" CssClass="auto-style10" Text='<%# Bind("MemberAccount") %>'></asp:Label>
                                                </strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-right">
                                                <strong>
                                                <asp:Label ID="Label3" runat="server" CssClass="auto-style11" Text='<%# Bind("fDate", "{0:yyyy-MM-dd}")  %>'></asp:Label>
                                                </strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:TextBox ID="TextBox2" runat="server" BorderStyle="None" CssClass="auto-style9" Height="350px" ReadOnly="True" Text='<%# Bind("fContent") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <HeaderStyle Font-Size="X-Large" />
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style7"></td>
                <td class="auto-style8">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="fArticleId" DataSourceID="SqlDataSource2" Width="80%" CellPadding="4" GridLines="None" ForeColor="#333333" CssClass="auto-style9">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="fDate" HeaderText="留言日期" SortExpression="fDate" DataFormatString="{0:yyyy-MM-dd}">
                            <HeaderStyle Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MemberAccount" HeaderText="留言人" SortExpression="fAccount" >
                            <HeaderStyle Width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fContent" HeaderText="留言內容" SortExpression="fMessage" />
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
                </td>
            </tr>
            <tr>
                <td class="img-width-200">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="img-width-200">&nbsp;</td>
                <td>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="fId" DataSourceID="SqlDataSource2" DefaultMode="Insert" Width="80%" OnItemInserting="FormView1_ItemInserting">
                        <EditItemTemplate>
                            fId:
                            <asp:Label ID="fIdLabel1" runat="server" Text='<%# Eval("fId") %>' />
                            <br />
                            fDate:
                            <asp:TextBox ID="fDateTextBox" runat="server" Text='<%# Bind("fDate") %>' />
                            <br />
                            fAccount:
                            <asp:TextBox ID="fAccountTextBox" runat="server" Text='<%# Bind("fAccount") %>' />
                            <br />
                            fMessage:
                            <asp:TextBox ID="fMessageTextBox" runat="server" Text='<%# Bind("fMessage") %>' />
                            <br />
                            fNewsId:
                            <asp:TextBox ID="fNewsIdTextBox" runat="server" Text='<%# Bind("fNewsId") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <table class="nav-justified">
                                <tr>
                                    <td class="auto-style9">我要留言</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="fMessageTextBox" runat="server" Text='<%# Bind("fContent") %>' Width="80%" CssClass="auto-style9" />
                                    </td>
                                </tr>
                            </table>
                            <asp:LinkButton ID="InsertButton" class="btn btn-info" runat="server" CausesValidation="True" CommandName="Insert" Text="留言" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" class="btn btn-info" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            fId:
                            <asp:Label ID="fIdLabel" runat="server" Text='<%# Eval("fId") %>' />
                            <br />
                            fDate:
                            <asp:Label ID="fDateLabel" runat="server" Text='<%# Bind("fDate") %>' />
                            <br />
                            fAccount:
                            <asp:Label ID="fAccountLabel" runat="server" Text='<%# Bind("fAccount") %>' />
                            <br />
                            fMessage:
                            <asp:Label ID="fMessageLabel" runat="server" Text='<%# Bind("fMessage") %>' />
                            <br />
                            fNewsId:
                            <asp:Label ID="fNewsIdLabel" runat="server" Text='<%# Bind("fNewsId") %>' />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
                        </ItemTemplate>
                    </asp:FormView>
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
        </table>
    
    </div>
    </form>
</body>
</html>
     <!-- jQuery -->
   
    <script src="js/jquery.min.js"></script>


</asp:Content>









