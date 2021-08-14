<%@ Page Title="" Language="C#" MasterPageFile="~/MasterCategory-Product.Master" AutoEventWireup="true" CodeBehind="Category_product.aspx.cs" Inherits="CDIO.Category_product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/grid.css" rel="stylesheet" />
    <title>Cửa Hàng</title>
   
       <style>
           .body{
             font-family: "Montserrat", sans-serif;
           }
           .page-title {
               color: gray;
               font-size: 20px;
               font-weight: bold;
               text-align:center;
           }
           .main-product{
               display:flex;
               align-items:center;
               flex-direction:column;
              width:80%;
              padding-bottom: 20px ;
             width:200px;
           
           
           }
        .main-product:hover{

                transform:translateY(-4px);
border-radius: 5px;
background: #e0e0e0;
box-shadow:  50px 50px 100px #d3d3d3,
             -50px -50px 100px #ededed;
            }

           .danh-sach-san-pham {
             
           }

           .san-pham {
               width: 25%;
            
           }

           .hinh-anh-san-pham {
           
           }

               .hinh-anh-san-pham img {
                   width: 100%;
               }

           .thong-tin-san-pham {
          
           }

           .ten-san-pham {
          
             
           }

               .ten-san-pham a {
                   color: red;
                   font-size: 15px;
                   font-weight: bold;
                   text-decoration: none;
                   color: #002F5F;
                   margin-top:1em;
               }

           .gia-san-pham {
               color: black;
               font-size: 15px;
            
            
               
           }
           .addcard{
               margin-top:1em;
                 
                font-size: 12px;
                font-weight:bold;
                background-color: #555555;
                color: white;
                
                border: none;
                cursor: pointer;
                z-index: 999;
                transform: translateX(50%);
    
           }
           .addcard a{
               text-decoration:none;
           }
           .dis-count{
                 background-color:var(--main-color);
                 color:white;
                 border:none;
             
                 position: relative;
                 top:43px;
                 right:60px;
                 font-weight: 600;
                 font-size:16px;
                 padding:16px 6px;
         
                 border-radius:2px;
 }
           .lb_show{
               color:#777777;
               font-size:16px ;
               font-family:"Montserrat", sans-serif;
               display:inline-block;
               margin:0 1em  0 auto;
           }
           .filter{
                
               width: 100%;
               max-height:100%;
               position:absolute;
               top:8%;
               left:830px;
               z-index:3;
           }
           .filter_cbx{
               /*font-size:13px;
               margin:0px 30px;
               border:solid 1px gray;*/
           
               display:inline-block;
               border:solid 1px rgba(102,102,102,0.7);
           }
           .filter_cbx_list{
               font-size:15px;
               color:rgba(102,102,102,0.7);
               font-weight:600;
           }
           .content_filter{
             
           }
           
           .auto-style1 {
               font-size: 15px;
               color: rgba(102,102,102,0.7);
               font-weight: 600;
               margin-top: 0;
           }
           .next-pages{
               text-align:center;
               display:flex;
               justify-content:center;
               align-items:center;

           }
           .pages-item{
               
           }
           .pages-item a{
               color:#BBA495;
               display:block;
               font-size: 16px;
               font-weight:bold;
                  width:32px;
               height:31px;
               border-radius:24px;
               margin:40px 4px;
               background-color:#FFFFFF;
               text-align:center;
               border:solid 2px #333;
           
               padding-top:4px;
           }
           .pages-item a:hover{
               background-color:#555555;
               color:#fff;
           }
           .item-active a{
               background-color:#555555;
               color:#fff;
           }
           .pages-item i{
                color:#959595;
               font-size: 16px;
           }
           @media(min-width:740px) and (max-width:1024px) {
    
   .filter{
       transform:translateX(-448px);
   }
    .main-product {
     position:relative;
     right:-44px;

}

}


/* Mobile */

@media (max-width:740px) {
   .main-product {
     position:relative;
     right:44px;

}
   .row-mobile:nth-child(2n+1){
       position:relative;
     right:60px;
   }
}

           
       </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!--Content-->
        <div class="content">
            <div class="content_filter">
            <div class="filter">
               
            <asp:Label ID="Label1" runat="server" Text="Hiển thị một kết quả duy nhất" CssClass="lb_show"></asp:Label>
        
                <div class="filter_cbx">
                
                <asp:DropDownList ID="DropDownList1" CssClass="auto-style1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Height="30px">
                <asp:ListItem Value="0">Mặc định</asp:ListItem>
                <asp:ListItem Value="1">Mới Nhất</asp:ListItem>
                <asp:ListItem Value="2">Thứ tự theo giá: Thấp đến cao</asp:ListItem>
                <asp:ListItem Value="3">Thứ tự theo giá: Cao xuống thấp</asp:ListItem>
                </asp:DropDownList>
                    </div>
           </div>
                </div>

            <div class="danh-sach-san-pham">


          <div class="grid wide">
              <div class="row" style="margin:110px 100px 0 0">
                
                        <asp:Repeater ID="rptDanhSachSanPham" runat="server" >
                         <ItemTemplate>
                <!-- Sản phẩm 1-->
             
                    <!--Thông tin sản phẩm -->
                  
                               <div class="col c-6 m-4 l-3  row-mobile"> 
                                  <div class="main-product">
                                 
                                      
                                         <button class="dis-count"> - <%# Eval ("TyLeKM") %> % </button>
                        <a href="Product-detail.aspx?MASP=<%#Eval ("MaSP") %>">
                        <!-- Hình ảnh sản phẩm -->
                        <div class="hinh-anh-san-pham">
                             <img style="-webkit-animation:slide-fwd-center .45s cubic-bezier(.25,.46,.45,.94) both;animation:slide-fwd-center .45s cubic-bezier(.25,.46,.45,.94) both" src=".\assets\img\img_home\img_product\<%#Eval ("HinhAnh") %>" alt="" >
                        </div>
                        <!--Tên sản phẩm-->
                        <p style="text-align:center" class="ten-san-pham">
                            <a href="Product-detail.aspx?MaSP=<%#Eval("MaSP") %> "> <%#Eval("TenSP") %></a>
                        </p>
                        <!-- Giá sản phẩm -->
                        <p style="text-align:center" class="gia-san-pham">
                            <b>Giá</b>:<%#Eval("DonGia","{0:c0}") %></p>
                      
                      <asp:LinkButton ID="LinkButton1" runat="server"   CssClass="addcard" style="padding-top:8px;transform: translateX(1px); width:122px;height:30px;text-align:center"  OnClick="btnAddToCart_Click" CommandArgument=' <%# Eval ("MaSP") %>'> 
         

                          THÊM VÀO GIỎ  
                      </asp:LinkButton>
                                  </div>

                            
                               </div>
                   


                    

              
                
                          <%-- <asp:LinkButton ID="LinkButton1" runat="server"  CommandName="MyUpdate">LinkButton</asp:LinkButton>--%>


            </ItemTemplate>
        </asp:Repeater>
                   
              </div>
          </div>

        
              
           


    </div>
                  
        </div>
</asp:Content>
