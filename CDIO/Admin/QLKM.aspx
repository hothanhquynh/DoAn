<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QLKM.aspx.cs" Inherits="CDIO.Admin.QLKM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Quản lý khuyến mại</title>
    <link href="../assets/css/QLKM.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align: center;margin: 30px;">THÔNG TIN ĐỢT KHUYẾN MÃI</h1>
     <table class="table">
        <tr>
            <td>Mã khuyến mãi</td>
            <td>
                <asp:TextBox ID="txtma" runat="server"></asp:TextBox>
            </td>
            <td>Tên khuyến mãi</td>
            <td>
                <asp:TextBox ID="txtten" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Từ ngày</td>
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
            <td>Đến ngày</td>
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
        </tr>
     
       

    </table>
    <div class="button">
         <asp:Button ID="btn_them" runat="server" Text="Thêm khuyến mãi" OnClick="btn_them_Click" CssClass="btn_km"/>
         <asp:Button ID="btn_sua" runat="server" Text="Sửa" OnClick="btn_sua_Click" CssClass="btn_km"/>
    </div>
   
    </br>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="drop_trangthai">
        <asp:ListItem Value="0">Tất cả</asp:ListItem>
        <asp:ListItem Value="1">Đang khuyến mãi</asp:ListItem>
        <asp:ListItem Value="2">Chưa khuyến mãi</asp:ListItem>
        <asp:ListItem Value="3">Ngừng khuyến mãi</asp:ListItem>
</asp:DropDownList>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" CssClass="grid" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MAKM" HeaderText="Mã KM" >
            <ItemStyle Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="TENKM" HeaderText="Tên KM" >
            <ItemStyle Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="TUNGAY" HeaderText="Từ ngày" >
            <HeaderStyle Height="50px" />
            <ItemStyle Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="DENNGAY" HeaderText="Đến ngày" >
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="TRANGTHAI" HeaderText="Trạng thái" >
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
            </asp:BoundField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lblxem" runat="server" OnClick="lblxem_Click" CommandArgument='<%# Eval("MAKM") %>'>Xem chi tiết</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
            </asp:TemplateField>
            <asp:CommandField SelectText="Sửa" ShowSelectButton="True" >
            <ItemStyle ForeColor="#0033CC" HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
            </asp:CommandField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lblxoa" runat="server" OnClientClick="return confirm('Bạn có muốn xóa?')" OnClick="lblxoa_Click" CommandArgument='<%# Eval("MAKM") %>'>Xóa</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('Bạn có muốn ngừng khuyến mãi')" CommandArgument='<%# Eval("MAKM") %>' OnClick="LinkButton1_Click">Ngừng khuyến mãi</asp:LinkButton>
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
