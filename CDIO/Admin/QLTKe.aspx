<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QLTKe.aspx.cs" Inherits="CDIO.Admin.QLTKe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Quản lý thống kê</title>
    <link href="../assets/css/QLTKe.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center;margin:30px;">
        <h1>THỐNG KÊ THEO NGÀY</h1>
        <table class="table">
            <tr>
                 <td>
                        Từ ngày
                    </td>
                    <td>
                        <asp:TextBox ID="from_day" runat="server" CssClass="text_calendar" ReadOnly="True"></asp:TextBox>
                        <asp:ImageButton ID="img_calendar" runat="server" ImageAlign="AbsBottom" ImageUrl="../assets/img/icons8-calendar.gif" CssClass="img_calendar" OnClick="img_calendar_Click"/>
                        <asp:Calendar ID="Calendar1" runat="server" Height="180px" Width="200px"  BackColor="#FFFF99" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" OnSelectionChanged="Calendar1_SelectionChanged">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                    </td>
                    <td>
                        Đến ngày
                    </td>
                    <td>
                        <asp:TextBox ID="to_day" runat="server" CssClass="text_calendar" ReadOnly="True"></asp:TextBox>
                        <asp:ImageButton ID="img_calendar2" runat="server" ImageAlign="AbsBottom" ImageUrl="../assets/img/icons8-calendar.gif" CssClass="img_calendar" OnClick="img_calendar2_Click"/>
                        <asp:Calendar ID="Calendar2" runat="server" Height="180px" Width="200px" BackColor="#FFFF99" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" OnSelectionChanged="Calendar2_SelectionChanged">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                    </td>
                <td>
                    <asp:Button ID="btn_loc" runat="server" Text="Lọc" CssClass="btn_loc" OnClick="btn_loc_Click"/>
                </td>
                <td>
                    <asp:Button ID="btn_huy" runat="server" Text="Hủy" CssClass="btn_loc" OnClick="btn_huy_Click"/>
                </td>
            </tr>
           
        </table>
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView3_PageIndexChanging" PageSize="5" CssClass="grid">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="MASP" HeaderText="Mã SP" >
                <HeaderStyle Height="50px" />
                <ItemStyle Width="250px" Height="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="TENSP" HeaderText="Tên sản phẩm" >
                <HeaderStyle Height="50px" />
                <ItemStyle Width="250px" Height="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="SLMUA" HeaderText="Số lượng mua" >
                <HeaderStyle Height="50px" />
                <ItemStyle Width="250px" Height="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="THANHTIEN" DataFormatString="{0:c0}" HeaderText="Thành Tiền" >
                <HeaderStyle Height="50px" />
                <ItemStyle Width="300px" Height="50px" />
                </asp:BoundField>
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
        <h1 style="margin:30px;">THỐNG KÊ DOANH THU</h1>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" CssClass="grid">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MASP" HeaderText="Mã SP" >
            <ItemStyle Height="50px" Width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="TENSP" HeaderText="Tên sản phẩm">
            <ItemStyle Width="150px" Height="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="GIANHAP" DataFormatString="{0:c0}" HeaderText="Giá nhập">
            <ItemStyle Width="120px" Height="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="GIAXUAT" DataFormatString="{0:c0}" HeaderText="Giá bán">
            <ItemStyle Width="120px" Height="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="SOLUONG" HeaderText="SL nhập vào">
            <ItemStyle Width="80px" Height="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="SLBAN" HeaderText="SL bán ra">
            <ItemStyle Width="80px" Height="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="SOLUONGTON" HeaderText="SL Tồn">
            <ItemStyle Width="80px" Height="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="TTNHAPVAO" DataFormatString="{0:c0}" HeaderText="TT nhập vào">
            <ItemStyle Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="TTBANRA" DataFormatString="{0:c0}" HeaderText="TT bán ra">
            <ItemStyle Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="DOANHTHU" DataFormatString="{0:c0}" HeaderText="Doanh Thu">
            <ItemStyle Width="150px" />
            </asp:BoundField>
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
    </div>
    <h1 style="margin:20px;text-align:center">TỔNG DOANH THU</h1>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="grid_tong-dthu">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="SLNHAP" HeaderText="Tổng số lượng nhập vào" >
            <HeaderStyle Height="50px" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="220px" Height="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="SLBAN" HeaderText="Tổng số lượng bán ra" >
            <HeaderStyle Height="50px" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" Height="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="TONGNHAP" DataFormatString="{0:c0}" HeaderText="Tổng số tiền nhập vào" >
            <HeaderStyle Height="50px" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" Height="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="TONGBAN" DataFormatString="{0:c0}" HeaderText="Tổng số tiền bán ra" >
            <HeaderStyle Height="50px" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" Height="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="DOANHTHU" DataFormatString="{0:#,##}" HeaderText="Doanh thu" >
            <HeaderStyle Height="50px" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="240px" Height="50px" />
            </asp:BoundField>
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
