<%@ Page Title="" Language="C#" MasterPageFile="~/iPetGo/Master.master" AutoEventWireup="true" CodeFile="wbProductAdd.aspx.cs" Inherits="iPetGo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-family: 微軟正黑體;
        }
        .auto-style2 {
            font-size: large;
        }
        .auto-style3 {
            font-family: 微軟正黑體;
            font-size: large;
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
    <h1 class="auto-style1">商品上架<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoAzureConnectionString %>" SelectCommand="SELECT * FROM [tProductType]"></asp:SqlDataSource>
    </h1><hr />
    <table class="nav-justified" style="width:100% ;">

        <tr>
            <td>
                <table class="table" style="border:0px">
                    <tr>
                        <td class="auto-style3">產品名稱</td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server"  class="form-control" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">產品價格</td>
                        <td>
                            <asp:TextBox ID="txtPrice" runat="server"  class="form-control" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">上架日期</td>
                        <td>
                            <asp:TextBox ID="txtAdd" runat="server"  class="form-control" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">產品類型</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" class="form-control" DataTextField="product_type" DataValueField="_id" Width="80%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">產品描述</td>
                        <td>
                            <asp:TextBox ID="txtDescription" runat="server"  class="form-control" Height="100px" TextMode="MultiLine" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="auto-style2">
                        <td class="auto-style1">產品圖片</td>
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-default" onchange="previewFile()" /><p></p>
                            <asp:Image ID="Image1" runat="server" CssClass="img-thumbnail" ImageUrl="~/img/nopic.jpg" Width="400px" />
                            <br />
                        </td>
                    </tr>
            </table>
            </td>
        </tr>
    </table>
     <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="送出" CssClass="btn btn-primary" Width="6%" OnClientClick="return confirm('確定要送出資料?')" />
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="清除" CssClass="btn btn-default" Width="6%"/>
    </asp:Content>

