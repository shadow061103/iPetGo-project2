<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="petSisterInfo.aspx.cs" Inherits="petSisterInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="col-lg-offset-2 col-lg-8">
        <!-- Basic Form -->
        <div class="panel panel-blue margin-bottom-40">
            <div class="panel-heading">
                <h3 class="panel-title" style="font-size:x-large"><i class="fa fa-tasks"></i>寵物保姆</h3>
            </div>
            <div class="panel-body">
                <form id="form1" runat="server">
                    <div class="form-group" style="font-size:25px;">
                        城市區域
                        <select id="city" name="city" class="control-group">
                            
                            <option value="">請選擇</option>
                            <optgroup label="北部">
                                <option value="基隆市">基隆市</option>
                                <option value="台北市">台北市</option>
                                <option value="新北市">新北市</option>
                                <option value="桃園市">桃園市</option>
                            </optgroup>
                            <optgroup label="中部">
                                <option value="新竹市">新竹市</option>
                                <option value="新竹縣">新竹縣</option>
                                <option value="苗栗縣">苗栗縣</option>
                                <option value="台中市">台中市</option>
                                <option value="彰化縣">彰化縣</option>
                                <option value="南投縣">南投縣</option>
                            </optgroup>
                            <optgroup label="南部">
                                <option value="雲林縣">雲林縣</option>
                                <option value="嘉義市">嘉義市</option>
                                <option value="嘉義縣">嘉義縣</option>
                                <option value="台南市">台南市</option>
                                <option value="高雄市">高雄市</option>
                                <option value="屏東縣">屏東縣</option>
                            </optgroup>
                            <optgroup label="東部">
                                <option value="台東縣">台東縣</option>
                                <option value="花蓮縣">花蓮縣</option>
                                <option value="宜蘭縣">宜蘭縣</option>
                            </optgroup>
                            <optgroup label="離島">
                                <option value="澎湖縣">澎湖縣</option>
                                <option value="金門縣">金門縣</option>
                                <option value="連江縣">連江縣</option>
                            </optgroup>
                        </select>

                        
                    </div>
                     <asp:Button ID="btnClear" class="btn btn-info" runat="server" Text="清除" OnClick="btnClear_Click" />
                    <asp:Button ID="btnChoose" class="btn btn-info" runat="server" Text="篩選" OnClick="btnChoose_Click" />
                </form>
            </div>
            <!-- Title -->
            <div class="row">
                <div class="col-lg-12">
                    <h3>保母資料</h3>
                </div>
            </div>
            <!-- /.row -->

            <!-- Page Features -->
            <div class="row text-center">
              
                 <!--保母資料form-->
                <%--<form action="ReservationPetSister.aspx" method="post">
                <div class="col-md-6 col-sm-6 hero-feature">
                    <div class='thumbnail'>
                        <img src='../Admemberpic/Desert.jpg' >
                        <div class='caption'>
                            <h3>Agogo寵物安親班</h3>
                            <p>安親/到府/住宿  高雄市楠梓區</p>
                            <p>每晚$500</p>
                           <input type="hidden" name="id" value="3">
                            <p><input  type="submit" class='btn btn-primary' value="預約" /></p>
                        </div>

                    </div>

                </div>
                    </form>--%>
                  <!--保母資料-->
              
               <div id="webcontent" runat="server"></div>
               <%-- <label style="font-size:larger">此地區尚無保母!</label>--%>
            </div>

        </div>
    </div>
</asp:Content>

