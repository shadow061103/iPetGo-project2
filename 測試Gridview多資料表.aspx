<%@ Page Language="C#" AutoEventWireup="true" CodeFile="測試Gridview多資料表.aspx.cs" Inherits="測試Gridview多資料表" MaintainScrollPositionOnPostback="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">測試JOIN多個資料表</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoConnectionString %>" SelectCommand="SELECT d.fId, m.MemberName, m.MemberEmail, d.fPetId, d.fService, d.fStartDate, d.fEndDate, d.fMessage, s.fdescription FROM Member AS m INNER JOIN tSitterDetail AS d ON m.MemberId = d.MemberId INNER JOIN tSitterserviceStatus AS s ON d.fStatus = s.fStatus WHERE (d.fSitterId = 3) AND (d.fStatus = 1)"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="fId" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="50%">
                        <Columns>
                            <asp:BoundField DataField="fId" HeaderText="fId" InsertVisible="False" ReadOnly="True" SortExpression="fId" Visible="False" />
                            <asp:CommandField HeaderText="查看訂單" ShowSelectButton="True"/>
                            <asp:BoundField DataField="MemberName" HeaderText="會員姓名" SortExpression="MemberName"/>
                            <asp:BoundField DataField="MemberEmail" HeaderText="會員Email" SortExpression="MemberEmail" />
                            <asp:BoundField DataField="fPetId" HeaderText="寵物名字" SortExpression="fPetId" />
                            <asp:BoundField DataField="fService" HeaderText="服務項目" SortExpression="fService" />
                            <asp:BoundField DataField="fStartDate" HeaderText="開始日期" SortExpression="fStartDate" />
                            <asp:BoundField DataField="fEndDate" HeaderText="結束日期" SortExpression="fEndDate" />
                            <asp:BoundField DataField="fMessage" HeaderText="給保母訊息" SortExpression="fMessage" />
                            <asp:TemplateField HeaderText="訂單狀態" SortExpression="fdescription">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="fdescription" DataValueField="fdescription" SelectedValue='<%# Bind("fdescription") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoConnectionString %>" SelectCommand="SELECT [fStatus], [fdescription] FROM [tSitterserviceStatus]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("fdescription") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <SelectedRowStyle BackColor="Aqua" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>姓名<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>email<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>寵物名字<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>服務項目<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>開始日期<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>結束日期<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>給保母訊息<asp:TextBox ID="TextBox7" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
        </table>
    <div>
    
    </div>
    </form>
</body>
</html>
