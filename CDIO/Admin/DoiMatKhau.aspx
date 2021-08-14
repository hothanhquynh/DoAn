<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DoiMatKhau.aspx.cs" Inherits="CDIO.Admin.DoiMatKhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="../assets/css/QLTK.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1>ĐỔI MẬT KHẨU</h1>

        <table class="table">
            <tr>
                <td >
                    <asp:Label ID="Label1" runat="server" Text="Tên đăng nhập" Font-Bold="True"></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
          
           
          
            <tr>
                <td >
                    <asp:Label ID="Label4" runat="server" Text="Mật khẩu cũ (*)" Font-Bold="True"></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
           
            
           
            <tr>
                <td >
                    <asp:Label ID="Label2" runat="server" Text="Mật khẩu mới (*)" Font-Bold="True"></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage="Mật khẩu mới tối thiểu 8 ký tự, ít nhất 1 chữ cái và 1 con số !" ControlToValidate="TextBox2" Display="Dynamic" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"></asp:RegularExpressionValidator>
                </tr>
          
         
          
            <tr>
                <td >
                    <asp:Label ID="Label3" runat="server" Text="Xác nhận mật khẩu (*)" Font-Bold="True"></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                </td>
             
            </tr>
            
        </table>
        <br />
        <asp:Button ID="Button1" CssClass="button_ttk" runat="server" OnClick="Button1_Click" Text="Sửa"  onclientclick="return confirm('Bạn có chắc muốn đổi mật khẩu?');" Font-Bold="True"/>
        <asp:Button ID="Button2" CssClass="button_ttk" runat="server" Text="Quay về" OnClick="Button2_Click" Font-Bold="True" />
</asp:Content>
