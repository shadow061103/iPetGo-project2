<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkOut.aspx.cs" Inherits="checkOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/tw-city-selector.js"></script>
    <link href="css/app.css" rel="stylesheet" />
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
 function maintain() {
       var txtName = document.getElementById('<%=txtName.ClientID%>').value;
            var txtAddress = document.getElementById('<%=txtAddress.ClientID%>').value;
            var txtPhone = document.getElementById('<%=txtPhone.ClientID%>').value;
           if (txtName == "") {
                alert("收貨人不能空白");
                return false;
            }
            
            if (txtAddress == "") {
                alert("地址不能空白");
                return false;
            } 
            if (txtPhone == "") {
                alert("電話不能空白");
                return false;
            }
        }
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-lg-offset-2 col-lg-8">
        <!-- Basic Form -->
        <div class="panel panel-blue margin-bottom-40">
            <div class="panel-heading">
                <h3 class="panel-title" style="font-size:30px;"><i class="fa fa-tasks"></i>結帳</h3>
            </div>
            <div class="panel-body">
                <form id="form1" class="margin-bottom-40" role="form" runat="server">
                    <div class="form-group">
                        <h3>收貨人姓名</h3>   
                       
                        <asp:TextBox ID="txtName" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <h3>地址</h3>  
                       <input class="zipcode" name="zipcode" value="" type="hidden" placeholder="郵遞區號" autocomplete="off" readonly />
                            <select class="county" style="font-size:20px;" id="county" name="county" onchange="getAddress1()">
                               <%--<option  selected="selected" disabled="disabled">選擇縣市</option>--%>
                            </select>
                            <select class="district" style="font-size:20px;" id="district" name="district"  onchange="getAddress2()">
                               <%-- <option  selected="selected" disabled="disabled">選擇區域</option>--%>
                            </select>
                        <br />
                        <asp:TextBox ID="txtAddress" class="form-control aa" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                       <h3> 手機   </h3>

                      
                        <asp:TextBox ID="txtPhone" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group" >
                       
                        
                        <asp:RadioButtonList  CssClass="form-control" ID="rdbPaytype" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True">轉帳匯款</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    
                    <asp:Button ID="btnCheck" class="btn-u btn-u-blue" runat="server" Text="繼續訂購確認" OnClick="btnCheck_Click" OnClientClick="return maintain();"/>
                </form>
            </div>
        </div>
    </div>
   <%-- <script src="js/jquery.min.js"></script>--%>
</asp:Content>

