<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Product-detail.Master" AutoEventWireup="true" CodeBehind="DonMua.aspx.cs" Inherits="CDIO.DonMua" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/ql-don-hang.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="order-container" style="color: #000; margin:100px 200px; font-size: 18px;">
            <asp:Button CssClass="btn-back" ID="btnBack" runat="server" Text="Trở về" OnClick="btnBack_Click" OnClientClick="return confirm('Bạn có chắc chắn muốn trở về không?');"/>
            <h1>Xin chào, <asp:Label ID="lblUsername" runat="server" Text="Label"></asp:Label></h1>
            <div class="main-data">
                <h2>QUẢN LÝ ĐƠN HÀNG</h2>
                <h2 style="margin-top:30px;">CHỜ DUYỆT</h2>
                <asp:Label ID="lblChoDuyet" runat="server" Text=""></asp:Label>
                <asp:GridView CssClass="gridview" ID="grdChoDuyet" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="grdChoDuyet_PageIndexChanging" PageSize="5">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaHD" HeaderText="Mã hóa đơn" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NgayHD" DataFormatString="{0:d}" HeaderText="Ngày hóa đơn" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
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
                                <asp:LinkButton ID="btnHuy" runat="server" CommandName="Update" OnClientClick="return confirm('Bạn có chắc chắn muốn hủy đơn hàng không?');" Text="Hủy đơn" CommandArgument='<%# Eval("MaHD") %>' OnClick="btnHuy_Click" ForeColor="Red"></asp:LinkButton>
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
                 <h2>ĐANG GIAO</h2>
                <asp:Label ID="lblDangGiao" runat="server" Text=""></asp:Label>
                <asp:GridView CssClass="gridview" ID="grdvDangGiao" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="grdvDangGiao_PageIndexChanging" PageSize="5">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaHD" HeaderText="Mã hóa đơn" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NgayHD" DataFormatString="{0:d}" HeaderText="Ngày hóa đơn" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField AccessibleHeaderText="TrangThai" DataField="TrangThai" HeaderText="Trạng thái" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                        </asp:BoundField>
                        
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="View" Text="Xem chi tiết" CommandArgument='<%# Eval("MaHD") %>' OnClick="btnXemChiTiet_Click" ForeColor="Blue"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                        </asp:TemplateField>

                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Update" OnClientClick="return confirm('Bạn có chắc chắn muốn hủy đơn hàng không?');" Text="Hủy đơn" CommandArgument='<%# Eval("MaHD") %>' OnClick="btnHuy_Click" ForeColor="Red"></asp:LinkButton>
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
            </div>
            <div class="sub-data">
                <h2>LỊCH SỬ MUA HÀNG - ĐÃ GIAO HOẶC ĐÃ HỦY</h2>
                <asp:Label ID="lblLichSu" runat="server" Text=""></asp:Label>
                <br />
                <asp:DropDownList ID="ddlTrangThai" runat="server" OnSelectedIndexChanged="ddlTrangThai_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                <asp:GridView CssClass="gridview" ID="grdDaGiaoDaHuy" runat="server" AutoGenerateColumns="False" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="grdDaGiaoDaHuy_PageIndexChanging" PageSize="5">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MaHD" HeaderText="Mã hóa đơn" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NgayHD" DataFormatString="{0:d}" HeaderText="Ngày hóa đơn" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField AccessibleHeaderText="TrangThai" DataField="TrangThai" HeaderText="Trạng thái" >
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                        </asp:BoundField>
                        
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="View" Text="Xem chi tiết" CommandArgument='<%# Eval("MaHD") %>' OnClick="btnXemChiTiet_Click" ForeColor="Blue"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnXoa" runat="server" CommandName="Delete" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa đơn hàng không?');" Text="Xóa đơn" CommandArgument='<%# Eval("MaHD") %>' OnClick="btnXoa_Click" ForeColor="Red"></asp:LinkButton>
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
            </div>
        </div>
</asp:Content>
