<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ThemKM.aspx.cs" Inherits="CDIO.Admin.ThemKM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Thêm khuyến mãi</title>
    <link href="../assets/css/ThemKM.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align: center;margin: 30px;">THÊM KHUYẾN MÃI</h1>
    <table class="table">
        <tr>
            <td>Mã khuyến mãi</td>
            <td>
                <asp:TextBox ID="txtma" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>Tên khuyến mãi</td>
            <td>
                <asp:TextBox ID="txtten" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Từ ngày</td>
            <td>
               <asp:TextBox ID="from_day" runat="server" CssClass="text_calendar" ReadOnly="True" Enabled="False"></asp:TextBox>
                      
            </td>
            <td>Đến ngày</td>
            <td>
                <asp:TextBox ID="to_day" runat="server" CssClass="text_calendar" ReadOnly="True" Enabled="False"></asp:TextBox>
                       
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Trạng Thái</td>
            <td class="auto-style1">
                <asp:DropDownList ID="ddl_trangthai" runat="server" Enabled="False" CssClass="drop_trangthai">
                    <asp:ListItem>Đang khuyến mãi</asp:ListItem>
                    <asp:ListItem>Chưa khuyến mãi</asp:ListItem>
                    <asp:ListItem>Ngừng khuyến mãi</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style1">Mã sản phẩm</td>
            <td>
                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" SelectionMode="Multiple" DataTextField="MaSP" DataValueField="MaSP" CssClass="lb_masp"></asp:ListBox><i class="message">(Nhấn giữ Ctrl để thêm nhiều sản phẩm)</i>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [MaSP] FROM [SANPHAM] ORDER BY [MaSP]"></asp:SqlDataSource>
            </td>
            
        </tr>
        <tr>
            <td>Tỷ lệ khuyến mãi</td>
            <td>
                <asp:TextBox ID="txttyle" runat="server"></asp:TextBox>
            </td>
            <td>Ghi chú</td>
            <td>
                <asp:TextBox ID="txtghichu" runat="server" TextMode="MultiLine" CssClass="ghichu"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Số lượng</td>
            <td>
                <asp:TextBox ID="txtsl" runat="server"></asp:TextBox>
            </td>
        </tr>

    </table>
    <div class="button">
         <asp:Button ID="btn_them" runat="server" Text="Thêm" OnClick="btn_them_Click" CssClass="btn_km"/>
        <asp:Button ID="btn_sua" runat="server" Text="Sửa" OnClick="btn_sua_Click" CssClass="btn_km"/>
        <asp:Button ID="btn_huy" runat="server" Text="Hủy" OnClick="btn_huy_Click" CssClass="btn_km"/>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" CellPadding="4" CssClass="grid" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MAKM" HeaderText="Mã KM" >
            <HeaderStyle Height="50px" />
            <ItemStyle Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="MASP" HeaderText="Mã SP" >
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="TYLEKM" DataFormatString="{0} %" HeaderText="Tỷ lệ KM" >
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="GHICHU" HeaderText="Ghi chú" >
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="250px" />
            </asp:BoundField>
            <asp:BoundField DataField="SOLUONG" HeaderText="Số lượng" >
            <ItemStyle Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
            </asp:BoundField>
            <asp:CommandField SelectText="Sửa" ShowSelectButton="True" >
            <ItemStyle ForeColor="#0033CC" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
            </asp:CommandField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lblxoa" runat="server" CommandArgument='<%# Eval("MASP") %>' OnClientClick="return confirm('Bạn có muốn xóa?')" OnClick="lblxoa_Click">Xóa</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
</asp:Content>
