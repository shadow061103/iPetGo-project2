<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="myService.aspx.cs" Inherits="myService2" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="head" runat="Server">
    <link rel="icon" href="../favicon.ico" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/ui-lightness/jquery-ui.css" rel="stylesheet" />

    <style>
        .pullquote {
            float: right;
            clear: right;
            width: 200px;
            border: 1px solid black;
            padding: 10px;
            font-size: 20px;
            background-color: rgb(195,151,51);
            margin: 20px 0 10px 10px;
            font-style: italic;
            color: rgb(255,255,255);
        }
        .auto-style3 {
            font-size: large;
            color: #FF0000;
        }
        .auto-style4 {
            font-size: x-large;
            color: #FF0000;
        }
        .auto-style5 {
            font-size: large;
        }
        .auto-style6 {
            color: #FF0000;
            font-size: small;
        }
    </style>
    <link href="css/ui-lightness/jquery-ui.css" rel="stylesheet" />
    <link href="css/ui-lightness/mystyle.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <script type="text/javascript">
        function init() {
            $("#tabs").tabs();//將網頁改造成「多標籤頁」模式顯現

            f1();//存取特定節點之屬性
            f2(); //巡覽jQuery集合物件內的每一元素
            f3(); //綜合應用實作:自動引述
        }

    </script>
</asp:Content>
<asp:Content onload="init()" ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    
     <div class="container">
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div id="tabs">
                <ul>
                    <!--#id選擇器點哪頁顯是哪頁 -->
                    <li><a href="#p1">我的服務預約</a></li>
                    <li><a href="#p2">進行中的服務</a></li>
                    <li><a href="#p3">完成的服務</a></li>
                </ul>
                <div class="row" id="p1">
                    <div ><!--class="col-lg-6"-->
                        <h4 class="auto-style5">我的服務預約<span class="auto-style6" style="color:coral">(請在下方選擇欲同意訂單)</span></h4>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:GridView CssClass="table table-bordered table-hover" ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%" AutoGenerateColumns="False" AllowPaging="True" OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound" style="font-size: large">
                            <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:CommandField HeaderText="選擇" SelectText="選擇" ShowSelectButton="True" />
                                        <asp:BoundField DataField="fId" HeaderText="fId" InsertVisible="False" ReadOnly="True" SortExpression="fId" />
                                        <asp:BoundField DataField="MemberName" HeaderText="委託人姓名" SortExpression="MemberName" />
                                        <asp:BoundField DataField="MemberEmail" HeaderText="委託人Email" SortExpression="MemberEmail" />
                                        <asp:BoundField DataField="fPetId" HeaderText="寵物名字" SortExpression="fPetId" />
                                        <asp:BoundField DataField="fService" HeaderText="服務項目" SortExpression="fService" />
                                        <asp:BoundField DataField="fStartDate" HeaderText="開始日期" SortExpression="fStartDate" DataFormatString="{0:yyyy/MM/dd}" />
                                        <asp:BoundField DataField="fEndDate" HeaderText="結束日期" SortExpression="fEndDate" DataFormatString="{0:yyyy/MM/dd}" />
                                        <asp:BoundField DataField="fMessage" HeaderText="給保母訊息" SortExpression="fMessage" />
                                        <asp:BoundField DataField="fdescription" HeaderText="訂單狀態" SortExpression="fdescription" />
                                    </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                                    <EmptyDataTemplate>
                                        <span class="auto-style3">目前無訂單資料!</span>
                                    </EmptyDataTemplate>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#99FF66" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>

                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoConnectionString %>" SelectCommand="SELECT d.fId, m.MemberName, m.MemberEmail, d.fPetId, d.fService, d.fStartDate, d.fEndDate, d.fMessage, s.fdescription FROM Member AS m INNER JOIN tSitterDetail AS d ON m.MemberId = d.MemberId INNER JOIN tSitterServiceStatus AS s ON d.fStatus = s.fStatus WHERE (d.fSitterid = @sitterid) and d.fStatus = 1">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="sitterid" SessionField="SK_memberId" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </ContentTemplate></asp:UpdatePanel>
                        

                    </div>
                    <div class="col-lg-6">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                        <div class="form-group">
                            <asp:Label ID="lblId" runat="server" Text="Label" Visible="False"></asp:Label>
                            <h4><strong>會員姓名</strong>
                            </h4>
                            <asp:TextBox class="form-control" ID="txtName" runat="server"></asp:TextBox>
                            &nbsp;</div>
                        <div class="form-group">
                            <h4><strong>Email</strong></h4>
                            <asp:TextBox class="form-control" ID="txtEmail" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <h4><strong>寵物名稱</strong></h4>
                            <asp:TextBox class="form-control" ID="txtPetname" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <h4><strong>服務項目</strong></h4>
                            <asp:TextBox class="form-control" ID="txtService" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <h4><strong>開始日期</strong></h4>
                            <asp:TextBox class="datepicker " ID="txtStartdate" runat="server"></asp:TextBox>
                            &nbsp;
                        </div>
                        <div class="form-group">
                            <h4><strong>結束日期</strong></h4>
                            <asp:TextBox class="datepicker " ID="txtEnddate" runat="server"></asp:TextBox>
                            &nbsp;
                        </div>
                        <div class="form-group">
                            <h4><strong>訊息</strong></h4>
                            <asp:TextBox ID="txtMessage" cols="20" class="form-control" tyle="width: 500px" runat="server" TextMode="MultiLine" Width="500px"></asp:TextBox>
                        </div>
                        <asp:Button class="btn btn-info" ID="btnAgree" runat="server" Text="同意" OnClick="btnAgree_Click" />
                        <asp:Button class="btn btn-default" ID="btnNo" runat="server" Text="拒絕" OnClick="btnNo_Click" />
                       </ContentTemplate></asp:UpdatePanel>
                    </div>
                </div>


                <div class="row" id="p2">
                    <div ><!--class="col-lg-6"-->
                        <h4>進行中的服務</h4><mark style="color:coral">(請在下方選取欲更新狀態的訂單)</mark>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                        <asp:GridView CssClass="table table-bordered table-hover" ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" OnRowCreated="GridView1_RowCreated" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="100%" PageSize="7" OnRowDataBound="GridView2_RowDataBound">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField HeaderText="選擇" SelectText="選擇" ShowSelectButton="True" />
                                <asp:BoundField DataField="fId" HeaderText="fId" InsertVisible="False" ReadOnly="True" SortExpression="fId" />
                                <asp:BoundField DataField="MemberName" HeaderText="委託人姓名" SortExpression="MemberName" />
                                <asp:BoundField DataField="MemberEmail" HeaderText="委託人Email" SortExpression="MemberEmail" />
                                <asp:BoundField DataField="fPetId" HeaderText="寵物名字" SortExpression="fPetId" />
                                <asp:BoundField DataField="fService" HeaderText="服務項目" SortExpression="fService" />
                                <asp:BoundField DataField="fStartDate" HeaderText="開始日期" SortExpression="fStartDate" DataFormatString="{0:yyyy/MM/dd}" />
                                <asp:BoundField DataField="fEndDate" HeaderText="結束日期" SortExpression="fEndDate" DataFormatString="{0:yyyy/MM/dd}" />
                                <asp:BoundField DataField="fMessage" HeaderText="給保母訊息" SortExpression="fMessage" />
                                <asp:BoundField DataField="fdescription" HeaderText="訂單狀態" SortExpression="fdescription" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <EmptyDataTemplate>
                                <span class="auto-style4">目前尚無資料!</span>
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoConnectionString %>" SelectCommand="SELECT d.fId, m.MemberName, m.MemberEmail, d.fPetId, d.fService, d.fStartDate, d.fEndDate, d.fMessage, s.fdescription FROM Member AS m INNER JOIN tSitterDetail AS d ON m.MemberId = d.MemberId INNER JOIN tSitterServiceStatus AS s ON d.fStatus = s.fStatus WHERE (d.fSitterid = @id) AND (d.fStatus BETWEEN 2 AND 3)">
                            <SelectParameters>
                                <asp:SessionParameter Name="id" SessionField="SK_memberId" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                                </ContentTemplate></asp:UpdatePanel>
                    </div>
                    <div class="col-lg-6">
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                        <div class="form-group">
                            
                            <asp:TextBox class="form-control" ID="txtfId" runat="server" Visible="False"></asp:TextBox>
                           
                        </div>
                        <div class="form-group">
                            <h4>更改目前狀態</h4>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="fdescription" DataValueField="fdescription"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoConnectionString %>" SelectCommand="SELECT [fdescription] FROM [tSitterServiceStatus] WHERE (([fStatus] &gt; @fStatus) AND ([fStatus] &lt; @fStatus2))">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="fStatus" Type="Int32" />
                                    <asp:Parameter DefaultValue="5" Name="fStatus2" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <asp:Button ID="btnRefresh" class="btn btn-default" runat="server" Text="更改" OnClick="btnRefresh_Click" />
                         <asp:Button ID="btnCancel" class="btn btn-default" runat="server" Text="取消" />
                        </ContentTemplate></asp:UpdatePanel>
                    </div>
                </div>
                <div class="row" id="p3">
                    <div class="col-lg-12">
                        <h4>完成的服務</h4>
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>

                        <asp:GridView CssClass="table table-bordered table-hover" ID="GridView3" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" PageSize="7" Width="100%" OnRowDataBound="GridView3_RowDataBound">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="fId" HeaderText="fId" InsertVisible="False" ReadOnly="True" SortExpression="fId" Visible="False" />
                                <asp:BoundField DataField="MemberName" HeaderText="委託人姓名" SortExpression="MemberName" />
                                <asp:BoundField DataField="MemberEmail" HeaderText="委託人Email" SortExpression="MemberEmail" />
                                <asp:BoundField DataField="fPetId" HeaderText="托故的寵物姓名" SortExpression="fPetId" />
                                <asp:BoundField DataField="fService" HeaderText="服務項目" SortExpression="fService" />
                                <asp:BoundField DataField="fStartDate" HeaderText="開始日期" SortExpression="fStartDate" DataFormatString="{0:yyyy/MM/dd}" />
                                <asp:BoundField DataField="fEndDate" HeaderText="結束日期" SortExpression="fEndDate" DataFormatString="{0:yyyy/MM/dd}" />
                                <asp:BoundField DataField="fEvaluation" HeaderText="評價" SortExpression="fEvaluation" />
                                <asp:BoundField DataField="fComment" HeaderText="評語" SortExpression="fComment" />
                                <asp:BoundField DataField="fdescription" HeaderText="訂單狀態" SortExpression="fdescription" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <EmptyDataTemplate>
                                <span class="auto-style4">目前尚無資料!</span>
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoConnectionString %>" SelectCommand="select d.fId,m.MemberName,m.MemberEmail,d.fPetId,d.fService,d.fStartDate,d.fEndDate,
d.fEvaluation,d.fComment,s.fdescription
from Member as m join tSitterDetail as d 
on m.MemberId = d.MemberId
join tSitterServiceStatus as s
on d.fStatus = s.fStatus
where d.fSitterid=@id and d.fStatus between 4 and 5
">
                            <SelectParameters>
                                <asp:SessionParameter Name="id" SessionField="SK_memberId" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                                </ContentTemplate></asp:UpdatePanel>

                    </div>
                    </div>
                </div>
        </form>
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

