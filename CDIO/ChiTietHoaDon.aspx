<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Product-detail.Master" AutoEventWireup="true" CodeBehind="ChiTietHoaDon.aspx.cs" Inherits="CDIO.ChiTietHoaDon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/ql-don-hang.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="chi-tiet-dh-container" style="margin: 120px 10%;text-align:center">
        <h1>Chi tiết hóa đơn: <asp:Label ID="lblMaHD" runat="server" Text="Label"></asp:Label></h1>
        <asp:GridView CssClass="gridview" ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" ForeColor="#333333" Font-Size="18px" AllowPaging="True" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" PageSize="5" CellPadding="4" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:ImageField DataImageUrlField="HinhAnh" DataImageUrlFormatString="~/assets/img/img_home/img_product/{0}" HeaderText="Hình ảnh" ControlStyle-Width="100px">
                    <ControlStyle Width="100px" Height="100px"></ControlStyle>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="175px" />
                </asp:ImageField>
                <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="TyLeKM" DataFormatString="{0} %" HeaderText="Tỷ Lệ KM">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BorderStyle="Double" BorderWidth="5px" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#990000" Font-Bold="True" ForeColor="White" />
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
    <div class="chitiet_content">
        <div  class="content" style="width: 44%;">
                 <p>Tên người nhận hàng</p>
              <asp:TextBox ID="txthoten" runat="server" CssClass="input-login" ReadOnly="True"></asp:TextBox>

           
            </div>
            <div   class="content"  style="width: 44%;">
                  <p>Địa chỉ giao hàng</p>
                      <asp:TextBox ID="txtdiachi" runat="server" CssClass="input-login" ReadOnly="True"></asp:TextBox>
                      
                 </div>
             <div   class="content"  style="width: 44%;">
                     <p>Số điện thoại</p>
                 <asp:TextBox ID="sdt" runat="server" CssClass="input-login" ReadOnly="True"></asp:TextBox>         
            </div>
    </div>
       <div class="btn-chitiet" style="margin-bottom:30px;">
                    <asp:Button ID="btn_trove" runat="server" Text="Quay về" CssClass="btn_trove" OnClick="btn_trove_Click"/>
       </div>
</asp:Content>
