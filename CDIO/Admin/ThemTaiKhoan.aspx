<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ThemTaiKhoan.aspx.cs" Inherits="CDIO.Admin.ThemTaiKhoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="../assets/css/QLTK.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1>THÊM TÀI KHOẢN</h1>
            <table  class="table">
            <tr>
                <td ><asp:Label ID="Label1" runat="server" Text="Tên đăng nhâp (*)" Font-Bold="True"></asp:Label> </td> 
            <td>
                
                <asp:TextBox ID="txttdn" runat="server" AutoPostBack="True" ></asp:TextBox>
            </td>
                <asp:Label ID="Label14" runat="server" ForeColor="Red"></asp:Label>

                 
                
            </tr>
      



            <tr>
                <td >
                    <asp:Label ID="Label2" runat="server" Text="Mật khẩu (*)" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtmk" runat="server" MaxLength="8" TextMode="Password"></asp:TextBox>
                </td>

                   
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ForeColor="Red" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ErrorMessage="Tối thiểu tám ký tự, ít nhất một chữ cái và một số !" ControlToValidate="txtmk" Display="Dynamic"></asp:RegularExpressionValidator>
                    
            </tr>
           



            <tr>
                <td >
                    <asp:Label ID="Label3" runat="server" Text="Họ tên" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtht" runat="server" AutoPostBack="True"></asp:TextBox>
                </td>
            </tr>
           
            <tr>
                <td >
                    <asp:Label ID="Label4" runat="server" Text="Giới tính" Font-Bold="True"></asp:Label>
                </td>
                <td>
                   
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged1" AutoPostBack="True" >
                        <asp:ListItem >Nam</asp:ListItem>
                        <asp:ListItem >Nữ</asp:ListItem>
                    </asp:RadioButtonList>
                    
                    <asp:Label ID="Label11" runat="server"></asp:Label>
                    
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label5" runat="server" Text="Số điện thoại" Font-Bold="True"></asp:Label>
                </td>
              
                <td>
                    <asp:TextBox ID="txtsdt" runat="server" TextMode="Number"  ></asp:TextBox>
                </td>

                

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="SĐT phải đủ 10 nhập số !" ValidationExpression="\d{10}" ControlToValidate="txtsdt" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>

               
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label6" runat="server" Text="Email" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server" ></asp:TextBox>
                </td>

               
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ErrorMessage="Chưa nhập đúng định dạng email!" ControlToValidate="txtemail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                
            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label7" runat="server" Text="Địa chỉ" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtdc" runat="server" AutoPostBack="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Mã loại" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" AutoPostBack="True" ></asp:DropDownList>
                    <asp:Label ID="Label12" runat="server"></asp:Label>
                </td>
             

            </tr>
            <tr>
                <td >
                    <asp:Label ID="Label9" runat="server" Text="Trạng thái" Font-Bold="True"></asp:Label>
                </td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged" AutoPostBack="True">
                         <asp:ListItem >Mở</asp:ListItem>
                        <asp:ListItem >Khóa</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="Label13" runat="server"></asp:Label>
                </td>
            </tr>

           
           
            </table>
            <br />
            <asp:Button ID="Button1" CssClass="button_ttk" runat="server" Text="Thêm" OnClick="Button1_Click" Font-Bold="True" />
            <asp:Button ID="Button2" CssClass="button_ttk" runat="server" Text="Quay về" OnClick="Button2_Click" Font-Bold="True" />
</asp:Content>
