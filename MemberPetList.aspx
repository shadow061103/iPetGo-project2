<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MemberPetList.aspx.cs" Inherits="MemberPetList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/jquery.min.js"></script>
    <style type="text/css">
        .auto-style2 {
            margin-top: 0;
            margin-bottom: 0;
            font-size: x-large;
            color: inherit;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-lg-offset-1 col-lg-10"><%--col-lg-offset-2--%>
        <!-- Basic Form -->
        <div class="panel panel-blue margin-bottom-40">
            <div class="panel-heading">
                <h3 class="auto-style2"><i class="fa fa-tasks"></i>我的毛小孩</h3>
            </div>
            <div class="panel-body">
                <form id="form1" runat="server">
                    <div class="form-group" style="font-size:25px">
                        
                        <a href="RegisterMemberPet.aspx" class="control-group" >新增毛小孩</a>

                        
                    </div>
                     
                </form>
            </div>
           

            <!-- Page Features -->
            <div class="row text-center">
              
                 <!--保母資料form-->
               <%-- <form action="MemberPetProFile.aspx" method="post">
                <div class="col-md-4 col-sm-4 hero-feature">
                    <div class='thumbnail'>
                        <img src='../Petpic/dog1.png' height='210'/>
                        <div class='caption'>
                            <h3>小黃</h3>
                            <p>5歲</p>
                            <p>大型 20 ~ 29 kg</p>
                            <p>個性與經歷</p>
                           <input type="hidden" name="id" value="3"/>
                            <p> <input  type="submit" name="action" class='btn btn-success active' value="編輯" />
                                <input  type="submit" name="action" class='btn btn-success' value="刪除" onclick="return confirm('你確定刪除嗎?')"/>

                            </p>
                        </div>

                    </div>

                </div>
                    </form>--%>
                  <!--保母資料-->
               
                <%-- <form action="MemberPetProFile.aspx" method="post"><div class="col-md-4 col-sm-4 hero-feature"><div class='thumbnail'><img src='../Petpic/dog1.png' /><div class='caption'><h3>小黃</h3><p>5歲</p><p>大型 20 ~ 29 kg</p><p>個性與經歷</p><input type="hidden" name="id" value="3"/><p> <input  type="submit" class='btn btn-success active' value="編輯" /><input  type="submit" class='btn btn-success' value="刪除" /></p></div></div></div></form>--%>
              
              
               <div id="webcontent" runat="server"></div>
               <%-- <label style="font-size:larger">此地區尚無保母!</label>--%>
            </div>

        </div>
    </div>
</asp:Content>

