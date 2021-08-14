<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SuaSanPham.aspx.cs" Inherits="CDIO.Admin.SuaSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <link href="../assets/css/QLSanPham.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


      <div class="container">
      <p class="tieu-de-trang">
        Danh Sách Sản Phẩm
    </p>
   
        <div class="text">
            <p> Tên Sản Phẩm: </p> 
            <asp:TextBox ID="tbTenSanPham1" runat="server" style="margin-left:30px;"  ></asp:TextBox >
             <p style="margin-left:40px;">Danh Mục Sản Phẩm: </p>
            <asp:DropDownList ID="lddDanhMuc1" runat="server" style="margin-left:15px;width:174px;"    ></asp:DropDownList>
        </div>
      
        <div class="text">
            <p> Giá nhập: </p>
            <asp:TextBox ID="tbGia1" runat="server" style="margin-left:68px;margin-right:40px;"></asp:TextBox>
            <p> Giá xuất: </p>
            <asp:TextBox ID="tbGiaXuat1" runat="server" style="margin-left:107px;"></asp:TextBox>
         
             
        </div>
        
        <div class="text">
    
        </div>
            <div class="text">
            <p> Số lượng </p>
        <asp:TextBox ID="tbsoluongton1" runat="server" style="width:170px;margin-left:73px;"></asp:TextBox>

        </div>
           <div class="text">
            <p> Hình Ảnh</p>
            <asp:FileUpload ID="fulHinhAnh1" runat="server" style="margin-left:67px;"  />
        </div>
        <div class="text">
            <p> Mô tả: </p>
            <asp:TextBox ID="tbMota1" TextMode="MultiLine" runat="server" Rows="10" Columns="65" style="margin-left:90px;"   ></asp:TextBox>
        </div>
        <%--<div style="margin-top:20px;">
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <asp:Button ID="btnsua" runat="server"  CssClass="btn_sua" Text="Thêm" OnClick="btnSua_Click"  />
           
        </div>--%>
    </div>
        <div style="margin-top:20px;margin-left:40%;">
            <asp:Literal ID="ltthongbao" runat="server"></asp:Literal>
            <asp:Button ID="btn_sua" runat="server" Text="Sửa" CssClass="btn_sua" OnClick= " btnSua_Click"     onclientclick="return confirm('Bạn có chắc muốn cập nhật không?');" />
             <asp:Button ID="btn_refest" runat="server" Text="Làm mới" CssClass="btn_sua" style="margin-left:20px;"  PostBackUrl="~/Admin/QLSanPham.aspx" />
            
            
           
        </div>



    <table class="danh-sach-san-pham">
        <tr>
            <th>Hình ảnh</th>
            <th>Mã sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Danh mục</th>
            <th>Giá</th>
            <th>Số lượng tồn</th>
             <th>Tỷ lệ khuyến mãi</th>
            <th>Chức năng</th>
         
        
        </tr>
         <asp:Repeater ID="rptdssp" runat="server">
             <ItemTemplate>
             <tr>
             <td style="width: 60px; text-align: center">
                 <img src="../assets/img/img_home/img_product/<%#Eval ("HinhAnh") %>"  style="width:50px;"/>
             </td>
                 <div class="text-td">
              <td >
                 <%#Eval ("MaSP")  %>
             </td>
             <td >
                 <%#Eval ("TenSP")  %>
             </td>
             <td >
                 <%#Eval  ("TenHang") %>
             </td>
             <td>
                 <%#Eval  ("DonGia", "{0:c0}") %> 
             </td>
             <td>
                 <%#Eval  ("SoLuongTon") %> 
             </td>
             <td style="color:red;">
                 <%#Eval  ("TyLeKM") %> %
             </td>
             <%--<td>
                 <%# Eval ("MoTa") %>
             </td>--%>
            <td>
                <button class="btn_sua"><a href="SuaSanPham.aspx?MaSP=<%# Eval("MaSP") %>" >Sửa</button>

                 
            </td>
                 </div>
              
         </tr>
             </ItemTemplate>
         </asp:Repeater>
    
    </table>
</asp:Content>
