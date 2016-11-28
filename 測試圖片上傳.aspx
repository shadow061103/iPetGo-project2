<%@ Page Language="C#" AutoEventWireup="true" CodeFile="測試圖片上傳.aspx.cs" Inherits="測試圖片上傳" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript">
        function previewFile() {
            var preview = document.querySelector('#<%=Avatar.ClientID %>');
            var file = document.querySelector('#<%=avatarUpload.ClientID %>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="avatarUpload" runat="server" onchange="previewFile()"/>
   <%-- <input ID="avatarUpload" type="file" name="file" onchange="previewFile()"  runat="server" />--%>
        <%--<asp:FileUpload ID="avatarUpload" runat="server" />--%>
<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />
<asp:Image ID="Avatar" runat="server" Height="225px" ImageUrl="~/Petpic/dog.jpg" Width="225px" />
       
    </div>
    </form>
</body>
</html>
