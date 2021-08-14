<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Product-detail.Master" AutoEventWireup="true" CodeBehind="Product-detail.aspx.cs" Inherits="CDIO.Product_detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>
        Trang chi tiết sản phẩm
    </title>
    <link href="../assets/fonts/fontawesome-free-5.14.0/css/all.min.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/c52f7154f4.js" crossorigin="anonymous"></script>
 
    <style>
        /* Basic Styling */
html, body {
    height: 100%;
    width: 100%;
    margin: 0;
    font-family: 'Roboto', sans-serif;
}
.danhgia {
    margin-top:20px;
    color:black;
}
.title_danhgia {
    line-height: 1.4;
    font-size: 20px;
    color:black;
    font-weight:bold;
}
.btn_danhgia {
    margin-right: 12px;
    border: none;
    border-radius: 20px;
    cursor: pointer;
}
.tendanhgia {
    font-weight: bold;
    margin-right: 8px;
    text-transform: capitalize;
    color:black;
}
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 15px;
    display: flex;
   
}
/* Columns */
.left-column {
    width: 65%;
    position: relative;
}

.right-column {
    width: 100%;
    margin-top: 15%;
}
/* Left Column */
.left-column img {
    width: 70%;
    position: absolute;
    left: 0;
    top: 20%;
    opacity: 1;
    transition: all 0.3s ease;
}

    .left-column img.active {
        opacity: 1;
    }
/* Product Description */
.product-description {
    border-bottom: 1px solid #E1E8EE;
    margin-bottom: 20px;
}

    .product-description span {
        font-size: 3em;
        color: #555555;
        letter-spacing: 1px;
        text-transform: uppercase;
        text-decoration: none;
        font-weight:800;
    }

    .product-description h1 {
        font-weight: 300;
        font-size: 52px;
        color: #43484D;
        letter-spacing: -2px;
    }

    .product-description p {
        font-size: 16px;
        font-weight: 300;
        color: #86939E;
        line-height: 24px;
    }
/* Product Color */
.product-color {
    margin-bottom: 30px;
}

.color-choose div {
    display: inline-block;
}

.color-choose input[type="radio"] {
    display: none;
}

    .color-choose input[type="radio"] + label span {
        display: inline-block;
        width: 40px;
        height: 40px;
        margin: -1px 4px 0 0;
        vertical-align: middle;
        cursor: pointer;
        border-radius: 50%;
    }

    .color-choose input[type="radio"] + label span {
        border: 2px solid #FFFFFF;
        box-shadow: 0 1px 3px 0 rgba(0,0,0,0.33);
    }

    .color-choose input[type="radio"]#red + label span {
        background-color: #C91524;
    }

    .color-choose input[type="radio"]#blue + label span {
        background-color: #314780;
    }

    .color-choose input[type="radio"]#black + label span {
        background-color: #323232;
    }

    .color-choose input[type="radio"]:checked + label span {
        background-image: url(images/check-icn.svg);
        background-repeat: no-repeat;
        background-position: center;
    }
/* Cable Configuration */
.cable-choose {
    margin-bottom: 20px;
}

    .cable-choose button {
        border: 2px solid #E1E8EE;
        border-radius: 6px;
        padding: 13px 20px;
        font-size: 14px;
        color: #5E6977;
        background-color: #fff;
        cursor: pointer;
        transition: all .5s;
    }

        .cable-choose button:hover,
        .cable-choose button:active,
        .cable-choose button:focus {
            border: 2px solid #86939E;
            outline: none;
        }

.cable-config {
    border-bottom: 1px solid #E1E8EE;
    margin-bottom: 20px;
}

    .cable-config a {
        color: #358ED7;
        text-decoration: none;
        font-size: 12px;
        position: relative;
        margin: 10px 0;
        display: inline-block;
    }

        .cable-config a:before {
            content: "?";
            height: 15px;
            width: 15px;
            border-radius: 50%;
            border: 2px solid rgba(53, 142, 215, 0.5);
            display: inline-block;
            text-align: center;
            line-height: 16px;
            opacity: 0.5;
            margin-right: 5px;
        }
/* Product Price */
.product-price {
    display: flex;
    align-items: center;
}

    .product-price span {
        font-size: 24px;
        font-weight: 300;
        color: #43474D;
        margin-right: 20px;
    }

.cart-btn {
    display: inline-block;
    background-color: #7DC855;
    border-radius: 6px;
    font-size: 16px;
    color: #FFFFFF;
    text-decoration: none;
    padding: 12px 30px;
    transition: all .5s;
}

    
/* Responsive */
@media (max-width: 940px) {
    .container {
        flex-direction: column;
        margin-top: 60px;
        
    }

    .left-column,
    .right-column {
        width: 100%;
    }

        .left-column img {
            width: 300px;
            right: 0;
            top: -65px;
            left: initial;
        }
}

@media (max-width: 535px) {
    .left-column img {
        width: 220px;
        top: -85px;
    }
}
#discount{
    animation: zoom linear 2s infinite;
}
@keyframes zoom{
    from{
        transform: scale(0);
    }to{transform:scale(1)}
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1 style="text-align:center;">Xem Chi Tiết Sản Phẩm</h1>
     <main class="container" style=" height: 100%;background: white;width:100%;">
       
  
  <!-- Left Column / Headphones Image -->
          
  <div class="left-column">
   
   <%-- <img data-image="black" src="../assets/img/img_home/img_product/ba-110pp-7adr-01.png" >
    <img data-image="blue" src="../assets/img/img_home/img_product/ga-1100-2bdr-01.png"  alt="">
    <img data-image="red" class="active" src= "../assets/img/img_home/img_product/ga-1000-4adr-01.png"alt="">--%>
       <asp:Image ID="imgsanpham1" runat="server" />
     
  </div>
      
  <!-- Right Column -->
  <div class="right-column" style="top:10%;">
  
    <!-- Product Description -->
    <div class="product-description">
      <span>
          <asp:Literal ID="ltTenSanPham1" runat="server" ></asp:Literal>
      </span>
      <h1>  <%# Eval("TenHang") %>    </h1>
       
       <div class="product-price">
           <span>
               <%--<asp:Literal ID="ltgia1" runat="server"> </asp:Literal>- --%>
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
           </span>
           <span style="color:red;font-weight:bold;" id="discount">-<asp:Literal ID="ltkm1" runat="server"> </asp:Literal>%</span>
       </div>
      <p style="line-height: 35px;text-align: justify;margin: 10px 0px;">
         
              <%--<li style="line-height: 35px;text-align: justify;margin: 10px 0px;">
                  <asp:Literal ID="Ltmota1" runat="server"></asp:Literal>
              </li>--%>
        
            <asp:Literal ID="Ltmota1" runat="server"></asp:Literal>
      </p>
    </div>
  
    <!-- Product Configuration -->
    <div class="product-configuration">
  
     
            <asp:Label ID="state_product" runat="server" style="color:#219653; font-weight:bold;font-size:20px;"></asp:Label>
          <div class="cable-config">
          <a href="#">Hướng dẫn sử dụng</a>
              </div>
    <!-- Product Pricing -->
    <div class="product-price">
      
      
           <asp:Button ID="Button1" runat="server" Text="Thêm Vào Giỏ Hàng" CssClass="cart-btn"  style="margin-right:12px;border: none; border-radius: 20px;cursor:pointer;"  OnClick="btnAddToCart_Click"/>
    </div>
        
  </div>
      <div class="danhgia">
             <span class="title_danhgia">Đánh giá </span><asp:Label ID="tensp" runat="server" CssClass="title_danhgia"></asp:Label>
            <div><asp:Button ID="btn_danhgia" runat="server" Text="Viết đánh giá" style="border: 1px solid #2f80ed;border-radius: 4px;color: #2f80ed;display: block;line-height: 17px;margin-left: 3%;padding: 11px 5px;text-align: center;width: 48.5%;margin: 20px 0px;font-size: 15px;cursor:pointer" OnClick="btn_danhgia_Click"/></div>
          <asp:Repeater ID="rptDanhgia" runat="server">
              <ItemTemplate>
                  <div style="line-height:30px;border-bottom: solid 1px #e6dede;padding-bottom: 10px;">
                      <div style="display:flex">
                      <p class="tendanhgia"><%#Eval("TEN") %></p><i class="fas fa-check-circle" style="color: #2ba832;transform: translateY(8px);"> Đã mua tại M-Watch</i>
                        </div>
                    <div style="display:flex;font-size: 14px;line-height: 20px;"><p><b>Số sao đánh giá: </b><%#Eval("SOSAO") %></p><i class="fas fa-star" style="color:orange;transform: translate(10px, 3px);"></i></div>
                    <div style="font-size: 14px;line-height: 20px;"><p><%#Eval("NOIDUNG") %></p></div>
                  </div>
                  
                  
                  
              </ItemTemplate>
          </asp:Repeater>
         </div>
      </div>
         
</main>
    
     <script src="jquery.js"></script>

     <script type="text/javascript">
          $(document).ready(function() {
  
  $('.color-choose input').on('click', function() {
      var headphonesColor = $(this).attr('data-image');
  
      $('.active').removeClass('active');
      $('.left-column img[data-image = ' + headphonesColor + ']').addClass('active');
      $(this).addClass('active');
  });
  
});
      </script>
</asp:Content>

