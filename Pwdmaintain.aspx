<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Pwdmaintain.aspx.cs" Inherits="Pwdmaintain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/ui-lightness/jquery-ui.css" rel="stylesheet" />
    <link href="css/ui-lightness/mystyle.css" rel="stylesheet" />
     <script type="text/javascript">

          function register() {
              var txtOldpwd = document.getElementById('<%=txtOldpwd.ClientID%>').value;
              var txtNewpwd = document.getElementById('<%=txtNewpwd.ClientID%>').value;
            
            //console.log(form.txtname.value)
              if (txtOldpwd == "") {
                alert("舊密碼不能空白");
                console.log("A")
                return false;
            }
              if (txtNewpwd == "") {
                alert("新密碼不能空白");
                console.log("A")
                return false;
            }
        }
     </script>
    <style type="text/css">
        .auto-style2 {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="col-lg-offset-2 col-lg-8">
        <!-- Basic Form -->
        <div class="panel panel-blue margin-bottom-40">
            <div class="panel-heading">
                <h3 class="panel-title" style="font-size:large"><i class="fa fa-tasks"></i>修改密碼</h3>
            </div>
            
            
            <div class="panel-body">
                <form id="form1" runat="server">
                
                    
                    <div class="form-group">
                        <strong><span class="auto-style2">請輸入舊密碼</span></strong>&nbsp; 
                        <asp:TextBox class="form-control " ID="txtOldpwd" runat="server" TextMode="Password" name="old_pass"></asp:TextBox>
                        
                    </div>
                     <div class="form-group">
                         <strong><span class="auto-style2">請輸入新密碼</span></strong>&nbsp; 
                        
                         <asp:TextBox class="form-control " ID="txtNewpwd" runat="server" TextMode="Password"  name="new_pass"></asp:TextBox>
                    </div>

                     <asp:Button ID="btnFinish" runat="server" Text="送出修改" class="btn btn-info" OnClick="btnFinish_Click" OnClientClick="return register();"/>
                    &nbsp;<asp:Button ID="btnCancel" runat="server" Text="取消回上一頁" class="btn btn-default" OnClick="btnCancel_Click" />
                </form>
            </div>
        </div>


    </div>
    <script src="js/jquery-3.1.0.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.ui.datepicker-zh-TW.js"></script>


    <script type="text/javascript">
        $(function () {  //網頁就緒
            //日期選擇器

            $(".datepicker").datepicker({ showOn: "both", numberOfMonths: [1, 1], changeYear: true, yearRange: "c-5:c+5" });
        });
    </script>
</asp:Content>


