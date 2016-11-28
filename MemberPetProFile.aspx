<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MemberPetProFile.aspx.cs" Inherits="MemberPetProFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/ui-lightness/jquery-ui.css" rel="stylesheet" />
    <link href="css/ui-lightness/mystyle.css" rel="stylesheet" />
     <script type="text/javascript">
        function previewFile() {
            var preview = document.querySelector('#<%=Avatar.ClientID %>');
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
             var txtPetName = document.getElementById('<%=txtPetName.ClientID%>').value;
             var datepicker = document.getElementById('<%=datepicker.ClientID%>').value;
             var txtExperience = document.getElementById('<%=txtExperience.ClientID%>').value;
             var txtNote = document.getElementById('<%=txtNote.ClientID%>').value;
             var txtWFnumber = document.getElementById('<%=txtWFnumber.ClientID%>').value;
            
          
             if (txtPetName == "") {
                alert("名字不能空白");
              
                return false;
            }
             if (datepicker == "") {
                alert("生日不能空白");

                return false;
            }
             if (txtExperience == "") {
                alert("個性不能空白");

                return false;
            }
             if (txtNote == "") {
                alert("接待提醒不能空白");

                return false;
            }
             if (txtWFnumber == "") {
                alert("晶片號碼不能空白");

                return false;
            }
        }


    </script>
  
    <style type="text/css">
        .auto-style2 {
            margin-top: 0;
            margin-bottom: 0;
            font-size: x-large;
            color: inherit;
        }
        .auto-style3 {
            font-size: large;
        }
        .auto-style4 {
            font-size: medium;
        }
    </style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="col-lg-offset-2 col-lg-8">
        <!-- Basic Form -->
        <div class="panel panel-blue margin-bottom-40">
            <div class="panel-heading">
                <h2 class="auto-style2" style="font-size:x-large"><i class="fa fa-tasks"></i>編輯寵物</h2>
            </div>
            
            
            <div class="panel-body">
                <form id="form1" runat="server">
                
                     <!--隱藏欄位-->
                          <%--  <input type="hidden" name="sitterId" value="<%=a%>"/>--%>
                    <div class="form-group">
                        <span class="auto-style3"><strong>寵物暱稱</strong></span>&nbsp; 
                        <asp:TextBox class="form-control" ID="txtPetName" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <span class="auto-style3"><strong>寵物種類</strong></span>                           
                                    			<asp:RadioButtonList class="form-control" ID="rdbPetType" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True">狗</asp:ListItem>
                                                    <asp:ListItem>貓</asp:ListItem>
                                                    <asp:ListItem>其他</asp:ListItem>
                                                </asp:RadioButtonList>
                    </div>

                    <div class="form-group">
                        <span class="auto-style3"><strong>寵物性別</strong></span>                          
                                    	<asp:RadioButtonList class="form-control" ID="rdbPetsex" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True">公</asp:ListItem>
                                            <asp:ListItem>母</asp:ListItem>
                                        </asp:RadioButtonList>
                    </div>

                   <div class="form-group">
                        <strong><span class="auto-style3">寵物生日</span></strong>                   
                                                <asp:TextBox class="datepicker"  ID="datepicker" runat="server"></asp:TextBox>
                                            &nbsp;</div>

                    <div class="form-group">
                        <strong><span class="auto-style3">體型</span></strong>  
                            <br>
                        <asp:RadioButtonList ID="rdbBodyType" runat="server" CssClass="auto-style4">
                            <asp:ListItem Selected="True">小型 9 kg (含)以下</asp:ListItem>
                            <asp:ListItem>中型 10 ~ 19 kg</asp:ListItem>
                            <asp:ListItem>大型 20 ~ 29 kg</asp:ListItem>
                            <asp:ListItem>超大型 30 kg (含)以上</asp:ListItem>
                        </asp:RadioButtonList>
                        <br />
                    </div>

                    <div class="form-group">
                        <strong><span class="auto-style3">個性與經歷：</span></strong>
                                   
                        <asp:TextBox ID="txtExperience" runat="server" cols="40" rows="10" class="form-control" style="width: 500px" placeholder="跟大家介紹他/她是怎樣的毛孩吧" TextMode="MultiLine"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <strong><span class="auto-style3">接待提醒：</span></strong>
                                               
                        <asp:TextBox ID="txtNote" runat="server" cols="40"  rows="10" class="form-control" style="width: 500px" placeholder="毛小孩的過往病史，特殊習慣，讓保母在接待時更了解牠" TextMode="MultiLine"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <span class="auto-style3"><strong>結育狀態</strong></span>                          
                                                <asp:RadioButtonList class="form-control" ID="rdbBirthcontrol" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Selected="True">已結紮</asp:ListItem>
                                                    <asp:ListItem>未結紮</asp:ListItem>
                                                </asp:RadioButtonList>
                    </div>

                    <div class="form-group">
                        <strong><span class="auto-style3">晶片號碼</span></strong>
                            
                                                <asp:TextBox class="form-control" ID="txtWFnumber" runat="server"></asp:TextBox>

                    </div>

                    <div class="form-group">
                        <strong><span class="auto-style3">上傳圖片
                            
                        </span></strong>
                            
                        <asp:FileUpload ID="fileUpload1" runat="server" align="center" class="btn btn-primary form-control" onchange="previewFile()"/>
                        <asp:Image ID="Avatar" runat="server" Height="225px" ImageUrl="~/Petpic/icon.png" Width="225px" />


                    </div>

                    <asp:Button ID="btnFinish" runat="server" Text="完成" class="btn btn-info" OnClick="btnFinish_Click" OnClientClick="return register();"/>
                    &nbsp;<asp:Button ID="btnCancel" runat="server" Text="取消" class="btn btn-default" OnClick="btnCancel_Click" />
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

