<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="CDIO.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Đăng ký</title>
    <meta charset="UTF-8" />
      <link rel="stylesheet" href="./assets/css/grid.css">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-5.14.0/css/all.min.css ">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/slide.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
     <link rel="stylesheet" href="./assets/css/grid.css">

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
                                                     <p >Bạn đã biết đến GWATCH ?   </p>   
                                                <a href="Login.aspx" style="color:#DD3333; display:inline-block;font-size:20px;font-weight:700;margin:18px 8px">Đăng nhập</a>
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
                                            <div class="login-container__item login-container__item-signup" style="">
                    <h1 style="color:red;text-align:center;font-size:30px">Đăng Ký</h1>
                    <P>Email *</P>   
                    <asp:TextBox ID="Youremail" runat="server" CssClass="input-login" required></asp:TextBox>
                                                <br />
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email không hợp lệ" ControlToValidate="Youremail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Bold="False" Font-Italic="True" Font-Size="Larger" ForeColor="Red"></asp:RegularExpressionValidator>
                    <P>Tên *</P>   
                    <asp:TextBox ID="txtten" runat="server" CssClass="input-login" required></asp:TextBox>
                    <P>Số Điện Thoại *</P>
                    <asp:TextBox ID="SDT" runat="server" CssClass="input-login" required></asp:TextBox>
                       <br />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Nhập đủ 10 số" Display="Dynamic" ValidationExpression="\d{10}" ControlToValidate="SDT" ForeColor="Red" Font-Italic="True" Font-Size="Larger"></asp:RegularExpressionValidator>
                    <P>Mật khẩu *</P>
                    <asp:TextBox ID="Pass" type="password" runat="server" CssClass="input-login" required></asp:TextBox>
                           <br />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Tối thiểu tám ký tự, ít nhất một chữ cái và một số" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ControlToValidate="Pass" Font-Italic="True" Font-Size="Larger" ForeColor="Red"></asp:RegularExpressionValidator>
                    <P>Mã xác nhận *</P>
                                                
                    <asp:TextBox ID="maxn" runat="server" CssClass="input-login" ReadOnly="True" ></asp:TextBox>
                    <asp:Button ID="sendma" runat="server" Text="Gửi mã xác nhận" style="cursor:pointer; padding:12px 6px;font-size:14px;font-weight:600;color:#fff; border: none;margin-right:8px;background-color: var(--main-color);" OnClick="sendma_Click"/>
                     </br>
                            </br>
                     <asp:Label ID="thongbao" runat="server" Font-Size="Large" ForeColor="Red" ></asp:Label>     
                            </br>
                   <asp:Button ID="dangky" runat="server" Text="ĐĂNG KÝ" style="cursor:pointer; padding:20px 60px; font-size:14px;margin:0 80px;text-align:center;font-weight:600;color:#fff; border: none;background-color: var(--main-color); border-radius:40px" Onclick="signup_Click"/>
                    
                    
                    
                </div>
                                          </div>
                                 </div>
                             </div>
                     
                      
                         </div>
    </form>
</body>
</html>
