<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user-info.aspx.cs" Inherits="CDIO.user_info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tài khoản cá nhân</title>
    
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-5.14.0/css/all.min.css ">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/slide.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">  

    
   
    <link rel="stylesheet" href="./assets/css/user.css">

</head>
     <style>
        tbody
        {
            transform:translate(196px,30px);
        }
        .sex{
                margin: -33px 119px;
                        
        }
        #btnsave{
            text-align:center;
            float:right;
            padding:10px 40px; 
              width:10px;
        }
        #doimk{
             
               padding:10px 80px;
               margin:20px;
                text-align:center;
       
               font-size:18px;
               border-radius:20px;
        }
    
       .sub-user {
     padding: 5px 28px; 
    font-size: 13px;
    border-radius: 20px;
    color: #fff;
    text-align:center;
    font-weight: 600;
    background-color: #DD3324;
    border:none;
    cursor:pointer;
    
}
       .container-user .list-right .form-profile div button {
  
    width:20px;
    outline: none;
    font-weight: normal;
    font-size: 18px;
}
       .container-user .list-right {
    width: 100%;
    padding: 10px 0;
    max-height: 100%;
    padding-bottom: 20px;
    text-align: center;
    background-color: #fff;
}
       .container-user .list-right p {
    
    text-align: left;
    transform: translate(120px,28px);

}
       .list-right{
           text-align:right;
        
       }
       .form-profile{
           transform:translateX(40px);
       }
    </style>
<body>
      
    <form id="form1" runat="server">
    <div class="app app-user-info" >
        <header style="z-index: 1000000;" class="header" >               
            <div class="grid wide">
                <div class="row row-header">              
                        <div class="header-item-left">
                            <div class="header-item-left-child header-item__icon">
                                    <ul class="header-left-icon">
                                        <li class="header-left-icon__item">
                                            <a href="https://www.facebook.com/qyn.qyn.3979" class="header-left-icon__item__link">
                                                <i class="fab fa-facebook-f"></i>
                                            </a>
                                        </li>
                                        <li class="header-left-icon__item">
                                            <a href="https://www.facebook.com/qyn.qyn.3979" class="header-left-icon__item__link">
                                                <i class="fab fa-instagram"></i>    
                                            </a>
                                        </li>
                                        <li class="header-left-icon__item">
                                            <a href="https://www.facebook.com/qyn.qyn.3979" class="header-left-icon__item__link">
                                                <i class="fab fa-youtube"></i>
                                            </a>
                                        </li>
                                    </ul>
                            </div>
                            <div class="header-item-left-child header-item__address">
                                <i class="fas fa-home"></i>
    
                                       <p > SHOP: 319 - C16 Lý Thường Kiệt, P.15, Q.11, Tp.HCM
                                        </p>
                            </div>
                        </div>
    
                        <div class="header-item-right">
                            <div class="header-item-right-child header-item__call">
                                <i class="fas fa-phone-volume"></i>
                                <p>HOTLINE: 076 922 0162</p>
    
    
                            </div>
                            <div style="margin-left:40px"  for="input-login__checked" class="header-item-right-child header-item__signup">
                              <asp:LinkButton ID="signin_user" runat="server" PostBackUrl="~/Login.aspx">ĐĂNG NHẬP</asp:LinkButton>
                            <asp:LinkButton ID="hello_user" runat="server" Visible="False" PostBackUrl="~/user-info.aspx">
                                  <asp:Label ID="lbl_hello_user" runat="server"></asp:Label></asp:LinkButton>
                          </div>
                          &emsp;
                                <span ></span>
                          <div  for="input-login__checked" class="header-item-right-child header-item__signup">
                              <asp:LinkButton ID="signup_user" runat="server" PostBackUrl="~/Signup.aspx">ĐĂNG KÝ</asp:LinkButton>
                          
                            
                        </div>
                     
                      </div>
                  
              </div>
          </div>
        </header>
       <%-- <div  class="container">
            <div class="slider">
                <div class="grid wide">
                        <div class="row row-max">
                        <div class="slideshow-container">
                             <!-- nav__mobile -->
                            <header class="header-mobile">
                                <nav class="nav-mobile">
    
                                    <label for="input__nav-mobile" >
                                        <i class="fas fa-bars"></i>
                                    </label>   
                                    <a href="#">
                                        <img style="width: 180px ; height:49px" src="./assets/img/logo-footer.png" alt="">
                                    </a>
                                    <a href="">
                                        <i class="fas fa-shopping-cart"></i>
                                    </a>
                               
                                </nav>
                                <input class="input__checkbox"  hidden="true" type="checkbox"  id="input__nav-mobile">
                                <label for="input__nav-mobile" class="nav-overlay"></label>
                                <nav class="category-mobile">
                                    <label for="input__nav-mobile">
                                        <i class="fas fa-times"></i>
                                    </label>
                                 
                                    <img style="margin:8px 60px;width: 140px; height:40px; text-align: center;"src="./assets/img/logo-mwatch-02 (1).png" alt="">
                                 
                                    <a href="#" class="">Trang Chủ</a>
                                    <a href="#" class="">Giới Thiệu</a>
                                    <a href="#" class="">Shop</a>
                                    <a href="#" class="">Tin Tức</a>
                                    <a href="#" class="">Liên hệ</a>
                                    <a href="#" class="">Đăng Nhập / Đăng Kí</a>
                                    <div >
                                        <a href="facebook.com" class="">
                                            <i class="fab fa-facebook"></i>
                                        </a>
                                        <a href="instagram.com" class="">
                                            <i class="fab fa-instagram"></i>
                                        </a>
                                        <a href="youtube.com" class="">
                                            <i class="fab fa-youtube"></i>
                                        </a>
                                     </div>
                                    
                                </nav>
                                  
                               
    
                            </header>
                         
    
                                 <!-- end nav__mobile -->
                            <nav class="container-header " id="navbar1">
                                <script>
                                    window.onscroll = () => {
                                        const nav = document.querySelector('#navbar1');
                                        if(this.scrollY <= 10) nav.className = 'scroll1';
                                        
                                        else
                                        
                                        nav.className = 'scroll';
                                      };
                                </script>
                               <div class="container-header-list container-header__left" >
                                
                                   <a   href="./index.htm" class="header-list__item header__left__item">TRANG CHỦ</a>
                                   <a href="./gioi-thieu.htm" class="header-list__item header__left__item">GIỚI THIỆU</a>
    
                                    <div class="shop-extend">
                                        <a href="" class="header-list__item header__left__item just-one">SHOP
                                            <i class="fas fa-angle-down"></i>
                                        </a>
    
                                        <ul class="dropdown-nav">
                                            <li><a href="">Aviator</a></li>
                                            <li><a href="">Baby-G &amp; Fencing</a></li>
                                            <li><a href="">Edifice</a></li>
                                            <li><a href="">G-Shock</a></li>
                                        </ul>
                                    </div>
         
    
    
                                   <a href="" class="header-list__item header__left__item header-tablet">TIN TỨC</a>
    
                                   <a href="./lien-he.htm" class="header-list__item header__left__item">LIÊN HỆ</a>
                               </div>
                               <div class="container-header-list container-header__mid">
                                   <div class="icon">
                                       <img style ="width:200px; height:52px ; " src="./assets/img/logo-footer.png" alt="">
                                   </div>
                               </div>
                               <div class="container-header-list container-header__right">
                                       
                                  <form class="search-form">
  
                                      <div class="pseudo-search">
                                        <input type="text" placeholder="Search..." autofocus required>                                     
                                        <button class="fa fa-search" type="submit"></button>
                                      </div>
                                    
                                    </form>
                                          <div class="cart">
                                              <a href="">
                                                <p>GIỎ HÀNG</p>
    
                                            
                                                <i class="fas fa-shopping-cart">
                                               
                                                </i>
                                              </a>
                       
                                          
                                            
                                        </div>
                               </div>
                         </nav>
                        </div>
                        </div>
                        </div>
                        </div>
        </div>--%>

        
    <div class="container-user" style="margin:40px 0;z-index:100000000000000000000000000">
        <div class="grid wide">
            <div class="row">
                <div class="col l-2 m-3 c-3">
                        <div class="list-left">
                                <ul class="list-left__item">
                                    <li >
                                        <span href="#" class="none-hover">
                                            <i style="font-size:50px" class="fas fa-user-circle"></i>
                                            <p style="margin: 20px 10px;font-weight:bold;" class="title-item">
                                                <asp:Label ID="name" runat="server" ></asp:Label>
                                            </p>
                                        </span>
                                    </li>
                                           <li >
                                        <a href="Home.aspx" class="">
                                           <i style="color:#F783AC" class="fas fa-home"></i>
                                            <p class="title-item">
                                                Trang Chủ
                                            </p>
                                        </a>
                                    </li>
                                    <li >
                                        <a href="#" class="">
                                            <i style="color:#dda704;" class="fas fa-user-tie"></i>
                                            <p class="title-item">
                                                Tài Khoản Của Tôi
                                            </p>
                                        </a>
                                    </li>
                                    <li >
                                        <a href="./DonMua.aspx" class="">
                                            <i style="color:#44B5FF" class="far fa-sticky-note"></i>
                                            <p class="title-item">
                                                Đơn Mua
                                            </p>
                                        </a>
                                    </li>
                                
                                    <li style="margin-top:20px;">
                                       <%-- <a href="#" class="">--%>
                                            <i style="color:#FF7761;font-size: 16px;margin-left: -165px;" class="fas fa-sign-out-alt"></i>
                                       <%--     <p class="title-item">--%>
                                                <asp:LinkButton ID="logout" runat="server" OnClick="logout_Click" style="padding: 2px 23px;font-size: 16px;color: #555555;margin-top: -20px;">Đăng xuất</asp:LinkButton>
                                           <%-- </p>
                                        </a>--%>
                                    </li>
                                </ul>
                        </div>
                </div>
                <div class="col l-10 m-9 c-9">
                        <div class="list-right">
                            <h1 style="font-size:20px"  class="list-right__title">
                                Quản lý hồ sơ
                            </h1>
                            <h1 style="font-weight:normal" class="list-right__title">
                                Quản lý hồ sơ để bảo mật thông tin
                            </h1>

                            
                            <form class="form-profile" style="transform:translateX(100px)">
                                <div class="">
                                    <p>Tên đăng nhập</p>
                                    <asp:TextBox ID="txtdangnhap" runat="server" CssClass="input-login"></asp:TextBox>
                                    <br>
                                </div>
                                <div >
                                    <p>Email</p>
                                    <asp:TextBox ID="txtemail" runat="server" CssClass="input-login"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email không hợp lệ" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ControlToValidate="txtemail" Font-Italic="True" Font-Size="Larger" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <br>
                                </div>
                                <div  >
                                    <p>Tên</p>
                                    <asp:TextBox ID="txthoten" runat="server" CssClass="input-login"></asp:TextBox>

                                    <br>
                                </div>
                                <div  >
                                    <p>Địa chỉ</p>
                                    <asp:TextBox ID="txtdiachi" runat="server" CssClass="input-login"></asp:TextBox>
                                    <br>
                                </div>
                                <div  >
                                    <p>Số điện thoại</p>
                                    <asp:TextBox ID="sdt" runat="server" CssClass="input-login"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Nhập đủ 10 số" Font-Size="Larger" Font-Italic="True" ControlToValidate="sdt" ValidationExpression="\d{10}" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <br>
                                </div>
                                <p style="text-align: left; padding: 0 36px; transform: translate(86px,34px)" >Giới Tính</p>
                                <div class="sex-container confirm" style="margin-top: 20px" >


                                    <asp:RadioButtonList ID="sex" runat="server" RepeatDirection="Horizontal" class="sex" >
                                        <asp:ListItem Selected="True" style="color: #333; cursor: pointer; font-size: 14px; margin: -4px 4px; transform: translate(234px,-30px)">Nam</asp:ListItem>
                                        <asp:ListItem style="color: #333; cursor: pointer; font-size: 14px; margin: -4px 4px; transform: translate(234px,-30px)">Nữ</asp:ListItem>

                                    </asp:RadioButtonList>
                                </div>
                                        <br />
                                            <br/>
                                <br />
                                <br />
                                <br />
                                <br />
                                       <div class="btn-submit" style="margin-bottom:30px;">
                                            <asp:Button ID="Button1" runat="server" Text="LƯU" CssClass="sub-user" OnClick="btnsave_Click" Width="150px" Height="30px" />
                                         <asp:Button  ID="Button2" runat="server" Text="ĐỔI MẬT KHẨU" CssClass="sub-user" PostBackUrl="~/doipass.aspx" Width="150px" Height="30px" style="margin-left:60px;" />
                                            <br />
                                       </div>
                                     
                            </form>
                             
                     
                           
                            </div>
                        </div>
                </div>
            </div>
        </div>

        <footer class="footer ">
            <div class="grid wide">
                <div class="row">
                    <div class="col l-3 m-6 c-6">
                        <div class="footer__clo">
                            <div class="footer__title">
                                <img style="width: 246;height:64px;" src="./assets/img/logo-footer.png" alt="">
                            </div>
                
                            <ul class="footer__list">
                              <li class="footer__list__item">
                                <i class="fas fa-map-marker-alt"></i>
                                <p>319 C16 Lý Thường Kiệt, Phường 15, Quận 11, Tp.HCM</p>
                              </li>
                              <li class="footer__list__item">
                                <i class="fas fa-phone"></i>
                                <p>076 922 0162</p>
                              </li>
                              <li class="footer__list__item">
                                <i class="far fa-envelope"></i>
                                <p>danchoiphonui27@gmail.com</p>
                              </li>
                              <li class="footer__list__item">
                                <i class="fab fa-youtube"></i>
                                <p>demonhunterp</p>
                              </li>
                               
                            </ul>   
                         </div>
                    </div>
                    <div class="col l-3 m-6 c-6">
                        <div class="footer__clo footer__col-menu">
                            <div class="footer__title">
                               <p1 style="font-size:20px;font-weight: 600;">MENU</p1>
                            </div>
                
                            <ul class="footer__list">
                              <li class="footer__list__item footer__list__item-menu menu-hover-i">
                                  <a href="#" class="">
                                    <i class="fas fa-angle-right"></i>
                                    <p>Trang Chủ</p>
                                  </a>
                               
                              </li>
                              <li class="footer__list__item footer__list__item-menu menu-hover-i">
                                <a href="#" class="">
                                  <i class="fas fa-angle-right"></i>
                                  <p>Giới Thiệu</p>
                                </a>
                             
                            </li>
                            <li class="footer__list__item footer__list__item-menu menu-hover-i">
                                <a href="#" class="">
                                  <i class="fas fa-angle-right"></i>
                                  <p>Tin Tức</p>
                                </a>
                             
                            </li>
                            <li class="footer__list__item footer__list__item-menu menu-hover-i">
                                <a href="#" class="">
                                  <i class="fas fa-angle-right"></i>
                                  <p>Liên Hệ</p>
                                </a>
                             
                            </li>
                            <li class="footer__list__item footer__list__item-menu menu-hover-i">
                                <a href="#" class="">
                                  <i class="fas fa-angle-right"></i>
                                  <p>Đăng Nhập</p>
                                </a>
                             
                            </li>
                            <li class="footer__list__item footer__list__item-menu menu-hover-i">
                                <a href="#" class="">
                                  <i class="fas fa-angle-right"></i>
                                  <p>Đăng Ký</p>
                                </a>
                             
                            </li>
                               
                            </ul>   
                         </div>
                    </div>
                    <div class="col l-3 m-6 c-6">
                        <div class="footer__clo footer__col-menu">
                            <div class="footer__title">
                               <p1 style="font-size:20px;font-weight: 600;">SẢN PHẨM</p1>
                            </div>
                
                            <ul class="footer__list">
                              <li class="footer__list__item footer__list__item-menu menu-hover-i">
                                  <a href="#" class="">
                                      <a href="#" class="">
                                    <i class="fas fa-angle-right"></i>
                                    <p>Aviator</p>
                                  </a>
                               
                              </li>
                              <li class="footer__list__item footer__list__item-menu menu-hover-i">
                                  <i class="fas fa-angle-right"></i>
                                  <p>Gaby-G</p>
                                </a>
                             
                            </li>
                            <li class="footer__list__item footer__list__item-menu menu-hover-i">
                                <a href="#" class="">
                                  <i class="fas fa-angle-right"></i>
                                  <p>Edifice</p>
                                </a>
                             
                            </li>
                            <li class="footer__list__item footer__list__item-menu menu-hover-i">
                                <a href="#" class="">
                                  <i class="fas fa-angle-right"></i>
                                  <p>G-Shock</p>
                                </a>
                             
                            </li>
                          
                               
                            </ul>   
                         </div>
                    </div>
                    <div class="col l-3 m-6 c-6">
                        <div class="footer__clo ">
                            <div class="footer__title">
                                <p style="font-size:20px;font-weight: 600;">ĐĂNG KÝ</p>
                            </div>
                
                            <ul class="footer__list">
                              <li class="footer__list__item">
                                <p>Đăng ký để nhận được được thông tin mới nhất từ chúng tôi.</p>
                              </li>
                              <li class="footer__list__item">
                                <input type="text" placeholder="Email ...">
                              </li>
                              <li style="padding: 20px 0;"class="footer__list__item footer__list__item-connect" >
                                
                                <p >KẾT NỐI VỚI CHÚNG TÔI</p>
                              </li>
                              <li class="footer__list__item footer__list__item__last">
                                  <a href="">
                                      <i class="fab fa-youtube"></i>
                                  </a>
                                  <a href="">
    
                                      <i class="fab fa-facebook-f"></i>
                                  </a>
                                  <a href="">
    
                                      <i class="fab fa-instagram"></i>
                                  </a>
                              </li>
                               
                            </ul>   
                         </div>
                    </div>
                        
                </div>
            </div>
    
           
    
             </footer> 
             </div>



    
    

    </form>
</body>
</html>
