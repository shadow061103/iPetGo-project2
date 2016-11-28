<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewsPostings.aspx.cs" Inherits="NewsPostings" %>

<%@ Register Src="~/DefenseWebControl.ascx" TagPrefix="uc1" TagName="DefenseWebControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style3 {
            height: 20px;
        }
        .auto-style6 {
            height: 20px;
            font-size: large;
        }
        .auto-style7 {
            font-size: large;
            height: 28px;
        }
        .auto-style9 {
            font-family: 微軟正黑體;
            font-size: large;
        }
        .auto-style10 {
            font-family: 新細明體;
            font-size: x-large;
        }
        .auto-style11 {
            font-size: large;
        }
        .auto-style12 {
            font-family: 新細明體;
            font-size: large;
        }
        .auto-style2 {
                margin-top: 0;
                margin-bottom: 0;
                font-size: x-large;
                color: inherit;
            }
            .auto-style13 {
            text-align: left;
            margin-left: 40px;
        }
            .auto-style14 {
            font-family: 新細明體;
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
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IPETGODATABASEConnectionString %>" DeleteCommand="DELETE FROM [tArticle] WHERE [fArticleId] = @fArticleId" InsertCommand="INSERT INTO [tArticle] ([fDate], [fTitle], [fContent], [MemberId], [fType]) VALUES (@fDate, @fTitle, @fContent, @MemberId, @fType)" SelectCommand="SELECT * FROM [tArticle]" UpdateCommand="UPDATE [tArticle] SET [fDate] = @fDate, [fTitle] = @fTitle, [fContent] = @fContent, [MemberId] = @MemberId, [fType] = @fType WHERE [fArticleId] = @fArticleId">
                        <DeleteParameters>
                            <asp:Parameter Name="fArticleId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="fDate" DbType="Date" />
                            <asp:Parameter Name="fTitle" Type="String" />
                            <asp:Parameter Name="fContent" Type="String" />
                            <asp:Parameter Name="MemberId" Type="Int32" />
                            <asp:Parameter Name="fType" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="fDate" DbType="Date" />
                            <asp:Parameter Name="fTitle" Type="String" />
                            <asp:Parameter Name="fContent" Type="String" />
                            <asp:Parameter Name="MemberId" Type="Int32" />
                            <asp:Parameter Name="fType" Type="String" />
                            <asp:Parameter Name="fArticleId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="col-lg-offset-2 col-lg-8">
                    <div class="panel panel-blue margin-bottom-40">
            <div class="panel-heading">
                <h3 class="auto-style2"><i class="fa fa-tasks"></i>我要發文</h3>
            </div>
                        <div>
                        <div class="auto-style13">
                            <table class="nav-justified">
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="fId" DataSourceID="SqlDataSource1" DefaultMode="Insert" OnItemInserting="FormView1_ItemInserting" Width="80%" OnItemInserted="FormView1_ItemInserted">
                        <EditItemTemplate>
                            fId:
                            <asp:Label ID="fIdLabel1" class="form-control"  runat="server" Text='<%# Eval("fId") %>' />
                            <br />
                            fAccount:
                            <asp:TextBox ID="fAccountTextBox" class="form-control"  runat="server" Text='<%# Bind("fAccount") %>' />
                            <br />
                            fDate:
                            <asp:TextBox ID="fDateTextBox" class="form-control"  runat="server" Text='<%# Bind("fDate") %>' />
                            <br />
                            fType:
                            <asp:TextBox ID="fTypeTextBox" class="form-control"  runat="server" Text='<%# Bind("fType") %>' />
                            <br />
                            fSubject:
                            <asp:TextBox ID="fSubjectTextBox" class="form-control"  runat="server" Text='<%# Bind("fSubject") %>' />
                            <br />
                            fContent:
                            <asp:TextBox ID="fContentTextBox" class="form-control"  runat="server" Text='<%# Bind("fContent") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <table class="nav-justified">
                                <tr>
                                    <td class="auto-style7"><span class="auto-style14"><strong>類型:</strong>
                                        </span>
                                        <span class="auto-style10">
                                        <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" CssClass="auto-style12" SelectedValue='<%# Bind("fType") %>' Width="150px">
                                            <asp:ListItem>寵物美容</asp:ListItem>
                                            <asp:ListItem>寵物活動</asp:ListItem>
                                            <asp:ListItem>寵物餐廳</asp:ListItem>
                                            <asp:ListItem>寵物醫療</asp:ListItem>
                                            <asp:ListItem>認養資訊</asp:ListItem>
                                            <asp:ListItem>其他</asp:ListItem>
                                        </asp:DropDownList>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style6"><span class="auto-style14"><strong>標題:</strong></span><asp:TextBox ID="fSubjectTextBox" runat="server" class="form-control" CssClass="auto-style9" Text='<%# Bind("fTitle") %>' Width="120%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style12"><strong>內容:</strong></td>
                                </tr>
                                <tr>
                                    <td class="text-left">
                                        
                                        <asp:TextBox ID="TextBox1" class="form-control" runat="server" Height="500" Text='<%# Bind("fContent") %>' Width="120%" TextMode="MultiLine" CssClass="auto-style11"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:LinkButton ID="InsertButton" class="btn btn-info" runat="server" CausesValidation="True" CommandName="Insert" Text="發佈" OnClick="InsertButton_Click"  />
                                        <asp:LinkButton ID="InsertCancelButton" class="btn btn-info" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" OnClick="InsertCancelButton_Click" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            &nbsp;
                        </InsertItemTemplate>
                        <ItemTemplate>
                            fId:
                            <asp:Label ID="fIdLabel" runat="server" Text='<%# Eval("fId") %>' />
                            <br />
                            fAccount:
                            <asp:Label ID="fAccountLabel" runat="server" Text='<%# Bind("fAccount") %>' />
                            <br />
                            fDate:
                            <asp:Label ID="fDateLabel" runat="server" Text='<%# Bind("fDate") %>' />
                            <br />
                            fType:
                            <asp:Label ID="fTypeLabel" runat="server" Text='<%# Bind("fType") %>' />
                            <br />
                            fSubject:
                            <asp:Label ID="fSubjectLabel" runat="server" Text='<%# Bind("fSubject") %>' />
                            <br />
                            fContent:
                            <asp:Label ID="fContentLabel" runat="server" Text='<%# Bind("fContent") %>' />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新增" />
                        </ItemTemplate>
                    </asp:FormView>
                        </div>
                        </div>
                        </div>
                        </div>
                </td>
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
                <td>&nbsp;</td>
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
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
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



