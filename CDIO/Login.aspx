<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CDIO.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Đăng nhập</title>
    <meta charset="UTF-8" />
     <link rel="stylesheet" href="./assets/css/grid.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-5.14.0/css/all.min.css ">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/slide.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <style> 
        p{
            color:black;
        }
        .row-mid{
           display:flex;
           justify-content:center;
          margin:auto;
  
           border-radius:10px;
           align-items:center;
           width:1000px;
             background-color:#fff;
                    overflow:hidden;
           

    
       }

        body{
       background-color:#EBEBED;
                 font-stretch: ultra-condensed;
                   
           
        }
        .main-signup{
        

         
        }
        #maxn{
            padding: 8px 0px;
            text-align:left;
            width:210px;
           margin:0 6px 0;
            float:left;
        }
        #sendma{
            float:inherit;

        }
        .container_background{
            color: #FFFFFF;
		background-size:auto;
		
		background-image: url("http://mauweb.monamedia.net/gwatch/wp-content/uploads/2018/11/banner-02-1024x617.jpg");
         background-position:center;
       min-height:800px;
        max-width:100%;
       transform:translateX(-12px);
       overflow:hidden;
       border-radius:10px;
       align-items:center;
       justify-content:center;     
        overflow:hidden;
        }
     .login-container__item-signup p{
            font-size: 18px;
        }
         .container_background h1{
             font-size:40px;
             color:#fff;
             line-height:50px;
             text-align:center;
            
                margin:150px 50px 0 0 ;
         }
           .container_background p{
             font-size:20px;
             font-weight:600;
             color:#fff;
             line-height:50px;
                padding:0px 0;
                text-align:center;
            
             
         }
             .container_background button{
                 font-size:20px;
                 background-color:#3B5998;
                 display:flex;
                 border-radius:40px;
                 margin: 20px;
                 padding:20px 80px;
                 justify-content:center;
                 transform:translateX(28%);
             }
                button:hover{
                   opacity:0.8;
               }
                  .container_background button a{
                 font-size:20px;
              
               color:#fff;
                
                  }
                  #RegularExpressionValidator3{
                           font-size: 17px !important;
                  }
                  #RegularExpressionValidator1{
                           font-size: 17px !important;
                  }
                 span#RegularExpressionValidator2{
                      color: red;
                      margin-top:4px !important;
                        font-size: 17px !important;
                   
                      

                  }
                     .container_background button i{
                           font-size:20px;
                           padding: 0 10px;
                     }  
                     #maxn_login{
                         width:180px;
                     }
    </style>
  
</head>
<body>
    <form id="form1" runat="server">
          <div class="main-signup">
                             <div class="grid">
                                 <div class="row row-mid">
                                     <div class="col c-0 l-6 m-6">
                                            <div class="container_background">
                                                <div class="overlay"> </div>
                                                        <h1>WELCOME WATCH M</h1>
                                                <p>Chuyên phân phối đồng hồ Casio Mỹ / Nhật chính hãng giá cạnh tranh nhất</p>
                                                <div style="display:flex;text-align:center; justify-content:center">
                                                     <p >Bạn Mới biết đến GWATCH ?   </p>   
                                                <a href="Signup.aspx" style="color:#DD3333; display:inline-block;font-size:20px;font-weight:700;margin:18px 8px">Đăng Kí</a>
                                                </div>
                                                   
                                            <p style="text-align:center;padding:20px;font-size:30px;"> Social media  </p>

                                                <button>
                                                    <i class="fab fa-facebook"></i>
                                                    <a href="facebook.com">Facebook</a>
                                                </button>
                                                <button style="background-color:#DD3333;    padding:20px 84px;">
                                               <i class="fab fa-youtube"></i>
                                                    <a href="youtube.com">Youtube</a>
                                                </button>
                                                </div>
                                                 

                                        
                                     </div>
                                      <div class="col c-12 l-6 m-6">
                                                 <div class="login-container__item login-container__item-signup">
                        <h1 style="color:red;text-align:center;font-size:30px ;font-weight:600" >Đăng Nhập</h1>
                        <p>Email *</p>
                        <asp:TextBox ID="email_login" runat="server" CssClass="input-login" ></asp:TextBox> 
                        <p>Mật khẩu *</p>
                        <asp:TextBox ID="pass_login" type="password" runat="server" CssClass="input-login" ></asp:TextBox>
                        <p>Mã Xác Nhận *</p>
                        <asp:TextBox ID="maxn_login" runat="server" CssClass="input-login"></asp:TextBox>
                         <span style="font-size:20px;margin-left: 20px;">
                             <asp:Label ID="captcha" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red" Font-Size="Larger"></asp:Label>


                         </span>
                       
                        <br>
                        
                        <asp:Button  ID="dangnhap" runat="server" Text="ĐĂNG NHẬP" style="padding:20px 60px;cursor:pointer; font-size:14px;margin:20px 0px 20px 0px;text-align:center;font-weight:600;color:#fff; border: none;background-color: var(--main-color); border-radius:40px;transform: translateX(105px);" OnClick="login_Click"/>
                        <asp:Button ID="btnBack" runat="server" Text="TRỞ VỀ" style="padding:20px 76px;cursor:pointer; font-size:14px;text-align:center;font-weight:600;color:#fff; border: none;background-color:var(--main-color); border-radius:40px; display: inline-block;transform: translateX(105px);" OnClick="btnBack_Click"/>
                        &emsp;
                                                       <br />
                         <asp:CheckBox ID="ghinho" runat="server" />
                                                       
                           &emsp;    
                                                     <p class="remember-pass">Ghi nhớ mật khẩu</p>
                         
                           &emsp;    &emsp;
                        <asp:LinkButton ID="lblquenpass" runat="server" ForeColor="Black" OnClick="lblquenpass_Click"   PostBackUrl="~/Quenpass.aspx" >Quên mật khẩu?</asp:LinkButton>

                    </div>
                    
                                          </div>
                                 </div>
                             </div>
                     
                      
                         </div>

                   
                   
             

    </form>
</body>
</html>
