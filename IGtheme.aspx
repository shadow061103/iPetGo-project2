<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="IGtheme.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="css/style2.css" />
    <!-- Add jQuery alert -->
    <link href="//cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.10/alertify.core.css" rel="stylesheet" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.10/alertify.default.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">


    <%

        int MemberID = (int)Session[Dictionary.SK_memberId]; //這個要改成動態，登入的會員ID
        IGFactory ig = new IGFactory();
        List<IG> allallig = ig.showAllIG();
        List<IG> allig = allallig.FindAll(x => x.MemberId != MemberID);
        List<IG> myig = allallig.FindAll(x => x.MemberId == MemberID);
    %>

    <div class="col-lg-offset-2 col-lg-8" id="fh5co-pricing-section" style="padding:10px">
        <!-- Basic Form -->
        <div class="panel margin-bottom-40 pricing">
            <div class="panel-heading">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist" style="height: 40px">
                    <li role="presentation">
                        <i class="icon-search"></i>&nbsp&nbsp&nbsp<input type="text" placeholder="輸入好友暱稱" id="search" />
                        <style id="search_style"></style>
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    </li>
                    <li role="presentation" class="active">
                        <a href="#myOrder" aria-controls="myOrder" role="tab" data-toggle="tab">所有寵物照片</a>
                    </li>

                    <li role="presentation">
                        <a href="#ServerIng" aria-controls="ServerIng" role="tab" data-toggle="tab">我的寵物照片</a></li>
                </ul>
            </div>
            <div class="panel-body">
                

                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="myOrder">
                        <input type="hidden" value="<%=MemberID%>" id="memberid" />
                        <div class="col-md-offset-2 col-md-10 col-xs-12 pull-right margin-bottom-20 color-blue">
                        </div>


                        <% foreach (IG myItem in allig)
                            { %>

                        <div class="col-md-12 col-xs-12 animate-box searchable" data-index="<%=myItem.MamberName%>">
                            <div class="price-box" style="padding: 10px;">
                                <div class="row">

                                    <div class="text-left" style="padding: 0px; height: 25px">
                                        <h4><%= myItem.MamberName %>&nbsp <i class="icon-check-circle"></i>&nbsp<%= myItem.UserMessage %></h4>
                                    </div>
                                    <a class="fancybox" href="<%= myItem.ImagePath %>" title="<%= myItem.UserMessage %>">
                                        <img class="img-responsive" src="<%= myItem.ImagePath %>" /></a>

                                    <div class="col-lg-6 text-left" style="padding: 0px">
                                        <button class="btn-xs btn-danger" onclick="addLike(<%= myItem.IGId %>)"><i class="icon-heart"></i></button>
                                        &nbsp;&nbsp;<label id="LikeIGCount<%= myItem.IGId %>"><%= myItem.LikeIG %></label>
                                    </div>

                                    <div class="col-lg-6 text-right" style="padding: 0px">
                                        <button onclick="showMessageArea(<%= myItem.IGId %>)" class="btn-sm btn-success">
                                            <i class="icon-edit"></i>&nbsp;&nbsp;留言
                                        </button>
                                    </div>

                                    <div id="messagearea<%= myItem.IGId %>" class="col-lg-12 form-control" style="display: none">
                                        <div class="col-lg-10">
                                        <input type="text" class="btn-block" id="strmassage<%=myItem.IGId %>" />
                                        </div>
                                        <div class="col-lg-2">
                                            <button onclick="sentMessage(<%=myItem.IGId %>)" class="btn-sm btn-info">
                                            送出</button>

                                        </div>
                                    </div>

                                    <%int igCount = myItem.allmessage.Count(); %>

                                    <div id="MessageArea<%=myItem.IGId%>">
                                        <% for (int i = 0; i < igCount; i++)
                                            { %>
                                        <div class="col-lg-12 text-left" style="padding: 0px; height: 25px">
                                            <h5><mark><%=myItem.allmessage[i].MamberName%></mark><%=myItem.allmessage[i].Message%> </h5>
                                        </div>
                                        <% } %>
                                    </div>


                                </div>
                            </div>
                        </div>


                        <% } %>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="ServerIng">

                        <% foreach (IG myItem in myig)
                            { %>

                        <div class="col-md-12 col-xs-12 animate-box">
                            <div class="price-box" style="padding: 10px;">
                                <div class="row">

                                    <div class="text-left" style="padding: 0px; height: 25px">
                                        <h4><%= myItem.MamberName %>&nbsp <i class="icon-check-circle"></i>&nbsp<%= myItem.UserMessage %></h4>
                                    </div>
                                    <a class="fancybox" href="images/<%= myItem.ImagePath %>" title="<%= myItem.UserMessage %>">
                                        <img class="img-responsive" src="images/<%= myItem.ImagePath %>" /></a>

                                    <div class="col-lg-6 text-left" style="padding: 0px">
                                        <button class="btn-xs btn-danger" onclick="addLike(<%= myItem.IGId %>)"><i class="icon-heart"></i></button>
                                        &nbsp;&nbsp;<label id="LikeIGCount<%=myItem.IGId %>"><%= myItem.LikeIG %></label>
                                    </div>

                                    <div class="col-lg-6 text-right" style="padding: 0px">
                                        <button onclick="showMessageArea(<%= myItem.IGId %>)" class="btn-xs btn-success">
                                            <i class="icon-edit"></i>&nbsp;&nbsp;留言
                                        </button>
                                    </div>

                                    <div id="messagearea<%=myItem.IGId %>" class="col-lg-12 form-control" style="display: none">
                                        <input type="text" id="strmassage<%= myItem.IGId %>" />
                                        <button onclick="sentMessage(<%=myItem.IGId %>)" class="btn btn-info btn-sm">
                                            送出
                                        </button>
                                    </div>

                                    <%int igCount = myItem.allmessage.Count(); %>

                                    <div id="MessageArea<%=myItem.IGId %>">
                                        <% for (int i = 0; i < igCount; i++)
                                            { %>
                                        <div class="col-lg-12 text-left" style="padding: 0px; height: 25px">
                                            <h5><mark><%= myItem.allmessage[i].MamberName%></mark><%= myItem.allmessage[i].Message%> </h5>
                                        </div>
                                        <% } %>
                                    </div>


                                </div>
                            </div>
                        </div>

                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Add jQuery library -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

    <!-- Add mousewheel plugin (this is optional) -->
    <script src="plugs/fancebox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
    <!-- Add fancyBox -->
    <link href="plugs/fancebox/source/jquery.fancybox.css" rel="stylesheet" />
    <script src="plugs/fancebox/source/jquery.fancybox.js"></script>

    <!-- Add jQuery alert -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.10/alertify.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".fancybox").fancybox();

            var searchStyle = document.getElementById('search_style');
            document.getElementById('search').addEventListener('input', function () {
                if (!this.value) {
                    searchStyle.innerHTML = "";
                    return;
                }
                // look ma, no indexOf!
                searchStyle.innerHTML = ".searchable:not([data-index*=\"" + this.value.toLowerCase() + "\"]) { display: none; }";
                // beware of css injections!
            });
        });
    </script>


    <script>
        //function addLike(igid) {
        //    $.ajax({
        //        type: "post",
        //        url: "IGInfoUse.asmx/addLike",
        //        data: { igid: igid, likecount: $("#LikeIGCount" + igid).text() },
        //        success: function (response) {
        //            //console.log(response); //會印出xml物件，要用↓去取值
        //            $("#LikeIGCount" + igid).html($(response).find("int").text());
        //        }
        //    });
        //}

        function addLike(igid) {
            var oldCount = $("#LikeIGCount" + igid).text();
            $.ajax({
                type: "post",
                url: "IGInfoUse.asmx/addlikeIG",
                data: { igid: igid, memberid: $("#memberid").val() },
                success: function (response) {
                    //console.log(response); //會印出xml物件，要用↓去取值
                    var intLikeCount = $(response).find("int").text();
                    //console.log(intLikeCount);
                    if (oldCount > intLikeCount) {

                        $("#LikeIGCount" + igid).html(intLikeCount);
                        alertify.success('喔不！您收回讚了！');


                    } else {
                        $("#LikeIGCount" + igid).html(intLikeCount);
                        alertify.error('耶！感謝您的讚！！！');
                    }
                }
            });
        }

        function showMessageArea(igid) {
            $("#messagearea" + igid).toggle();
        }

        function sentMessage(igid) {
          <%--  console.log(igid);
            console.log($("#strmassage" + igid).val());
            console.log('<%=MemberID%>');--%>

            $.ajax({
                type: "post",  //請求方式，POST/GET
                url: "IGInfoUse.asmx/sentMessage", //指定要進行呼叫的位址
                data: { igid: igid, message: $("#strmassage" + igid).val(), memberid: $("#memberid").val() },
                success: function (response) {

                    console.log(response); //會印出xml物件，要用↓去取值
                    $("#MessageArea" + igid).html($(response).find("string").text());
					//$("#strmassage" + igid).val() = "";
                    document.querySelector("#strmassage" + igid).value = "";
                }
            });

        }

    </script>
</asp:Content>

