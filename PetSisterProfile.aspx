<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PetSisterProfile.aspx.cs" Inherits="PetSisterProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
        .auto-style2 {
            font-size: large;
        }
    </style>
    <script type="text/javascript">
        function previewFile() {
            var preview = document.querySelector('#<%=icon.ClientID %>');
            var file = document.querySelector('#<%=fileUpload1.ClientID %>').files[0];
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
        function IsIntText() {
            var charkeycode = window.event.keyCode;
            if (charkeycode > 47 && charkeycode < 58) {
                return true;
            }
            return false;
        }

    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-lg-offset-2 col-lg-8">
        <!-- Basic Form -->
        <div class="panel panel-blue margin-bottom-40">
            <div class="panel-heading">
                <h3 class="panel-title" style="font-size:x-large"><i class="fa fa-tasks"></i>保母資料維護</h3>
            </div>
            <div class="panel-body">
                <form id="form1" runat="server" >
                    <div class="form-group">
                        <asp:Button class="btn btn-info" ID="btnEdit" runat="server" Text="編輯" OnClick="btnEdit_Click" />
                    </div>
                    <div class="form-group">
                        <strong><span class="auto-style2">服務名稱</span></strong>&nbsp; 
                        <asp:TextBox ID="txtServiceName" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <strong><span class="auto-style2">自我介紹</span></strong>
                        <asp:TextBox  CssClass="form-control" rows="5" cols="40" ID="Selfintro" runat="server" placeholder="向家長說明你的照顧經驗、自己的個性" Enabled="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <strong><span class="auto-style2">主要服務對象<br />
                        </span></strong>&nbsp;<asp:RadioButtonList style="display: inline" ID="rdbMainType" runat="server" RepeatDirection="Horizontal" Enabled="False" CssClass="auto-style2">
                            <asp:ListItem Selected="True">狗</asp:ListItem>
                            <asp:ListItem>貓</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="form-group">
                        <strong><span class="auto-style2">照顧年資&nbsp;</span></strong> 
                        <asp:TextBox CssClass="form-control" ID="txtSeniority" onkeypress="return IsIntText();" runat="server" Enabled="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <span class="auto-style2"><strong>接待注意事項</strong></span>
                        <asp:TextBox ID="note" CssClass="form-control" rows="5" cols="40" runat="server" placeholder="說明如何面談、服務的流程" Enabled="False"></asp:TextBox>
                    
                    
                    </div>

                    <div class="form-group">
                        <span class="auto-style2"><strong>手機&nbsp;</strong></span> 
                        <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server" Enabled="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <strong><span class="auto-style2">電話面談時間</span></strong><br />
&nbsp;<asp:RadioButtonList style="display: inline" ID="rdbtellTime1" runat="server" RepeatDirection="Horizontal" Enabled="False" CssClass="auto-style2">
                                                    <asp:ListItem Selected="True">平日</asp:ListItem>
                                                    <asp:ListItem>例假日</asp:ListItem>
                                                    <asp:ListItem>不想接到電話面談</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <br />
                                                &nbsp;<asp:RadioButtonList style="display: inline" ID="rdbtellTime2" runat="server" RepeatDirection="Horizontal" Enabled="False" CssClass="auto-style2">
                                                    <asp:ListItem Selected="True">上午</asp:ListItem>
                                                    <asp:ListItem>下午</asp:ListItem>
                                                    <asp:ListItem>晚上</asp:ListItem>
                                                </asp:RadioButtonList>
                    </div>

                    <div class="form-group">
                        <span class="auto-style2"><strong>環境描述
                            
                        </strong></span>
                            
                        <asp:TextBox ID="surround" CssClass="form-control" rows="5" cols="40" runat="server" placeholder="詳細說明你的室內空間與散步路線的特點，好讓家長了解毛小孩活動的地方" Enabled="False"></asp:TextBox>
                    
                    </div>

                    <div class="form-group">
                        <span class="auto-style2"><strong>詳細地址</strong></span>
                        <input class="zipcode" style="font-size:large" name="zipcode" value="" type="hidden" placeholder="郵遞區號" autocomplete="off" readonly />
                           <select class="county" id="county" name="county" onchange="getAddress1()" style="font-size:large">
                             
                            </select>
                            <select class="district" id="district" name="district"  onchange="getAddress2()" style="font-size:large">
                         
                            </select>
                        <br />
                        <asp:TextBox CssClass="form-control aa" ID="txtAddress" runat="server" Enabled="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <strong><span class="auto-style2">安親收費/每隻</span></strong>&nbsp; 
                        <asp:TextBox CssClass="form-control" ID="txtPay" runat="server" Enabled="False"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <span class="auto-style2"><strong>是否有特別寵物許可證<br />
                        </strong></span>&nbsp;<asp:RadioButtonList style="display: inline" ID="rdbLicense" runat="server" RepeatDirection="Horizontal" Enabled="False" CssClass="auto-style2">
                                                    <asp:ListItem Selected="True">有</asp:ListItem>
                                                    <asp:ListItem>無</asp:ListItem>
                                                </asp:RadioButtonList>
                    </div>

                    <div class="form-group">
                        <span class="auto-style2"><strong>上傳圖片</strong></span>&nbsp; 
                        <asp:FileUpload CssClass="form-control" ID="fileUpload1" runat="server" Enabled="False" onchange="previewFile()"/>
                        <asp:Image ID="icon"  runat="server" Height="225px" ImageUrl="~/Admemberpic/emoticon.png" Width="225px" />
                    </div>

                    <asp:Button class="btn btn-info" ID="btnFinish" runat="server" Text="完成" OnClick="btnFinish_Click" Visible="False" OnClientClick="return maintain();" />
                    <asp:Button class="btn btn-default" ID="btnCancel" runat="server" Text="取消" Visible="False" OnClick="btnCancel_Click" />
                </form>
            </div>
        </div>

         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="js/tw-city-selector.js"></script>

         <script type="text/javascript">
             function maintain() {
            var txtServiceName = document.getElementById('<%=txtServiceName.ClientID%>').value;
            var Selfintro = document.getElementById('<%=Selfintro.ClientID%>').value;
            var note = document.getElementById('<%=note.ClientID%>').value;
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
	</script>
        


    </div>
</asp:Content>

