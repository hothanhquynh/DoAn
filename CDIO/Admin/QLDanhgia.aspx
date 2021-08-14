<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QLDanhgia.aspx.cs" Inherits="CDIO.Admin.QLDanhgia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Quản lý đánh giá</title> 
    <link href="../assets/css/QLdanhgia.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align: center;margin: 20px;">QUẢN LÝ ĐÁNH GIÁ</h1>
    <div class="qldanhgia" style="text-align:center">
        <div class="danhgia_content">
            <table>
                <tr>
                    <td>
                         <p>Tên</p>
                    </td>
                    <td>
                    <asp:TextBox ID="txtten" runat="server" CssClass="input_danhgia" ReadOnly="True"></asp:TextBox> 
                    </td>
                    <td>
                        <p>Mã sản phẩm</p>
                                   
                    </td>
                    <td>
           <asp:TextBox ID="txtma" runat="server" CssClass="input_danhgia" ReadOnly="True"></asp:TextBox>      

                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Số sao</p>
                    </td>
                    <td>
              <asp:TextBox ID="txtsao" runat="server" CssClass="input_danhgia" ReadOnly="True"></asp:TextBox>               
                    </td>
                    <td>
                        <p>Ngày đánh giá</p>
                    </td>
                    <td>
                         <asp:TextBox ID="txtngay" runat="server" CssClass="input_danhgia" ReadOnly="True"></asp:TextBox>    
                    </td>
                </tr>
                <tr>
                    <td>
                          <p>Nội dung</p>  
                    </td>
                    <td>
                         <textarea id="txtcontent" cols="20" rows="2"  class="input_danhgia input_textaria" ReadOnly="True" style="height:100px" runat="server"></textarea>  
                               
                    </td>
                </tr>
                <tr>
                    <td>
                        Từ ngày
                    </td>
                    <td>
                        <asp:TextBox ID="from_day" runat="server" CssClass="text_calendar" ReadOnly="True"></asp:TextBox>
                        <asp:ImageButton ID="img_calendar" runat="server" ImageAlign="AbsBottom" ImageUrl="../assets/img/icons8-calendar.gif" CssClass="img_calendar" OnClick="img_calendar_Click"/>
                        <asp:Calendar ID="Calendar1" runat="server" Height="180px" Width="200px" OnDayRender="Calendar1_DayRender" BackColor="#FFFF99" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" OnSelectionChanged="Calendar1_SelectionChanged">
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
                        <asp:Calendar ID="Calendar2" runat="server" Height="180px" Width="200px" OnDayRender="Calendar2_DayRender" BackColor="#FFFF99" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" OnSelectionChanged="Calendar2_SelectionChanged">
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
       
    </div>
        <div>
            
            <%--<asp:TextBox ID="from_day" runat="server" type="Date"></asp:TextBox>
            <asp:TextBox ID="to_day" runat="server" type="Date"></asp:TextBox>--%>
            <asp:Button ID="btnloc" runat="server" Text="Lọc" OnClick="btnloc_Click" CssClass="btn-danhgia"/>
            <asp:Button ID="btnhuyloc" runat="server" Text="Hủy Lọc" OnClick="btnhuyloc_Click" CssClass="btn-danhgia"/>
        </div>
        <asp:GridView ID="gvdanhgia" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="gvdanhgia" OnSelectedIndexChanged="gvdanhgia_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="gvdanhgia_PageIndexChanging" OnSelectedIndexChanging="gvdanhgia_SelectedIndexChanging" PageSize="5">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="MADG" HeaderText="Mã ĐG" >
                <ItemStyle Width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="TENDANGNHAP" HeaderText="Tên đăng nhập" >
                <ItemStyle Width="210px" />
                </asp:BoundField>
                <asp:BoundField DataField="TEN" HeaderText="Tên" >
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="SOSAO" HeaderText="Số sao" />
                <asp:BoundField DataField="NOIDUNG" HeaderText="Nội dung" >
                <ItemStyle Width="300px" />
                </asp:BoundField>
                <asp:BoundField DataField="NGAYDG" HeaderText="Ngày đánh giá" />
                <asp:BoundField DataField="MASP" HeaderText="Mã SP" >
                
                <ItemStyle Width="100px" />
                </asp:BoundField>
                
                <asp:CommandField SelectText="Chọn" ShowSelectButton="True" >
                <ItemStyle Width="50px" ForeColor="Blue" />
                </asp:CommandField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnxoa" runat="server" OnClientClick="return confirm('Bạn có muốn xóa?')" OnClick="btnxoa_Click">Xóa</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="50px" />
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
    </div>
</asp:Content>
