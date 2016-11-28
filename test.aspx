<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="fId" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="MemberId" HeaderText="MemberId" SortExpression="MemberId" />
                            <asp:BoundField DataField="fserviceName" HeaderText="fserviceName" SortExpression="fserviceName" />
                            <asp:BoundField DataField="fIntro" HeaderText="fIntro" SortExpression="fIntro" />
                            <asp:BoundField DataField="fMainType" HeaderText="fMainType" SortExpression="fMainType" />
                            <asp:BoundField DataField="fSeniority" HeaderText="fSeniority" SortExpression="fSeniority" />
                            <asp:BoundField DataField="fNote" HeaderText="fNote" SortExpression="fNote" />
                            <asp:BoundField DataField="fPhone" HeaderText="fPhone" SortExpression="fPhone" />
                            <asp:BoundField DataField="fTeltime" HeaderText="fTeltime" SortExpression="fTeltime" />
                            <asp:BoundField DataField="fSurround" HeaderText="fSurround" SortExpression="fSurround" />
                            <asp:BoundField DataField="fCountry" HeaderText="fCountry" SortExpression="fCountry" />
                            <asp:BoundField DataField="fArea" HeaderText="fArea" SortExpression="fArea" />
                            <asp:BoundField DataField="fAddress" HeaderText="fAddress" SortExpression="fAddress" />
                            <asp:BoundField DataField="fStayPay" HeaderText="fStayPay" SortExpression="fStayPay" />
                            <asp:CheckBoxField DataField="fLicenseHave" HeaderText="fLicenseHave" SortExpression="fLicenseHave" />
                            <asp:BoundField DataField="fImage" HeaderText="fImage" SortExpression="fImage" />
                            <asp:BoundField DataField="fId" HeaderText="fId" InsertVisible="False" ReadOnly="True" SortExpression="fId" />
                            <asp:BoundField DataField="SitterId" HeaderText="SitterId" SortExpression="SitterId" />
                            <asp:BoundField DataField="MemberId1" HeaderText="MemberId1" SortExpression="MemberId1" />
                            <asp:BoundField DataField="fPetId" HeaderText="fPetId" SortExpression="fPetId" />
                            <asp:BoundField DataField="fService" HeaderText="fService" SortExpression="fService" />
                            <asp:BoundField DataField="fStartDate" HeaderText="fStartDate" SortExpression="fStartDate" />
                            <asp:BoundField DataField="fEndDate" HeaderText="fEndDate" SortExpression="fEndDate" />
                            <asp:BoundField DataField="fMessage" HeaderText="fMessage" SortExpression="fMessage" />
                            <asp:BoundField DataField="fEvaluation" HeaderText="fEvaluation" SortExpression="fEvaluation" />
                            <asp:BoundField DataField="fComment" HeaderText="fComment" SortExpression="fComment" />
                            <asp:BoundField DataField="fStatus" HeaderText="fStatus" SortExpression="fStatus" />
                            <asp:CheckBoxField DataField="fAgree" HeaderText="fAgree" SortExpression="fAgree" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoConnectionString2 %>" SelectCommand="select *
  from AdvancedMember as a join fSitterDetail as d
  on a.MemberId=d.SitterId"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    <div>
    
    </div>
    </form>
</body>
</html>
