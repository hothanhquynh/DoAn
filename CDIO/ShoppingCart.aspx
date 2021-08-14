<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Product-detail.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="CDIO.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Giỏ hàng</title>
    <link href="assets/css/shopping-cart.css" rel="stylesheet" />
    <style>
        @media(min-width:740px) and (max-width:1024px) {
    
                     .shopping-cart-container{
            display:flex;
            flex-direction:column;

                     }

                         }


/* Mobile */

            @media (max-width:740px) {
      .shopping-cart-container{
            display:flex;
            flex-direction:column;

        }
      .checkout-preview{
          width:69%;
      }
      .lbgiohang{
          margin:0;
      }
      .nav-mobile{
          background-color:black;
      }
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <div class="shopping-cart-container">
        <div style="background-color: #fff; color: #000; font-size: 16px; width: 60%" class="cart-table">
            <asp:Label ID="lbgiohang" runat="server" CssClass="lbgiohang" Text="GIỎ HÀNG"></asp:Label>
            <br />
            <asp:Label ID="lblTotalAmount" runat="server" Text="Chưa có sản phẩm "></asp:Label>
            <div class="cart-view" style="margin:30px 20px;">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" ForeColor="Black" >
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
                        <asp:TemplateField HeaderText="Số Lượng">
                            <ItemTemplate>
                                <asp:TextBox ID="txtSoLuong" runat="server" Width="50px" Text='<%# Eval("SoLuong") %>'></asp:TextBox>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" >
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Xóa">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" CssClass="delete-btn btn" CommandName="Delete" Text="x" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm khỏi giỏ hàng không?');" CommandArgument='<%# Eval("MaSP") %>' OnClick="btnDelete_Click"/>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle CssClass="cart-view" Font-Size="Medium" />
                    <FooterStyle BorderStyle="Double" BorderWidth="5px" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:GridView>
            </div>
            <div class="container1" style="margin-left: 66%;">
                <asp:Button ID="btnUpdate" runat="server" Text="Cập nhật" CssClass="btn_update" OnClientClick="return confirm('Ban co muon cap nhat lai gio hang?')" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnBack" runat="server" Text="Tiếp tục mua" CssClass="btn_continue" OnClick="btnBack_Click" />
            </div>
        </div>
        <div class="checkout-preview" style="color: #000">
            <h2>Tóm tắt hóa đơn</h2>
            <p>Các tùy chọn vận chuyển có ở đặt hàng</p>
            <p style="font-weight: 600">Tổng:<span class="price"> <asp:Label ID="lblTotal" runat="server" Text="total"></asp:Label></span></p>
            <asp:Button ID="btnContinueToCheckout" runat="server" Text="TIẾN HÀNH ĐẶT HÀNG" CssClass="btn-checkout" OnClick="btnContinueToCheckout_Click"/>
        </div>
    </div>
</asp:Content>
