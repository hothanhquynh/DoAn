<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyDonHang.aspx.cs" Inherits="CDIO.Admin.QuanLyDonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/css/ql-don-hang.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="qldh-container">
        <div class="qldh-main-container">
            <h1>QUẢN LÝ ĐƠN HÀNG</h1>
            <h2>ĐANG CHỜ DUYỆT</h2>
            <asp:Label ID="lblChoDuyet" runat="server" Text=""></asp:Label>
                    <asp:GridView ID="grdChoDuyet" runat="server" AutoGenerateColumns="False" CssClass="gridview" AllowPaging="True" OnPageIndexChanging="grdChoDuyet_PageIndexChanging" PageSize="5" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="MaHD" HeaderText="Mã hóa đơn" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TenDangNhap" HeaderText="Tên đăng nhập" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="340px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NgayHD" DataFormatString="{0:d}" HeaderText="Ngày hóa đơn" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField AccessibleHeaderText="TrangThai" DataField="TrangThai" HeaderText="Trạng thái" >
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                            </asp:BoundField>
                        
                             <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnXemChiTiet" runat="server" CommandName="View" Text="Xem chi tiết" CommandArgument='<%# Eval("MaHD") %>' OnClick="btnXemChiTiet_Click" ForeColor="Blue"></asp:LinkButton>
                                </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDuyet" runat="server" CommandName="Update" OnClientClick="return confirm('Bạn có chắc chắn muốn duyệt đơn hàng này không?');" Text="Duyệt đơn" CommandArgument='<%# Eval("MaHD") %>' OnClick="btnDuyet_Click" ForeColor="Orange"></asp:LinkButton>
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

            <h2>TẤT CẢ HÓA ĐƠN</h2>
            <asp:Label ID="lblLichSu" runat="server" Text=""></asp:Label>
            <br />
            <asp:DropDownList ID="ddlTrangThai" runat="server" CssClass="ddl" OnSelectedIndexChanged="ddlTrangThai_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            <asp:GridView ID="grdChung" runat="server" AutoGenerateColumns="False" CssClass="gridview" AllowPaging="True" OnPageIndexChanging="grdChung_PageIndexChanging" OnSelectedIndexChanging="grdChung_SelectedIndexChanging" PageSize="5" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="MaHD" HeaderText="Mã hóa đơn" />
                    <asp:BoundField DataField="TenDangNhap" HeaderText="Tên đăng nhập" >
                    <ItemStyle Width="300px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                    <asp:BoundField DataField="NgayHD" DataFormatString="{0:d}" HeaderText="Ngày hóa đơn" >
                    <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField AccessibleHeaderText="TrangThai" DataField="TrangThai" HeaderText="Trạng thái" >
                        
                    <ItemStyle Width="150px" />
                    </asp:BoundField>
                        
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="View" Text="Xem chi tiết" CommandArgument='<%# Eval("MaHD") %>' OnClick="btnXemChiTiet_Click" ForeColor="Blue"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                        
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnXoa" runat="server" CommandName="Delete" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa đơn hàng không?');" Text="Xóa đơn" CommandArgument='<%# Eval("MaHD") %>' OnClick="btnXoa_Click" ForeColor="Red"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="80px" />
                    </asp:TemplateField>

                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDaGiao" runat="server" CommandName="View" Text="Đã giao" CommandArgument='<%# Eval("MaHD") %>' OnClick="btnDaGiao_Click" ForeColor="Blue"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="80px" />
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
    </div>
</asp:Content>
