<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Reservation.aspx.cs" Inherits="Reservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/ui-lightness/jquery-ui.css" rel="stylesheet" />
    <link href="css/ui-lightness/mystyle.css" rel="stylesheet" />
    <script src="js/jquery-3.1.0.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.ui.datepicker-zh-TW.js"></script>
     <script type="text/javascript">
        $(function () {  //網頁就緒
            //日期選擇器

            $(".datepicker").datepicker({ showOn: "both", numberOfMonths: [1, 1], changeYear: true, yearRange: "c-5:c+5" });
        });
       
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
            color: #0000CC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
  
     <div class="col-lg-offset-2 col-lg-8">
        <!-- Basic Form -->
        <div class="panel panel-blue margin-bottom-40">
            <div class="panel-heading">
                <h2 class="auto-style2"><i class="fa fa-tasks"></i>預約頁面</h2>
            </div>
            
            <div class="panel-body">
                <form  runat="server" >
                    <% PetSitterfactory factory = new PetSitterfactory();
                        int id =Convert.ToInt32(Request.Form["sitterId"]);
                        kpetSitter sitter = factory.QueryPetSitter(id);
       %>

                    <div class="form-group">
                        <h4 class="auto-style3"><strong>寵物保母</strong></h4>
                        <img style="width:100px;height:100px;" src='<%=sitter.fImage %>' />
                        <h3 class="lead" ><mark><%=sitter.fserviceName %></mark></h3>
                    </div>
                    <div class="form-group">
                        <h4><strong>寵物姓名</strong><asp:TextBox  class="form-control" ID="txtPetname" runat="server" placeholder="輸入您需要服務的寵物名字"></asp:TextBox>
                        </h4>
                        &nbsp;</div>

                    <div class="form-group">
                        <h4><strong>服務項目</strong></h4>
                        
                        <asp:RadioButtonList class="form-control" ID="rdbService" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True">安親</asp:ListItem>
                            <asp:ListItem>住宿</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                    <div class="form-group">
                        <h4><strong>寄住日期</strong></h4>
                        <asp:TextBox class="datepicker " ID="txtStartdate" runat="server"></asp:TextBox>
                        &nbsp;
                    </div>

                    <div class="form-group">
                        <h4><strong>接回日期</strong></h4>
                        <asp:TextBox class="datepicker " ID="txtEnddate" runat="server"></asp:TextBox>
                        &nbsp;
                    </div>

                    <div class="form-group">
                        <h4><strong>給保母的訊息</strong></h4>
                        <textarea id="txtNote" cols="40" class="form-control" name="txtMessage" rows="5" class="form-control" style="width: 500px"></textarea>
                    </div>

                    <div class="form-group">
                        <h4><a href="ContractPet.aspx" class="auto-style4">我已詳閱並同意 保姆的接待契約 與iPetGo的服務條款</a>
                        <asp:CheckBox ID="cbAgree" runat="server" Checked="True" /></h4>
                    </div>

                   
                    <asp:Button ID="btnClear" class="btn btn-default" runat="server" Text="取消" />
                    <asp:Button ID="btnFinish" CssClass="btn btn-info" runat="server" Text="送出並等待保母同意" OnClick="btnFinish_Click" OnClientClick="return reserve();"/>
                <!--隱藏欄位-->
                            <input type="hidden" name="sitterId" value="<%=sitter.MemberId %>"/>
                     </form>

            </div>
        </div>
    </div>

   <script type="text/javascript">
        function reserve() {
            var txtPetname = document.getElementById('<%=txtPetname.ClientID%>').value;
            var txtStartdate = document.getElementById('<%=txtStartdate.ClientID%>').value;
            var txtEnddate = document.getElementById('<%=txtEnddate.ClientID%>').value;
            var txtMessage = document.getElementById('txtNote').value;
            if (txtPetname == "") {
                alert("寵物姓名不能空白");
                return false;
            }
            if (txtStartdate == "") {
                alert("請選擇寄住日期");
                return false;
            }
            if (txtEnddate == "") {
                alert("請選擇接回日期");
                return false;
            }


            if (txtMessage == "") {
                alert("給保母訊息不能空白");
                return false;
            }

        }
   </script>


   
</asp:Content>

