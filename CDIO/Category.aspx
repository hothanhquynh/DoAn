<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="CDIO.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Trang danh mục sản phẩm </title>
    <link href="../assets/css/grid.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    
    <link href="../assets/fonts/fontawesome-free-5.14.0/css/all.min.css" rel="stylesheet" />
<%--    <link href="../assets/css/main.css" rel="stylesheet" />--%>
    <link href="assets/css/main.css" rel="stylesheet" />
    <link href="../assets/css/base.css" rel="stylesheet" />
    <link href="../assets/css/slide.css" rel="stylesheet" />
    <link href="../assets/css/responsive.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">  
    <style>
        body{
           font-family:"Montserrat", sans-serif;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <!-- Product-discount -->
    
          <div class="container-product container-product-second">
              <div class="container-product__title">
                  <div class="grid wide">
                      <div class="title_item">
  
                          <h1 >DANH SÁCH SẢN PHẨM </h1>
      
                     
                             <div class="">
                                 
                                 <i class="fas fa-grip-lines"></i>
                                 <i style = "padding: 0 4px; color:var(--main-color);"class="far fa-clock"></i>
                                 <i class="fas fa-grip-lines"></i>
                             </div>
                      </div>
                  </div>
  
              </div>
              <div class="container-product__list">
                     <div class="grid wide">
                         <div class="row">
                            <%-- Xử lý Database ở đây --%>
                        
                        <asp:repeater ID="rptdmsp" runat="server">
                             <ItemTemplate>

                                <div class="col l-3 m-6 c-6" style="padding-top:62px;">
                                <div class="container-product__item container-product__item-sc">
                                   <a href="Product-detail.aspx?MaSP=<%#Eval("MaSP") %> ">
                                   
                                     <%-- <button class="task-discount">  </button>--%>
                                      
                                      <img src=".\assets\img\img_home\img_product\<%#Eval ("HinhAnh") %>" alt="" >
                                      <div class=" product__item-detail-second">
                                          <h1 class="product-discount-title"><%#Eval ("TenSP") %></h1>
                                           <div class="price-product">
  
                                               <p class="product-discount-price-none"></p>
                                               <p class="product-discount-price">Đơn giá: <%#Eval ("DonGia","{0:c0}")%> </p>
                                              
                                           </div>
                                         
                                          
                                      </div>
                                       <div style="display:flex;">
                                        <p style="padding-top:10px;padding-left:65px;">Tỷ lệ khuyến mãi: </p>
                                       <p style="padding-top:10px;padding-left:5px; color:red;font-weight:bold;"><%# Eval ("TyLeKM") %>%</p>
                                     
                                         </div>
                                     
                                       
                                                
                                    
                                  </a>
                                <%--  <button class="product-discount-btn">
                                   THÊM VÀO GIỎ
                                   
                               </button>--%>
                                      
                              </div>
                             
                          </div>

                                      </ItemTemplate>
                            </asp:repeater>



                           <%--  Không quan tâm--%>
                             
                       <%--      <div class="col l-3 m-6 c-6">
                              <div class="container-product__item container-product__item-sc">
                                  <a href="#">
                                      <button class="task-discount"> -22% </button>
                                      <img src=".\assets\img\img_home\img_product\ga-1100-2bdr-01.png" alt="">
                                      <div class=" product__item-detail-second">
                                          <h1 class="product-discount-title">BA-110PP-7ADR</h1>
                                           <div class="price-product">
  
                                               <p class="product-discount-price-none">4,230,000 đ</p>
                                               <p class="product-discount-price">3,299,000 đ</p>
                                           </div>
                                           
                                      </div>
                                     
                                  </a>
                                  <button class="product-discount-btn">
                                   THÊM VÀO GIỎ
                                   
                               </button>
                                      
                              </div>
                             
                          </div>
                          <div class="col l-3 m-6 c-6">
                              <div class="container-product__item container-product__item-sc">
                                  <a href="#">
                                      <button class="task-discount"> -21% </button>
                                      <img src=".\assets\img\img_home\img_product\ga-1100sc-3adr-01.png" alt="">
                                      <div class=" product__item-detail-second">
                                          <h1 class="product-discount-title">EF-359D-7BDR</h1>
                                           <div class="price-product">
  
                                               <p class="product-discount-price-none">4,724,000 đ</p>
                                               <p class="product-discount-price">3,699,000 đ</p>
                                           </div>
                                           
                                      </div>
                                     
                                  </a>
                                  <button class="product-discount-btn">
                                   THÊM VÀO GIỎ
                                   
                               </button>
                                      
                              </div>
                             
                          </div>
                          <div class="col l-3 m-6 c-6">
                              <div class="container-product__item container-product__item-sc">
                                  <a href="#">
                                      <button class="task-discount"> -36% </button>
                                      <img src=".\assets\img\img_home\img_product\gg-1000rg-1adr-01.png" alt="">
                                      <div class=" product__item-detail-second">
                                          <h1 class="product-discount-title">GA-100BL-7BDR</h1>
                                           <div class="price-product">
  
                                               <p class="product-discount-price-none">8,324,000 đ</p>
                                               <p class="product-discount-price">5,299,000 đ</p>
                                           </div>
                                           
                                      </div>
                                     
                                  </a>
                                  <button class="product-discount-btn">
                                   THÊM VÀO GIỎ
                                   
                               </button>
                                      
                              </div>
                             
                          </div>
                           
                            --%>
                             
                         </div>
                     </div>
             </div>
  
         </div>
    
  
</asp:Content>
