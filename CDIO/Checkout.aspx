<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Product-detail.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="CDIO.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/shopping-cart.css" rel="stylesheet" />
    <link href="assets/css/Checkout.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="shopping-cart-container">
        <div style="background-color: #fff; color: #000; font-size: 16px; width: 60%;transform: translateX(160px);" class="cart-table">
            <asp:Label ID="lbgiohang" runat="server" CssClass="lbgiohang" Text="ĐẶT HÀNG" style="margin-left: 34%;"></asp:Label>
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
                              
                                <asp:Label ID="txtSoLuong" runat="server" Width="50px" Text='<%# Eval("SoLuong") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" >
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                        </asp:BoundField>
                       
                    </Columns>
                   
                    <FooterStyle BorderStyle="Double" BorderWidth="5px" Height="50px" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:GridView>
            </div>
          
        </div>
     
    </div>
    <div class="checkout_content">
        <div  class="content" style="width: 44%;">
                 <p>Tên người nhận hàng</p>
              <asp:TextBox ID="txthoten" runat="server" CssClass="input-login" required></asp:TextBox>

           
            </div>
            <div   class="content"  style="width: 44%;">
                  <p>Địa chỉ giao hàng</p>
                      <asp:TextBox ID="txtdiachi" runat="server" CssClass="input-login" required></asp:TextBox>
                      
                 </div>
             <div   class="content"  style="width: 44%;">
                     <p>Số điện thoại</p>
                 <asp:TextBox ID="sdt" runat="server" CssClass="input-login" required></asp:TextBox>
                 
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Nhập đủ 10 số" Font-Size="Larger" Font-Italic="True" ControlToValidate="sdt" ValidationExpression="\d{10}" Display="Dynamic" ForeColor="Red" style="transform: translateY(18px);font-weight: 600;"></asp:RegularExpressionValidator>
                 
            </div>
    </div>
       <div class="btn-submit" style="margin-bottom:30px;">
                    <asp:Button ID="btn_dathang" runat="server" Text="ĐẶT HÀNG" CssClass="btn-dathang" OnClick="btn_dathang_Click"/>
                
                 <br />
 </div>
</asp:Content>
