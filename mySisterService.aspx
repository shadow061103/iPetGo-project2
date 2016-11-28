<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mySisterService.aspx.cs" Inherits="mySisterService2" MaintainScrollPositionOnPostback="true"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="icon" href="../favicon.ico" />
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
        .auto-style2 {
            font-size: large;
        }
    </style>
    <link href="css/ui-lightness/jquery-ui.css" rel="stylesheet" />
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="tabs">
            <ul>
                <!--#id選擇器點哪頁顯是哪頁 -->
                <li><a href="#p1">我的接待家庭</a></li>
                <li><a href="#p2">已完成的保母服務</a></li>
            </ul>

            <div id="p1">
                <h4><strong>我的接待家庭</strong></h4>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" Width="100%" CssClass="auto-style2">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="fId" HeaderText="fId" InsertVisible="False" ReadOnly="True" SortExpression="fId" Visible="False" />
                        <asp:BoundField DataField="fServiceName" HeaderText="保母名稱" SortExpression="fServiceName" />
                        <asp:BoundField DataField="fPhone" HeaderText="連絡電話" SortExpression="fPhone" />
                        <asp:BoundField DataField="fTeltimeWeek" HeaderText="聯絡時間" SortExpression="fTeltimeWeek" />
                        <asp:BoundField DataField="fTeltime" HeaderText="聯絡時間" SortExpression="fTeltime" />
                        <asp:BoundField DataField="fAddress" HeaderText="地址" SortExpression="fAddress" />
                        <asp:BoundField DataField="fStayPay" HeaderText="服務價格" SortExpression="fStayPay" />
                        <asp:BoundField DataField="fPetId" HeaderText="我的寵物名字" SortExpression="fPetId" />
                        <asp:BoundField DataField="fService" HeaderText="服務項目" SortExpression="fService" />
                        <asp:BoundField DataField="fStartDate" HeaderText="開始日期" SortExpression="fStartDate" DataFormatString="{0:yyyy/MM/dd}" />
                        <asp:BoundField DataField="fEndDate" HeaderText="結束日期" SortExpression="fEndDate" DataFormatString="{0:yyyy/MM/dd}" />
                        <asp:BoundField DataField="fdescription" HeaderText="目前狀態" SortExpression="fdescription" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoConnectionString %>" SelectCommand="select d.fId,a.fServiceName,a.fPhone,a.fTeltimeWeek,
a.fTeltime,a.fAddress,a.fStayPay,d.fPetId,d.fService,
d.fStartDate,d.fEndDate,s.fdescription
from AdvancedMember as a join tSitterDetail as d
on a.MemberId=d.fSitterid
join tSitterServiceStatus as s
on d.fStatus = s.fStatus
where d.MemberId=@id and d.fStatus &lt; 4
">
                    <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="SK_memberId" />
                    </SelectParameters>
                </asp:SqlDataSource>
                   </ContentTemplate></asp:UpdatePanel>
            </div>

            <div id="p2">
                <h4><strong>已完成的保母服務</strong></h4>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" Width="100%" OnRowDataBound="GridView2_RowDataBound" CssClass="auto-style2">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="fId" DataNavigateUrlFormatString="Evaluation.aspx?fId={0}" Text="給評價" ControlStyle-ForeColor="#008800"/>
                        <asp:BoundField DataField="fServiceName" HeaderText="保母名稱" SortExpression="fServiceName" />
                        <asp:BoundField DataField="fPetId" HeaderText="寵物名稱" SortExpression="fPetId" />
                        <asp:BoundField DataField="fService" HeaderText="服務項目" SortExpression="fService" />
                        <asp:BoundField DataField="fStartDate" HeaderText="開始日期" SortExpression="fStartDate" DataFormatString="{0:yyyy/MM/dd}" />
                        <asp:BoundField DataField="fEndDate" HeaderText="結束日期" SortExpression="fEndDate" DataFormatString="{0:yyyy/MM/dd}" />
                        <asp:BoundField DataField="fStayPay" HeaderText="服務收費" SortExpression="fStayPay" />
                        <asp:BoundField DataField="fEvaluation" HeaderText="評價" SortExpression="fEvaluation" />
                        <asp:BoundField DataField="fComment" HeaderText="評語" SortExpression="fComment" />
                        <asp:BoundField DataField="fdescription" HeaderText="訂單狀態" SortExpression="fdescription" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoConnectionString %>" SelectCommand="select d.fId,a.fServiceName,d.fPetId,d.fService,
d.fStartDate,d.fEndDate,a.fStayPay,d.fEvaluation,d.fComment,s.fdescription
from AdvancedMember as a join tSitterDetail as d
on a.MemberId=d.fSitterid
join tSitterServiceStatus as s
on d.fStatus = s.fStatus
where d.MemberId=@id and d.fStatus between 4 and 5

">
                    <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="SK_memberId" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        </ContentTemplate></asp:UpdatePanel>
            </div>
        </div>
    </form>
</asp:Content>

