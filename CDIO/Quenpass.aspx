<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quenpass.aspx.cs" Inherits="CDIO.Quenpass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Quên mật khẩu</title>
    <meta charset="UTF-8" />
     <link rel="stylesheet" href="./assets/css/grid.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-5.14.0/css/all.min.css ">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/slide.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
     <style> 
        p{
            color:black;
        }
        input{
            margin-right: 15px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
  <form id="form1" runat="server">
        
                    <div class="login-container__item" style=" margin-left:30%;margin-top:6%;">
                        <h1 style="color:red;">QUÊN MẬT KHẨU</h1>
                        <p>Email *</p>
                        <asp:TextBox ID="email_quenpass" runat="server" CssClass="input-login"></asp:TextBox>                        
                        <asp:Button  ID="quenmk" runat="server" Text="GỬI MÃ" style="cursor:pointer; padding:10px 10px;font-size:14px;font-weight:600;color:#fff; border: none;margin-top:20px;background-color: var(--main-color);" OnClick="quenmk_Click" />
                        <br>
                        <asp:LinkButton ID="lbl_back" runat="server" Font-Size="Small" ForeColor="Red" PostBackUrl="~/Login.aspx">&lt;-- Trở về đăng nhập</asp:LinkButton>
                        
                    </div>
    </form>
</body>
</html>
