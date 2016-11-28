<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PetSearchInfo.aspx.cs" Inherits="RegisterMember" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script src="js/jquery.min.js"></script> 
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB46QSsw2v7pTy2QneqXvMXXkZ4D1zx7EQ&callback=initMap"></script>
     <script>

         var markerArray = [];
         var gmarker = [];
         var markerArrryYes = [];
         window.onload = function () {

            
             var size = $('.fLosingPointLabel').length;
             for (i = 0; i < size; i++) {
                 var markers = { fName: "", Phone: "", PetType: "", PetPic: "", PetName: "", LosingDate: "", PetDescription: "", LosingArea: "", LosingAddress: "", LosingPoint: "", Status: "" };
                 var fName = $('.fNameLabel').eq(i).text();
                 var Phone = $('.fPhoneLabel').eq(i).text();
                 var PetPic = $('.fPetPicLabel').eq(i).text();
                 var PetType = $('.fPetTypeLabel').eq(i).text();
                 var PetName = $('.fPetNameLabel').eq(i).text();
                 var LosingDate = $('.fLosingDateLabel').eq(i).text();
                 var PetDescription = $('.fPetDescriptionLabel').eq(i).text();
                 var LosingArea = $('.fLosingAreaLabel').eq(i).text();
                 var LosingAddress = $('.fLosingAddressLabel').eq(i).text();
                 var LosingPoint = $('.fLosingPointLabel').eq(i).text();
                 var Status = $('.fStatusLabel').eq(i).text();


                 markers.locationLatitude = LosingPoint.split(',')[0];
                 markers.locationLongitude = LosingPoint.split(',')[1];
                 markers.fName = fName;
                 markers.Phone = Phone;
                 markers.PetPic = PetPic;
                 markers.PetType = PetType;
                 markers.PetName = PetName;
                 markers.LosingAddress = LosingAddress;
                 markers.LosingDate = LosingDate;
                 markers.PetDescription = PetDescription;
                 markers.LosingArea = LosingArea;
                 markers.Status = Status;

                 if (markers.Status == "協尋中") {
                     markerArray.push(markers);
                 } else {
                     markerArrryYes.push(markers);
                 }

                 


             }

             var mapOptions = {
                 //center: new google.maps.LatLng(markers.locationLatitude, markers.locationLongitude),
                 center: new google.maps.LatLng(23.603139575594437, 120.8531219004119),
                 zoom: 8,
                 mapTypeId: google.maps.MapTypeId.ROADMAP
             };

             var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);

             var infoWindow = new google.maps.InfoWindow();

             for (i = 0; i < markerArray.length; i++) {
                 var data = markerArray[i];
                 var icon = {
                     url: data.PetPic, // url
                     scaledSize: new google.maps.Size(32, 32), // scaled size
                     origin: new google.maps.Point(0, 0), // origin
                     anchor: new google.maps.Point(0, 0) // anchor
                 };

                 
                 var myLatlng = new google.maps.LatLng(data.locationLatitude, data.locationLongitude);

               

                 var category = data.PetType;
                 var area = data.LosingArea;
                 var marker = new google.maps.Marker({
                     position: myLatlng,
                     category: category,
                     area: area,
                     map: map,

                     icon: icon,
                     size: new google.maps.Size(20, 32),
                     title: data.PetName
                 });
                 marker.typeBool = true;
                 marker.areaBool = true;

                 (function (marker, data) {
                     google.maps.event.addListener(marker, "click", function (e) {

                         var PeopleName = data.fName;
                         var Phone = data.Phone;
                         var PN = data.PetName;

                        
                         var MD = data.LosingDate;
                         var DS = data.PetDescription;
                         var MA = data.LosingArea;
                         var PT = data.PetType;
                         var PP = data.PetPic;
                         var LA = data.LosingAddress;
                         var ST = data.Status;

                         var html = '<table style=" font-size: 14px;">' +
                                    '<tr>' +
                                    '<td>寵物種類：</td>' +
                                    '<td>' + PT + '</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                    '<td>寵物名稱：</td>' +
                                    '<td>' + PN + '</td>' +
                                    '</tr>' +                              
                                    '<tr>' +
                                    '<td>特徵描述：</td>' +
                                    '<td>' + DS + '</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                    '<td>走失地點：</td>' +
                                    '<td>' + LA + '</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                    '<td>遺失日期：</td>' +
                                    '<td>' + MD + '</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                    '<td>連絡人：</td>' +
                                    '<td>' + PeopleName + '</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                    '<td>連絡電話：</td>' +
                                    '<td>' + Phone + '</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                    '<td colspan="2"><img src="' + PP + '" width="300px" height="250px" /></td>' +
                                    '</tr>' +
                                    '</table>';


                         infoWindow.setContent(html),
                         infoWindow.open(map, marker);
                     });
                 })(marker, data);
                 gmarker.push(marker)

             }
             console.log(gmarker);
         }
            ///////
         var typeValue = "";
         var areaValue = "";

         function selectMarker() {
             for (var i = 0; i < gmarker.length; i++) {
                 gmarker[i].setVisible(gmarker[i].typeBool && gmarker[i].areaBool);
             }
         }


         function filterTypeMarker(type) {
             for (var i = 0; i < gmarker.length; i++) {
                 gmarker[i].category == type ? gmarker[i].typeBool = true
             : gmarker[i].typeBool = false
             }

         }

         function setType() {
             typeValue = document.getElementById('type').value;

             if (typeValue == "all") {
                 for (var i = 0; i < gmarker.length; i++) {
                   gmarker[i].typeBool = true
                   selectMarker();
                 }
             }
             else {
                 filterTypeMarker(typeValue);
                 selectMarker();
             }
                
             
            
         }

         function filterAreaMarker(area) {
             for (var i = 0; i < gmarker.length; i++) {
                 gmarker[i].area == area ? gmarker[i].areaBool = true
             : gmarker[i].areaBool = false
             }

         }

         function setArea() {
             areaValue = document.getElementById('area').value;

             if (areaValue == "all") {
                 for (var i = 0; i < gmarker.length; i++) {
                     gmarker[i].areaBool = true
                     selectMarker();
                 }
             }
             else {

                 filterAreaMarker(areaValue);
                 selectMarker();
              
             }
         }

         
         
            
   

    </script>
     <style type="text/css">
         .auto-style2 {
             font-size: large;
         }
         .list-group-horizontal .list-group-item {
             display: inline-block;
             width: 30%;
             text-align: center;
         }

        
         

         .auto-style4 {
             font-size: x-large;
         }

        
         

     </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <form id="form1" runat="server">
        <div id="fh5co-work-section" class="fh5co-light-grey-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12" style="text-align:center">

                      
                       <div class="col-md-12" >
                            <div class="list-group list-group-horizontal">    
                                                
                                    <a href="PetSearchInfo.aspx" class="list-group-item" style="background-color:#39F; color:#FFF"><span class="auto-style2">走失寵物資訊</span></a>                           
                                    <a href="PetSearch.aspx" class="list-group-item" ><span class="auto-style2">走失寵物資訊上傳</span></a>                               
                                    <a href="PetSearchEdit.aspx" class="list-group-item"><span class="auto-style2">寵物遺失資訊編輯</span></a>   
                                                                                                        
                            </div>
                        </div>
                      <br/>
                      <br/> 
                      <center>  
                      <label><span class="auto-style4">篩選條件</span></label>
                       </center>
                      <div class="col-md-6">
                        <div id="selectType" >
                            
                            <select id="type" class="form-control" onchange="setType()">
                                <option  disabled="disabled" selected="selected">選擇寵物種類</option>
                                <option value="all">全部種類</option>
                                <option value="狗">狗</option>
                                <option value="貓">貓</option>
                                <option value="其他">其他</option>
                            </select>                         
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div id="selectArea" >
                            
                            <select id="area" class="form-control" onchange="setArea()" >
                                <option disabled="disabled" selected="selected">選擇縣市</option>
                                <option value="all">全台</option>
                                <option value="基隆市">基隆市</option>
                                <option value="台北市">台北市</option>
                                <option value="新北市">新北市</option>
                                <option value="桃園市">桃園市</option>
                                <option value="新竹市">新竹市</option>
                                <option value="新竹縣">新竹縣</option>
                                <option value="苗栗縣">苗栗縣</option>
                                <option value="台中市">台中市</option>
                                <option value="彰化縣">彰化縣</option>
                                <option value="南投縣">南投縣</option>
                                <option value="雲林縣">雲林縣</option>
                                <option value="嘉義市">嘉義市</option>
                                <option value="嘉義縣">嘉義縣</option>
                                <option value="台南市">台南市</option>
                                <option value="高雄市">高雄市</option>
                                <option value="屏東縣">屏東縣</option>
                                <option value="台東縣">台東縣</option>
                                <option value="花蓮縣">花蓮縣</option>
                                <option value="宜蘭縣">宜蘭縣</option>
                                <option value="澎湖縣">澎湖縣</option>
                                <option value="金門縣">金門縣</option>
                                <option value="連江縣">連江縣</option>                                
                            </select>             
                        </div>
                      </div>   
                    </div>
                     <div class="panel-body" id="dvMap" style=" height:700px; width:100%; "></div>

                    
                         
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoAzureConnectionString %>" DeleteCommand="DELETE FROM [tLosingPetCheckin] WHERE [fId] = @fId AND [MemberAccount] = @MemberAccount" InsertCommand="INSERT INTO [tLosingPetCheckin] ([MemberAccount], [fName], [fPhone], [fPetName], [fPetType], [fPetDescription], [fPetPic], [fLosingArea], [fLosingAddress], [fLosingPoint], [fLongitude], [fLatitude], [fLosingDate], [fStatus]) VALUES (@MemberAccount, @fName, @fPhone, @fPetName, @fPetType, @fPetDescription, @fPetPic, @fLosingArea, @fLosingAddress, @fLosingPoint, @fLongitude, @fLatitude, @fLosingDate, @fStatus)" SelectCommand="SELECT * FROM [tLosingPetCheckin]" UpdateCommand="UPDATE [tLosingPetCheckin] SET [fName] = @fName, [fPhone] = @fPhone, [fPetName] = @fPetName, [fPetType] = @fPetType, [fPetDescription] = @fPetDescription, [fPetPic] = @fPetPic, [fLosingArea] = @fLosingArea, [fLosingAddress] = @fLosingAddress, [fLosingPoint] = @fLosingPoint, [fLongitude] = @fLongitude, [fLatitude] = @fLatitude, [fLosingDate] = @fLosingDate, [fStatus] = @fStatus WHERE [fId] = @fId AND [MemberAccount] = @MemberAccount">
                                        <DeleteParameters>
                                            <asp:Parameter Name="fId" Type="Int32" />
                                            <asp:Parameter Name="MemberAccount" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="MemberAccount" Type="String" />
                                            <asp:Parameter Name="fName" Type="String" />
                                            <asp:Parameter Name="fPhone" Type="String" />
                                            <asp:Parameter Name="fPetName" Type="String" />
                                            <asp:Parameter Name="fPetType" Type="String" />
                                            <asp:Parameter Name="fPetDescription" Type="String" />
                                            <asp:Parameter Name="fPetPic" Type="String" />
                                            <asp:Parameter Name="fLosingArea" Type="String" />
                                            <asp:Parameter Name="fLosingAddress" Type="String" />
                                            <asp:Parameter Name="fLosingPoint" Type="String" />
                                            <asp:Parameter Name="fLongitude" Type="String" />
                                            <asp:Parameter Name="fLatitude" Type="String" />
                                            <asp:Parameter DbType="Date" Name="fLosingDate" />
                                            <asp:Parameter Name="fStatus" Type="String" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="fName" Type="String" />
                                            <asp:Parameter Name="fPhone" Type="String" />
                                            <asp:Parameter Name="fPetName" Type="String" />
                                            <asp:Parameter Name="fPetType" Type="String" />
                                            <asp:Parameter Name="fPetDescription" Type="String" />
                                            <asp:Parameter Name="fPetPic" Type="String" />
                                            <asp:Parameter Name="fLosingArea" Type="String" />
                                            <asp:Parameter Name="fLosingAddress" Type="String" />
                                            <asp:Parameter Name="fLosingPoint" Type="String" />
                                            <asp:Parameter Name="fLongitude" Type="String" />
                                            <asp:Parameter Name="fLatitude" Type="String" />
                                            <asp:Parameter DbType="Date" Name="fLosingDate" />
                                            <asp:Parameter Name="fStatus" Type="String" />
                                            <asp:Parameter Name="fId" Type="Int32" />
                                            <asp:Parameter Name="MemberAccount" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                       
                            <div style="display:none;">
                        <asp:Repeater ID="rptMarkers" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                             <asp:Label ID="lbl_fId" CssClass="fIdLabel" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "fId")%>' />
                             <asp:Label ID="lbl_fName" CssClass="fNameLabel" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "fName")%>' />     
                             <asp:Label ID="lbl_fPhone" CssClass="fPhoneLabel" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "fPhone")%>' /> 
                             <asp:Label ID="lbl_fPetPic" CssClass="fPetPicLabel" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "fPetPic")%>' />
                             <asp:Label ID="lbl_fPetType" CssClass="fPetTypeLabel" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "fPetType")%>' /> 
                             <asp:Label ID="lbl_fPetName" CssClass="fPetNameLabel" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "fPetName")%>' /> 
                             <asp:Label ID="lbl_fLosingDate" CssClass="fLosingDateLabel" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "fLosingDate", "{0:yyyy-MM-dd}")%>' /> 
                             <asp:Label ID="lbl_fPetDescription" CssClass="fPetDescriptionLabel" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "fPetDescription")%>' /> 
                             <asp:Label ID="lbl_fLosingArea" CssClass="fLosingAreaLabel" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "fLosingArea")%>' />
                             <asp:Label ID="lbl_fLosingAddress" CssClass="fLosingAddressLabel" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "fLosingAddress")%>' />
                             <asp:Label ID="lbl_fLosingPoint" CssClass="fLosingPointLabel" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "fLosingPoint")%>' /> 
                             <asp:Label ID="lbl_fStatus" CssClass="fStatusLabel" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "fStatus")%>' />       
                            </ItemTemplate>
                            <SeparatorTemplate>
                               <br>
                            </SeparatorTemplate>
                        </asp:Repeater>
                            
                        </div>        

                    

                </div>

                    
                 </div>
                
                </div>
        
            </form>  
</asp:Content>
  