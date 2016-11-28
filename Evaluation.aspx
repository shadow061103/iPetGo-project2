<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Evaluation.aspx.cs" Inherits="Evaluation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            font-size: large;
        }
        .auto-style3 {
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="col-lg-offset-2 col-lg-8">
        <!-- Basic Form -->
        <div class="panel panel-blue margin-bottom-40">
            <div class="panel-heading">
                <h3 class="panel-title" style="font-size:x-large"><i class="fa fa-tasks"></i>評價頁面</h3>
            </div>

            <div class="panel-body">
                <form id="form1" runat="server">
                  
                       
                        <asp:TextBox class="form-control" ID="txtid" runat="server" Visible="False"></asp:TextBox>
                        
                  

                    <div class="form-group">
                        <h4><strong>評價</strong></h4>
                        <div style="width:700px;position:relative">
                        <label style="color:coral;float:left;"><span class="auto-style3">(不滿意)</span></label>
                          
                       <label style="color:coral;float:right;"><span class="auto-style3">(滿意)</span></label>
                            </div>
                        <asp:RadioButtonList  ID="rdbPetsex" runat="server" RepeatDirection="Horizontal" Width="100%" CssClass="auto-style2">
                            <asp:ListItem Selected="True">1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                    <div class="form-group">
                        <h4><strong>評語</strong></h4>
                        <textarea id="txtNote" cols="40" class="form-control" name="txtNote" rows="5" class="form-control" style="width: 500px"></textarea>
                    </div>
                    <div>
                        <asp:Button class="btn btn-info" ID="btnYes" runat="server" Text="送出" OnClick="btnYes_Click" />
                        <asp:Button class="btn btn-info" ID="btnNo" runat="server" Text="取消" OnClick="btnNo_Click" />
                    </div>
                </form>

            </div>
        </div>
    </div>
    <script src="js/jquery.min.js"></script>
</asp:Content>

