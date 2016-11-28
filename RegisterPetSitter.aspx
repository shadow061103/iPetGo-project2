<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegisterPetSitter.aspx.cs" Inherits="RegisterPetSitter2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="js/tw-city-selector.js"></script>
     <script type="text/javascript">
             function maintain() {
            var txtServiceName = document.getElementById('<%=txtServiceName.ClientID%>').value;
            var Selfintro = document.getElementById('Selfintro').value;
            var note = document.getElementById('note').value;
            var txtPhone = document.getElementById('<%=txtPhone.ClientID%>').value;
            var txtAddress = document.getElementById('<%=txtAddress.ClientID%>').value;
            var txtPay =document.getElementById('<%=txtPay.ClientID%>').value;
            if (txtServiceName == "") {
                alert("服務名稱不能空白");
                return false;
            }
            if (Selfintro == "") {
                alert("自我介紹不能空白");
                return false;
            }
            if (note == "") {
                alert("接待注意事項不能空白");
                return false;
            }
           

            if (txtPhone == "") {
                alert("手機不能空白");
                return false;
            }
            
            if (txtAddress == "") {
                alert("地址不能空白");
                return false;
            } 
            if (txtPay == "") {
                alert("收費不能空白");
                return false;
            }
             }
                
    </script>
            <script>
            $(function () {
                $('#form1').dk_tw_citySelector('.county', '.district', '.zipcode');
            });
            function getAddress1() {
                var road1 = $('#county').val();
                var road2 = $('#district').val();
                

                $('.aa').val(road1);
            }
            function getAddress2() {
                var road1 = $('#county').val();
                var road2 = $('#district').val();
                

                $('.aa').val(road1 + road2);
            }
            function IsIntText() {
                var charkeycode = window.event.keyCode;
                if (charkeycode > 47 && charkeycode < 58) {
                    return true;
                }
                return false;
            }
           

            
	</script>
        <style type="text/css">
            .auto-style2 {
                margin-top: 0;
                margin-bottom: 0;
                font-size: x-large;
                color: inherit;
            }
            .auto-style4 {
                font-size: large;
            }
       
        .auto-style1 {
            text-align: right;
            width: 314px;
        }
  
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-lg-offset-2 col-lg-8">
        <!-- Basic Form -->
        <div class="panel panel-blue margin-bottom-40">
            <div class="panel-heading">
                <h3 class="auto-style2"><i class="fa fa-tasks"></i>歡迎加入保母行列</h3>
            </div>
            <div class="panel-body">
                <form id="form1" runat="server">

                    <div class="form-group">
                        <span class="auto-style4"><strong>服務名稱&nbsp;</strong></span> 
                        <asp:TextBox ID="txtServiceName" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <strong><span class="auto-style4">自我介紹</span> </strong>
                            <textarea class="form-control" rows="5" cols="40" placeholder="向家長說明你的照顧經驗、自己的個性" id="Selfintro" name="Selfintro"></textarea>
                    </div>

                    <div class="form-group">
                        <span class="auto-style4"><strong>主要服務對象<br />
                        </strong></span>&nbsp;<asp:RadioButtonList style="display: inline" ID="rdbMainType" runat="server" RepeatDirection="Horizontal" CssClass="auto-style4">
                            <asp:ListItem Selected="True">狗</asp:ListItem>
                            <asp:ListItem>貓</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="form-group">
                        <span class="auto-style4"><strong>照顧年資&nbsp;</strong></span> 
                        <asp:TextBox class="form-control" ID="txtSeniority" onkeypress="return IsIntText();" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <span class="auto-style4"><strong>接待注意事項</strong></span>
                            <textarea name="note" id="note" class="form-control" rows="5" cols="40" placeholder="說明如何面談、服務的流程"></textarea>
                    </div>

                    <div class="form-group">
                        <span class="auto-style4"><strong>手機&nbsp;</strong></span> 
                        <asp:TextBox class="form-control" ID="txtPhone" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <span class="auto-style4"><strong>電話面談時間</strong></span><br />
&nbsp;<asp:RadioButtonList style="display: inline" ID="rdbtellTime1" runat="server" RepeatDirection="Horizontal" CssClass="auto-style4">
                                                    <asp:ListItem Selected="True">平日</asp:ListItem>
                                                    <asp:ListItem>例假日</asp:ListItem>
                                                    <asp:ListItem>不想接到電話面談</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <br />
                                                &nbsp;<asp:RadioButtonList style="display: inline" ID="rdbtellTime2" runat="server" RepeatDirection="Horizontal" CssClass="auto-style4">
                                                    <asp:ListItem Selected="True">上午</asp:ListItem>
                                                    <asp:ListItem>下午</asp:ListItem>
                                                    <asp:ListItem>晚上</asp:ListItem>
                                                </asp:RadioButtonList>
                    </div>

                    <div class="form-group">
                        <span class="auto-style4"><strong>環境描述</strong></span>
                            <textarea class="form-control" rows="5" placeholder="詳細說明你的室內空間與散步路線的特點，好讓家長了解毛小孩活動的地方" id="surround" name="surround"></textarea>
                    </div>

                    <div class="form-group" style="font-size:large">
                        <span class="auto-style4"><strong>詳細地址</strong></span>
                        <input class="zipcode" name="zipcode" value="" type="hidden" placeholder="郵遞區號" autocomplete="off" readonly />
                            <select class="county" id="county" name="county" onchange="getAddress1()">
                               <%--<option  selected="selected" disabled="disabled">選擇縣市</option>--%>
                            </select>
                            <select class="district" id="district" name="district"  onchange="getAddress2()">
                               <%-- <option  selected="selected" disabled="disabled">選擇區域</option>--%>
                            </select>
                        <br />
                        <asp:TextBox class="form-control aa" ID="txtAddress" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <span class="auto-style4"><strong>安親收費/每隻</strong></span>&nbsp; 
                        <asp:TextBox class="form-control" ID="txtPay" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <span class="auto-style4"><strong>是否有特別寵物許可證<br />
&nbsp;</strong></span><asp:RadioButtonList style="display: inline" ID="rdbLicense" runat="server" RepeatDirection="Horizontal" CssClass="auto-style4">
                                                    <asp:ListItem Selected="True">有</asp:ListItem>
                                                    <asp:ListItem>無</asp:ListItem>
                                                </asp:RadioButtonList>
                    </div>

                    <div class="form-group">
                        <strong><span class="auto-style4">上傳圖片&nbsp;</span></strong> 
                        <asp:FileUpload class="form-control" ID="fileUpload1" runat="server" />
                      

                    </div>

                    <asp:Button class="btn btn-info" ID="btnFinish" runat="server" Text="完成" OnClick="btnFinish_Click"  OnClientClick="return maintain();"/>
                    <asp:Button class="btn btn-info" ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click" />
                </form>
            </div>
        </div>

    </div>
</asp:Content>


