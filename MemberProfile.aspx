<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemberProfile.aspx.cs" Inherits="changePassword" MasterPageFile="~/MasterPage.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/jquery.min.js"></script>
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
        function register() {
            var name = document.getElementById('<%=txtname.ClientID%>').value;
            var email = document.getElementById('<%=txtmail.ClientID%>').value;
            
            //console.log(form.txtname.value)
            if (name == "") {
                alert("名字不能空白");
                console.log("A")
                return false;
            }
            if (email.search(/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/) == -1) {

            alert("Email 資料錯誤？請重新輸入！");
               
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
                <h3 class="panel-title" style="font-size:x-large"><i class="fa fa-tasks"></i>會員資料維護</h3>
            </div>
            <div class="panel-body">
                <form id="form1" runat="server">
                    <div class="form-group">
                       <asp:Button class="btn btn-info" ID="btnEdit" runat="server" Text="編輯" OnClick="btnEdit_Click1" />
                    
                    </div>
                    <div class="form-group">
                        <span class="auto-style2"><strong>會員名稱&nbsp;</strong></span> 
                       <asp:TextBox  CssClass="form-control" ID="txtname" runat="server" Enabled="False"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <span class="auto-style2"><strong>Email</strong></span>
                       <asp:TextBox  CssClass="form-control" ID="txtmail" runat="server" Enabled="False"></asp:TextBox>
                    </div>
                     <div class="form-group">
                         <span class="auto-style2"><strong>性別</strong></span>
                     <asp:TextBox  CssClass="form-control" ID="txtsex" runat="server" Enabled="False"></asp:TextBox>
                    </div>
                   <div class="form-group">
                        <strong><span class="auto-style2">修改密碼
                   </span></strong>
                   <a href="Pwdmaintain.aspx"><strong><span class="auto-style2">點我修改密碼</span></strong></a>
                    </div>

                      <div class="form-group">
                          <strong><span class="auto-style2">上傳圖片</span></strong>&nbsp; 
                        <asp:FileUpload CssClass="form-control" ID="fileUpload1" runat="server" Enabled="False" onchange="previewFile()"/>
                        <asp:Image ID="icon"  runat="server" Height="225px"  ImageUrl="~/Memberpic/emoticon.png" Width="225px" />
                    </div>

                   <asp:Button class="btn btn-info" ID="btnFinish" runat="server" Text="完成" Visible="False" OnClick="btnFinish_Click"  OnClientClick="return register();"/>
                   <asp:Button class="btn btn-default" ID="btnCancel" runat="server" Text="取消" Visible="False" OnClick="btnCancel_Click" />

                </form>
            </div>
        </div>

     </div>
</asp:Content>

