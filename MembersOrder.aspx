<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MembersOrder.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- styles -->
    <link href="../css/font-awesome.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/animate.min.css" rel="stylesheet" />
    <link href="../css/owl.carousel.css" rel="stylesheet" />
    <link href="../css/owl.theme.css" rel="stylesheet" />
    <!-- theme stylesheet -->
    <link href="../css/style.default.css" rel="stylesheet" id="theme-stylesheet" />

    <!-- your stylesheet with modifications -->
    <link href="../css/custom.css" rel="stylesheet" />

    <!-- Bootstrap  -->
    <link rel="stylesheet" href="../css/bootstrap.css" />
    <!-- Flexslider  -->
    <link rel="stylesheet" href="../css/flexslider.css" />
    <!-- Owl Carousel  -->
    <link rel="stylesheet" href="../css/owl.carousel.min.css" />
    <link rel="stylesheet" href="../css/owl.theme.default.min.css" />
    <!-- Theme style  -->
    <link rel="stylesheet" href="../css/style.css" />

    <script src="../js/respond.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <%@ Import Namespace="System.Data" %>
                        <%kMember member = Session[Dictionary.SK_memberInfo] as kMember;
                            DataView dv = (new Orders()).m客戶訂單(member.MemberId.ToString());
                        %>
                        <li><span style="font-size: 20px"><strong><%=member.MemberName %></strong></span> ,你好</li>
                    </ul>
                </div>
                <div id="all">
                    <p class="lead"></p>
                    <div id="content">
                        <div class="container">



                            <div class="col-md-9" id="basket" style="width: 100%">

                                <div class="box">

                                    <form method="post" action="checkout1.aspx">

                                        <h1>購物清單</h1>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>訂單編號</th>
                                                        <th>日期</th>
                                                        <th>明細</th>
                                                        <th>確認付款</th>
                                                        <th>目前狀態</th>
                                                        <th colspan="1">總計</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <%for (int i = 0; i < dv.Count; i++)
                                                        {
                                                            DateTime Date = Convert.ToDateTime(dv.Table.Rows[i]["fOrderDate"].ToString());
                                                            string strDate = Date.ToString("yyyyMMdd");
                                                            Session["OrderID"] = dv.Table.Rows[i]["fOrderId"].ToString() + strDate;
                                                            float Total = Convert.ToSingle(dv.Table.Rows[i]["fTotal"].ToString());
                                                            if (dv.Table.Rows[i]["fStatus"].ToString() != "取消訂單")
                                                            {
                                                    %>
                                                    <tr>
                                                        <td>
                                                            <a><%=dv.Table.Rows[i]["fOrderId"].ToString()+strDate %></a>
                                                        </td>
                                                        <td><%=Date.ToString("yyyy-MM-dd") %>
                                                        </td>
                                                        <td>
                                                            <li role="presentation" class="dropdown">
                                                                <a id="drop5" href="#" data-toggle="dropdown" aria-haspopup="true" role="button" aria-expanded="false">購物明細
                                <span class="caret"></span>
                                                                </a>
                                                                <ul class="dropdown-menu" role="menu" aria-labelledby="drop5">
                                                                    <%DataView dvDetail = (new Orders()).m客戶訂單明細(dv.Table.Rows[i]["fOrderId"].ToString());
                                                                        for (int j = 0; j < dvDetail.Count; j++)
                                                                        {
                                                                            float SubTotal = Convert.ToSingle(dvDetail.Table.Rows[j]["fSubtotal"].ToString());
                                                                    %>
                                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><%=dvDetail.Table.Rows[j]["product_name"].ToString() %>　x<%=dvDetail.Table.Rows[j]["fQty"].ToString() %>　$<%=String.Format("{0:N0}",SubTotal) %></a></li>
                                                                    <% }%>
                                                                </ul>
                                                            </li>
                                                        </td>
                                                        <%if (dv.Table.Rows[i]["fStatus"].ToString() == "已付款")
                                                            { %>
                                                        <td><%=dv.Table.Rows[i]["fPaymentMT"].ToString()  %></td>
                                                        <td><%=dv.Table.Rows[i]["fStatus"].ToString()  %></td>
                                                        <td>$<%=String.Format("{0:N0}",Total) %></td>
                                                        <td></td>
                                                        <%}
                                                            else
                                                            { %>
                                                        <td><a href="MembersOrderPay.aspx?o_id=<%=dv.Table.Rows[i]["fOrderId"].ToString() %>"><%=dv.Table.Rows[i]["fPaymentMT"].ToString()  %></a></td>

                                                        <td><%=dv.Table.Rows[i]["fStatus"].ToString()  %></td>
                                                        <td>$<%=String.Format("{0:N0}",Total) %></td>
                                                        <td><a href="MembersOrderCO.aspx?o_id=<%=dv.Table.Rows[i]["fOrderId"].ToString() %>" onclick="return confirm('確定要取消訂單嗎?');"><i class="fa fa-trash-o"></i>取消訂單</a></td>
                                                        <%} %>
                                                    </tr>
                                                    <%} %>
                                                    <%} %>
                                                </tbody>


                                            </table>

                                        </div>
                                        <!-- /.table-responsive -->

                                        <div class="box-footer">
                                            <div class="pull-left">
                                                <a href="Petshopmall.aspx" class="btn btn-default"><i class="fa fa-chevron-left"></i>繼續購物</a>
                                            </div>

                                        </div>

                                    </form>

                                </div>



                            </div>


                        </div>
                        <!-- /.col-md-3 -->

                    </div>
                    <!-- /.container -->
                </div>


            </div>
            <!-- /.container -->
        </div>
    </div>

    <script src="js/jquery.min.js"></script>

</asp:Content>

