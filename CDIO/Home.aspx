<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CDIO.Home1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Trang chủ</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <div class="container-product container-product-second">
        <div class="container-product__title">
            <div class="grid wide">
                <div class="title_item">

                    <h1>SẢN PHẨM</h1>


                    <div class="">

                        <i class="fas fa-grip-lines"></i>
                        <i style="padding: 0 4px; color: var(--main-color);" class="far fa-clock"></i>
                        <i class="fas fa-grip-lines"></i>
                    </div>
                </div>
            </div>

        </div>
        <div class="container-product__list">
            <div class="grid wide">
                <div class="row">
                    <asp:Repeater ID="rpttranghome" runat="server">
                             <ItemTemplate>

                                <div class="col l-3 m-6 c-6">
                              <div class="container-product__item container-product__item-sc">
                                  <a href="Product-detail.aspx?MaSP=<%#Eval("MaSP") %> "">
                                      <button class="task-discount">- <%#Eval ("TyLeKM") %>%</button>
                                      <img src=".\assets\img\img_home\img_product\<%#Eval ("HinhAnh") %>" alt="">
                                      <div class=" product__item-detail-second">
                                          <h1 class="product-discount-title"><%#Eval ("TenSP") %></h1>
                                           <div class="price-product">
  
                                             
                                               <p class="product-discount-price"><%#Eval ("DonGia","{0:c0}") %></p>
                                           </div>
                                           
                                      </div>
                                     
                                  </a>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%-- <button class="product-discount-btn" style="transform:translateX(75%)">
                                   THÊM VÀO GIỎ
                                   
                               </button>--%><asp:LinkButton ID="LinkButton1" runat="server"  CssClass="product-discount-btn" style="transform: translateX(84%); width: 41%;padding: 6px 12px;"   OnClick="btnAddToCart_Click" CommandArgument=' <%# Eval ("MaSP") %>'> 
         

                          THÊM VÀO GIỎ  
                      </asp:LinkButton>
                                      
                              </div>
                             
                          </div>
                                    </ItemTemplate>
                             </asp:Repeater>


                   
 
    
    </div>
    </div>
    </div>
    </div>
</asp:Content>
