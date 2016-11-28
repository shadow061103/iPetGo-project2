<%@ Page Title="" Language="C#" MasterPageFile="~/iPetGo/Master.master" AutoEventWireup="true" CodeFile="wbAdvancedDetail.aspx.cs" Inherits="iPetGo_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            font-family: 微軟正黑體;
        }
        .auto-style3 {
            height: 39px;
        }
        .auto-style4 {
            font-size: large;
        }
        .auto-style5 {
            height: 39px;
            font-size: large;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 class="auto-style2">進階會員資料</h1><hr />
    <br />
       <table  style="width:100%">
        <tr>
            <td>
                <table class="table table-bordered">
                    <tr>
                        <td class="auto-style5" style="width:20%">會員編號</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="mId" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">會員帳號</td>
                        <td>
                            <asp:TextBox ID="mAccount" runat="server" ReadOnly="True" class="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">會員密碼</td>
                        <td>
                            <asp:TextBox runat="server" ID="mPassword" class="form-control" ReadOnly="True" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">會員姓名</td>
                        <td>
                            
                            <asp:TextBox ID="mName" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">性別</td>
                        <td>
                            <asp:TextBox ID="mSex" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">電子郵件</td>
                        <td>
                            <asp:TextBox ID="mEmail" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">權限</td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server" class="form-control" Width="50%">
                                <asp:ListItem Value="1">會員停權</asp:ListItem>
                                <asp:ListItem Value="2">保母停權</asp:ListItem>
                                <asp:ListItem Value="3">會員</asp:ListItem>
                                <asp:ListItem Value="4">保母</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">服務名稱</td>
                        <td>
                            <asp:TextBox ID="mServiceName" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">自我介紹</td>
                        <td>
                            <asp:TextBox ID="mIntro" runat="server" Height="150px" TextMode="MultiLine" Width="70%" class="form-control" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">主要服務對象</td>
                        <td>
                            <asp:TextBox ID="mMainType" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">照顧年資(/年)</td>
                        <td>
                            <asp:TextBox ID="mSeniorty" runat="server" class="form-control" Width="5%" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">注意項目</td>
                        <td>
                            <asp:TextBox ID="mNote" runat="server" Height="100px" TextMode="MultiLine" Width="70%" class="form-control" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">連絡電話</td>
                        <td>
                            <asp:TextBox ID="mPhone" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">電話面談時間</td>
                        <td>
                            <asp:TextBox ID="mTeltime" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">環境介紹</td>
                        <td>
                            <asp:TextBox ID="mSurround" runat="server" class="form-control" ReadOnly="True" Height="239px" TextMode="MultiLine" Width="470px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">縣市</td>
                        <td>
                            <asp:TextBox ID="mCountry" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">地區</td>
                        <td>
                            <asp:TextBox ID="mArea" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">地址</td>
                        <td>
                            <asp:TextBox ID="mAddress" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">收費</td>
                        <td>
                            <asp:TextBox ID="mStayPay" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="auto-style4">
                        <td>證照</td>
                        <td>
                            <asp:CheckBox ID="ck_l" runat="server" Text="證照" />
                        </td>
                    </tr>
                    <tr class="auto-style4">
                        <td>照片</td>
                        <td>
                            <asp:Image ID="Image1" runat="server" CssClass="img-thumbnail" />
                        </td>
                    </tr>
                </table>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="更新" CssClass="btn btn-primary" />
                <asp:Label ID="Label2" runat="server" Text="Label" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
    </asp:Content>



