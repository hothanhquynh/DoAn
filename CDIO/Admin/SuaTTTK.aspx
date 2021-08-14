<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SuaTTTK.aspx.cs" Inherits="CDIO.Admin.SuaTTTK" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="../assets/css/QLTK.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>SỬA THÔNG TIN TÀI KHOẢN</h1>

          
        
                    <table class="table">
                        <tr>
                            <td >
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Tên đăng nhâp"></asp:Label>
                            </td>
                            <td >
                                <asp:TextBox ID="txttdn" runat="server"></asp:TextBox>
                            </td>
                           
                        </tr>
                      
                        <tr>
                            <td >
                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Họ tên"></asp:Label>
                            </td>
                            <td >
                                <asp:TextBox ID="txtht" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Gới tính"></asp:Label>
                            </td>
                            <td >
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                    <asp:ListItem>Nam</asp:ListItem>
                                    <asp:ListItem>Nữ</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="Số điện thoại"></asp:Label>
                            </td>
                            <td >
                                <asp:TextBox ID="txtsdt" runat="server" TextMode="Number"></asp:TextBox>
                            </td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtsdt" Display="Dynamic" ErrorMessage="SĐT phải đủ 10 nhập số !" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                           
                        </tr>
                        <tr>
                            <td >
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Email"></asp:Label>
                            </td>
                            <td >
                                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                            </td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtemail" Display="Dynamic" ErrorMessage="Chưa nhập đúng định dạng email!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </tr>
                        <tr>
                            <td >
                                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Địa chỉ"></asp:Label>
                            </td>
                            <td >
                                <asp:TextBox ID="txtdc" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Mã loại"></asp:Label>
                            </td>
                            <td >
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:Label ID="Label17" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Trạng thái"></asp:Label>
                            </td>
                            <td >
                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                                    <asp:ListItem>Mở</asp:ListItem>
                                    <asp:ListItem>Khóa</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:Label ID="Label18" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
               
                

        
       
        <asp:Button ID="Button1" CssClass="button_ttk" runat="server" OnClick="Button1_Click" Text="Sửa"  onclientclick="return confirm('Bạn có chắc muốn cập nhật?');" Font-Bold="True" />
        <asp:Button ID="Button2" CssClass="button_ttk" runat="server" Text="Quay về" OnClick="Button2_Click1" Font-Bold="True" />
</asp:Content>
