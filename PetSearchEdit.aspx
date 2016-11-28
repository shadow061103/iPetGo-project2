<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PetSearchEdit.aspx.cs" Inherits="RegisterMember" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- datepicker -->
    <link href="css/ui-lightness/jquery-ui.min.css" rel="stylesheet" />
    <link href="css/ui-lightness/mystyle.css" rel="stylesheet" />


    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBfITjxkWfgSz70owaNaek_-xRTDsTiNr8&callback=initMap"></script>

    <style type="text/css">
        .auto-style2 {
            font-size: large;
        }
        .auto-style3 {
            color: #a94442;
            font-size: medium;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div id="fh5co-work-section" class="fh5co-light-grey-section">
            <div class="container">

                <div class="row">
                    <div class="col-md-3">
                        <div class="list-group">
                            <a href="PetSearchInfo.aspx" class="list-group-item"><span class="auto-style2">走失寵物資訊</span></a>
                            <a href="PetSearch.aspx" class="list-group-item" ><span class="auto-style2">走失寵物資訊上傳</span></a>  
                            <a href="PetSearchEdit.aspx" class="list-group-item" style="background-color:#39F; color:#FFF"><span class="auto-style2">寵物遺失資訊編輯</span></a>                     
                        </div>
                    </div>
                    <div class="col-md-9">
                         <div class="row carousel-holder">

                            <div class="row">
                                <div class="col-md-12 ">
                                    <form id="form" runat="server" >
                                        <br />
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:iPetGoAzureConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [tLosingPetCheckin] WHERE ([MemberAccount] = @MemberAccount)" DeleteCommand="DELETE FROM [tLosingPetCheckin] WHERE [fId] = @fId AND [MemberAccount] = @MemberAccount" InsertCommand="INSERT INTO [tLosingPetCheckin] ([MemberAccount], [fName], [fPhone], [fPetName], [fPetType], [fPetDescription], [fPetPic], [fLosingArea], [fLosingAddress], [fLosingPoint], [fLongitude], [fLatitude], [fLosingDate], [fStatus]) VALUES (@MemberAccount, @fName, @fPhone, @fPetName, @fPetType, @fPetDescription, @fPetPic, @fLosingArea, @fLosingAddress, @fLosingPoint, @fLongitude, @fLatitude, @fLosingDate, @fStatus)" UpdateCommand="UPDATE [tLosingPetCheckin] SET [fName] = @fName, [fPhone] = @fPhone, [fPetName] = @fPetName, [fPetType] = @fPetType, [fPetDescription] = @fPetDescription, [fPetPic] = @fPetPic, [fLosingArea] = @fLosingArea, [fLosingAddress] = @fLosingAddress, [fLosingPoint] = @fLosingPoint, [fLongitude] = @fLongitude, [fLatitude] = @fLatitude, [fLosingDate] = @fLosingDate, [fStatus] = @fStatus WHERE [fId] = @fId AND [MemberAccount] = @MemberAccount">
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
                                            <SelectParameters>
                                                <asp:SessionParameter Name="MemberAccount" SessionField="memberAccount" Type="String" />
                                            </SelectParameters>
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
                                         <asp:Label ID="Label1" runat="server" Text="Label" CssClass="auto-style3">*如果寵物需更改相關資訊或已尋回請至更新資訊頁面編輯該筆資料</asp:Label>
                                         <asp:GridView ID="GridView1" runat="server" class="table" AutoGenerateColumns="False" DataKeyNames="fId,MemberAccount" DataSourceID="SqlDataSource1" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" CssClass="auto-style2"  >
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                
                                                
                                                
                                                <asp:BoundField DataField="fId" HeaderText="編號" InsertVisible="False" ReadOnly="True" SortExpression="fId" >



                                                </asp:BoundField>
                                                   <asp:BoundField DataField="fPetType" HeaderText="類別" SortExpression="fPetType" >



                                                </asp:BoundField>
                                                <asp:BoundField DataField="fPetName" HeaderText="寵物名稱" SortExpression="fPetName"  >



                                                </asp:BoundField>
                                             
                                                <asp:BoundField DataField="fLosingArea" HeaderText="走失縣市" SortExpression="fLosingArea"  >
                                                

                                                
                                                </asp:BoundField> 
                                                <asp:BoundField DataField="fLosingDate" HeaderText="走失日期" dataformatstring="{0:yyyy-MM-dd}" SortExpression="fLosingDate"  />
                                                <asp:BoundField DataField="fStatus" HeaderText="狀態" SortExpression="fStatus" ItemStyle-Width="15%" >
                                                

                                                
                                                </asp:BoundField>
                                                <asp:HyperLinkField DataNavigateUrlFields="fId" DataNavigateUrlFormatString="PetSearchUpdate.aspx?pid={0}" HeaderText="更新資訊" Text="編輯" ControlStyle-ForeColor="#6D95E1" > 
                              
<ControlStyle ForeColor="#6D95E1"></ControlStyle>
                                                </asp:HyperLinkField>
                              
                                                
                                                
                                                
                                            </Columns>
                                            <EditRowStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"  />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#EFF3FB" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                        </asp:GridView>
                                          
                                          
                                    <br />
                                          
                                    </form>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                   
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>      
                    
                </div>                   
            </div>                
        </div>
</asp:Content>

