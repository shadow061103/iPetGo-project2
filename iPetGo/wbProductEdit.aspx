<%@ Page Title="" Language="C#" MasterPageFile="~/iPetGo/Master.master" AutoEventWireup="true" CodeFile="wbProductEdit.aspx.cs" Inherits="iPetGo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        
    <style type="text/css">
        .auto-style1 {
            font-size: 20px;
            font-family: 微軟正黑體;
        }
        .auto-style2 {
            font-size: large;
            color: #FF0000;
            font-family: 微軟正黑體;
        }
    </style>
        
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function previewFile() {
            var preview = document.querySelector('#<%=Image1.ClientID %>');
            var file = document.querySelector('#<%=FileUpload1.ClientID %>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }
    </script>
    <h1 style="font-family: 微軟正黑體">產品編輯</h1><hr />
    <table class="nav-justified">
        <tr>
            <td>
                <table class="table" style="border-color:#FFFFFF">
                    <tr>
                        <td class="auto-style1">產品名稱</td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" class="form-control" Text='<%# Bind("product_name") %>' Width="70%" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">產品價格</td>
                        <td>
                            <asp:TextBox ID="txtPrice" runat="server" class="form-control" Text='<%# Bind("product_price") %>' Width="70%" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">上架日期</td>
                        <td>
                            <asp:TextBox ID="txtAddDate" runat="server" class="form-control" Text='<%# Bind("product_added_date") %>' Width="70%" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">產品種類</td>
                        <td>
                            <asp:TextBox ID="txtType" runat="server" class="form-control" Text='<%# Bind("product_type") %>' Width="70%" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">產品敘述</td>
                        <td>
                            <asp:TextBox ID="txtDescription" runat="server" class="form-control" Text='<%# Bind("product_description") %>' TextMode="MultiLine" Width="70%" />
                        </td>
                    </tr>
                    <tr class="auto-style1">
                        <td>產品圖片</td>
                        <td>
                            <asp:Image ID="Image1" runat="server" CssClass="img-thumbnail" Height="400px" Width="400px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" onchange="previewFile()" CssClass ="btn btn-default"/>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="Button1" runat="server" Text="送出" OnClick="Button1_Click" CssClass="btn-primary btn" />&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="取消" OnClick="Button2_Click" CssClass="btn-default btn" />
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False" CssClass="auto-style2"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

