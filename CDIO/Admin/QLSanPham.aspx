<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QLSanPham.aspx.cs" Inherits="CDIO.Admin.QLSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>
        Quản lý sản phẩm
    </title>
    <link href="../assets/css/QLSanPham.css" rel="stylesheet" />
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <div class="container">
      <p class="tieu-de-trang">
        Danh Sách Sản Phẩm
    </p>
   
        <div class="text">
            <p> Tên Sản Phẩm: </p> 
            <asp:TextBox ID="tbTenSanPham" runat="server" style="margin-left:30px;"  ></asp:TextBox >
             <p style="margin-left:40px;">Danh Mục Sản Phẩm: </p>
            <asp:DropDownList ID="lddDanhMuc" runat="server" style="margin-left:15px;width:174px;"    ></asp:DropDownList>
        </div>
      
        <div class="text">
            <p> Giá nhập: </p>
            <asp:TextBox ID="tbGia" runat="server" style="margin-left:68px;margin-right:40px;"></asp:TextBox>
            <p> Giá xuất: </p>
            <asp:TextBox ID="tbGiaXuat" runat="server" style="margin-left:107px;"></asp:TextBox>
         
             
        </div>
        
        <div class="text">
    
        </div>
            <div class="text">
            <p> Số lượng </p>
        <asp:TextBox ID="tbsoluongton" runat="server" style="width:170px;margin-left:73px;"></asp:TextBox>

        </div>
           <div class="text">
            <p> Hình Ảnh</p>
            <asp:FileUpload ID="fulHinhAnh" runat="server" style="margin-left:67px;"  />
        </div>
        <div class="text">
            <p> Mô tả: </p>
            <asp:TextBox ID="tbMota" TextMode="MultiLine" runat="server" Rows="10" Columns="65" style="margin-left:90px;"   ></asp:TextBox>
        </div>
        <div style="margin-top:20px;">
            <asp:Literal ID="ltthongbao" runat="server"></asp:Literal>
            <asp:Button ID="btnthem" runat="server"  CssClass="btn_them" Text="Thêm" OnClick="btnthem_Click"  />
           
        </div>
    </div>

     <%--Xử lý table--%>    
     <table class="danh-sach-san-pham" style="text-align:center;font-weight:bold;">
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
                 <div class="text-td" style="text-align:center;">
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
            <td style="margin-left:20px;">
                <button class="btn_sua" ><a href="SuaSanPham.aspx?MaSP=<%# Eval("MaSP") %>" > Sửa</button>
                <asp:LinkButton ID="btnXoa" runat="server" CssClass="btn_xoa"  CommandName="Delete" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');" Text="Xóa đơn" CommandArgument='<%# Eval("MaSP") %>' OnClick="btnXoa_Click"></asp:LinkButton>

                 
            </td>
                 </div>
              
         </tr>
             </ItemTemplate>
         </asp:Repeater>
    
    </table>
</asp:Content>
