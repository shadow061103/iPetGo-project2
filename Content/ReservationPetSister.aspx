<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReservationPetSister.aspx.cs" Inherits="ReservationPetSister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
      
    <style type="text/css">
        .auto-style3 {
            font-size: x-large;
        }
    </style>
      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
 
    <div class="col-lg-offset-2 col-lg-8">
         <% PetSitterfactory factory = new PetSitterfactory();

             int id =Convert.ToInt32(Request.Form["id"]);
             if (id != 0)
                 Session[Dictionary.SK_sitterId] = id;

           int  sitterId = (int)Session[Dictionary.SK_sitterId];

             kpetSitter sitter = factory.QueryPetSitter(sitterId);
       %>
        <!-- Basic Form -->
        <div class="panel panel-blue margin-bottom-40">
            <div class="panel-heading" style="font-size:x-large">
                <h3 class="panel-title"  style="font-size:x-large"><i class="fa fa-tasks"></i>寵物保姆</h3>
            </div>
            <div class="panel-body">

                <form  class="form-group" role="form" action="Reservation.aspx" method="post">

                    <div class="col-md-6">
                        <img src="<%=sitter.fImage %>" style="width:350px;height:300px"/>
                    </div>

                    <div class="col-md-6">
                       
                        <label class="auto-style3">保母名稱</label>
                        <h4><%=sitter.fserviceName %></h4>

                       
                        <label class="auto-style3">地區</label>
                        <h4><%=sitter.fCountry+sitter.fArea %></h4>
                    </div>

                   <div class="col-md-6">   
                       
                             <label class="auto-style3">詳細地址</label>
                            <h4><%=sitter.fAddress %></h4>
                        </div>

                    <div class="form-group">   
                     
                            <label class="auto-style3">收費</label>
                        <h4>NT$ <%=sitter.fStayPay %></h4>
                    </div>
           
               

                    <div class="form-group">   
                    
                           <label class="auto-style3">主要服務對象</label>
                         <h4><%=sitter.fMainType %>
                             <!--隱藏欄位-->
                            <input type="hidden" name="sitterId" value="<%=sitter.MemberId %>"/>
                           </h4>
                    </div>
                    <div class="form-group">
                    
                         <label class="auto-style3">照顧年資</label>
                          <h4><%=sitter.fSeniority %> 年</h4>
                    </div>

                    <div class="form-group">

                    
                            <label class="auto-style3">接待注意事項</label>
                         <h4><%=sitter.fNote %></h4>
                    </div>

                      <div class="form-group">
                  
                        <label class="auto-style3">電話面談時間</label>
                           <h4><%=sitter.fTeltimeWeek+sitter.fTeltime %></h4>
                    </div>

                    <div class="form-group">
                       
                         <label class="auto-style3">環境描述</label>
                        <h4><%=sitter.fSurround %></h4>
                    </div>

                     <div class="form-group">
                    
                           <label class="auto-style3">是否有證照</label>
                          <h4><% 
                                  if(sitter.fLicenseHave == true)
                                  Response.Write("有");
                                  else
                                  Response.Write("無");
                                  %></h4>
                    </div>
                <div class="form-group">
                       
                         <label class="auto-style3">自我介紹</label>
                        <h4><%=sitter.fIntro %></h4>
                    </div>
                    
                   <input type="submit" class="btn btn-info" value="預約服務"/>
                    
                </form>

            </div>

        </div>
         </div>
    <script src="js/jquery.min.js"></script>
</asp:Content>

