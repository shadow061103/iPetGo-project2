<%@ Page Title="" Language="C#" MasterPageFile="~/iPetGo/Master.master" AutoEventWireup="true" CodeFile="wbOrderDetail.aspx.cs" Inherits="iPetGo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style13 {
            height: 20px;
        }
        .auto-style15 {
            font-family: 微軟正黑體;
        }
        .auto-style16 {
            font-family: 微軟正黑體;
            font-size:20px
        }
        .auto-style17 {
            width: 204px;
        }
        .auto-style18 {
            height: 28px;
        }
        .auto-style19 {
            width: 204px;
            height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="auto-style15">訂購明細管理</h1><span class="auto-style16"><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoAzureConnectionString %>" SelectCommand="SELECT * FROM [vOrderDetailHaveName] WHERE ([fOrderId] = @fOrderId)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="fOrderId" QueryStringField="oid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoAzureConnectionString %>" SelectCommand="SELECT [fMessage] FROM [tPaid] WHERE ([fOrderId] = @fOrderId)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="fOrderId" QueryStringField="oid" Type="Int32" />
                </SelectParameters>
    </asp:SqlDataSource>
            </span><hr />
    <table class="nav-justified">
        <tr>
            <td class="auto-style16">
                　　　<table class="nav-justified">
                    <tr>
                        <td class="auto-style18">
                <span class="auto-style16"><strong>訂單編號：</strong><asp:Label ID="lbl編號" runat="server" Text="Label"></asp:Label>
                            </span></td>
                        <td class="auto-style18"><span class="auto-style16"><strong>訂購人：</strong><asp:Label ID="lbl訂購人" runat="server" Text="Label"></asp:Label>
                            </span></td>
                        <td class="auto-style19"><span class="auto-style16">[<a href="wbOrderMain.aspx">回訂單管理</a>]</span>&nbsp;</td>
                        <td class="auto-style18"></td>
                    </tr>
                    <tr>
                        <td><strong>收件人</strong><span class="auto-style16">：</span><asp:Label ID="lbl收件人" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td><strong>電話：</strong><asp:Label ID="lbl連絡電話" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="auto-style17"><strong>付款方式：</strong><asp:Label ID="lbl付款方式" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><strong>地址：</strong><asp:Label ID="lbl地址" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td colspan="2"><span class="auto-style16"><strong>訂購日期：</strong><asp:Label ID="lbl訂購日期" runat="server" Text="Label"></asp:Label>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td><span class="auto-style16"><strong>總計：$</strong><asp:Label ID="lbl總計" runat="server" Text="Label"></asp:Label>
                </span>
                        </td>
                        <td>
                            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2">
                                <EditItemTemplate>
                                    fMessage:
                                    <asp:TextBox ID="fMessageTextBox" runat="server" Text='<%# Bind("fMessage") %>' />
                                    <br />
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    fMessage:
                                    <asp:TextBox ID="fMessageTextBox" runat="server" Text='<%# Bind("fMessage") %>' />
                                    <br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <strong>匯款確認：</strong>&nbsp;<asp:Label ID="fMessageLabel" runat="server" Text='<%# Bind("fMessage") %>' />
                                    <br />

                                </ItemTemplate>
                            </asp:FormView>
                        </td>
                        <td class="auto-style17">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BorderColor="White" Width="100%" CssClass="auto-style14 table table-striped" BackColor="White" style="font-size: large" AllowPaging="True" Font-Names="微軟正黑體">
                    <Columns>
                        <asp:BoundField DataField="product_name" HeaderText="產品名稱" SortExpression="product_name" />
                        <asp:BoundField DataField="fQty" HeaderText="數量" SortExpression="fQty" >
                        <HeaderStyle Width="10%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fSubtotal" HeaderText="小計" SortExpression="fSubtotal" DataFormatString="{0:N0}" />
                    </Columns>
                    <FooterStyle Font-Names="微軟正黑體" />
                    <HeaderStyle BackColor="#CCCCCC" Font-Size="20px" BorderColor="#CCCCCC" BorderStyle="None" />
                    <RowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

