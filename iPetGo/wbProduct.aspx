<%@ Page Title="" Language="C#" MasterPageFile="~/iPetGo/Master.master" AutoEventWireup="true" CodeFile="wbProduct.aspx.cs" Inherits="iPetGo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-family: 微軟正黑體;
        }
        .auto-style2 {
            font-family: 微軟正黑體;
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="auto-style1">產品資料</h1><hr />
    <table class="nav-justified">
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoAzureConnectionString %>" SelectCommand="SELECT * FROM [vProduct]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoAzureConnectionString %>" SelectCommand="SELECT * FROM [tProductType]"></asp:SqlDataSource>
                <table class="nav-justified" style="width:50%">
                    <tr>
                        <td>
                        <asp:TextBox ID="TextBox3" runat="server" Width="90%" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>
                        <asp:Button ID="Button2" runat="server" Text="搜尋" CssClass="btn btn-default" OnClick="Button1_Click"/>　
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="product_type" DataValueField="_id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <p></p>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="product_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" HorizontalAlign="Center" class="table" AllowPaging="True" CssClass="auto-style2">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="product_id" HeaderText="編號" InsertVisible="False" ReadOnly="True" SortExpression="product_id" HeaderStyle-Width="4%">
<HeaderStyle Width="6%"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="product_name" HeaderText="商品名稱" SortExpression="product_name" HeaderStyle-Width="20%">
<HeaderStyle Width="20%"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="product_price" HeaderText="價格" SortExpression="product_price" ApplyFormatInEditMode="True" HeaderStyle-Width="7%"  >
<HeaderStyle Width="7%"></HeaderStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="上架日期" SortExpression="product_added_date" >
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("product_added_date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("product_added_date", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="product_type" HeaderText="類型" SortExpression="product_type"  HeaderStyle-Width="15%" >
<HeaderStyle Width="10%"></HeaderStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="商品描述" SortExpression="product_description">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Height="100px" Text='<%# Bind("product_description") %>' TextMode="MultiLine" Width="300px" ReadOnly="true" class="form-control"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="商品圖片" SortExpression="product_pic">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("product_pic") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("product_pic") %>' Width="100px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField  DataNavigateUrlFields="product_id" DataNavigateUrlFormatString="wbProductEdit.aspx?pid={0}" HeaderText="編輯" Text="編輯" HeaderStyle-Width="7%" >
                        <ControlStyle CssClass="btn btn-primary" />
<HeaderStyle Width="7%"></HeaderStyle>
                        </asp:HyperLinkField>
                        <asp:HyperLinkField DataNavigateUrlFields="product_id" DataNavigateUrlFormatString="wbProductDelete.aspx?p_id={0}" Text="下架">
                        <ControlStyle CssClass="btn btn-danger" />
                        </asp:HyperLinkField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" Font-Bold="True" Font-Italic="False" Font-Names="微軟正黑體" Font-Strikeout="False" Font-Underline="True" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td><span class="auto-style1"></td>
        </tr>
        <tr>
            <td></span></td>
        </tr>
    </table>
</asp:Content>

