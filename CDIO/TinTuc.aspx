<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="TinTuc.aspx.cs" Inherits="CDIO.TinTuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>
        Tin tức
    </title>
     <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-5.14.0/css/all.min.css ">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/slide.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
     <style>
       .row-header {
           display: flex;
           justify-content:space-evenly;
           
       }
       
        *{
            padding:0;
            margin: 0;
            box-sizing: border-box;
        }
        body{
            font-family: "Poppins", sans-serif;
   
            background-color: black;
           
            
        }
        .main{
        
            
            margin: 10% auto;
            max-width: 980px;
            
        }
        .tabs{
            display:flex;
            position: relative;

        }
        .tabs .line {
            position: absolute;
             width:0;
            height:6px;
            bottom:0;
            left:0;
            background-color: red;
            border-radius:20px;
            margin:-10px 0;
            transition: all 0.3s ease;
        }
        .img{
            margin:10px 0;
        }
        .tab-item {
            padding: 0px  10px;
            margin:  auto;
            font-size: 20px;
            border:none;
            outline: none;
          
        }
        .tab-item:hover{
            color:#DD3333;
            cursor: pointer;
        }
        .tab-content{
            padding: 40px 30px;
        }
        .tab-pane{
            display:none;
            transition: all 0.3s ease;
            text-align: justify;
            background-color:transparent;
            line-height:1.5;
        }
        .tab-pane p {
          transform: translateX(6%);
          background:black;
          color:#f2f2f2;
          font-size:15px;
          margin-top:20px;
        }
        .tab-pane h2 {
      
          font-size:16px;
        }
        .tab-pane.active{
            display:block;
        }
        img {
          
        }
     

 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="main" style="background:black;">    
        <div class="tabs">
           <div class="tab-item active">
            <i class="far fa-newspaper"></i>
             Mới
           </div>
       
            <div class="tab-item ">
                <i class="tab-icon fas fa-plus-circle"></i>
              Sản phẩm nổi bật
            </div>        
            <div class="tab-item">
                <i class="tab-icon fas fa-pen-nib"></i>
             Bán chạy nhất
            </div>  
           <div class="tab-item">
            <i class="tab-icon fas fa-cog"></i>
            Bộ sưu tập
        </div>
          <div class="line"></div>
        </div>
        <div class="tab-content" style="background:black;">
             <div class="tab-pane active" style="background:black;">
                <h2>Sản phẩm mới nhất</h2>
                <img src="http://mauweb.monamedia.net/gwatch/wp-content/uploads/2018/11/banner-02-1024x617.jpg" alt="" class="">
                <p >
                    Được biết, Garmin là thương hiệu đồng hồ thông minh nổi tiếng đến từ Mỹ, có thế mạnh trong việc sản xuất đồng hồ dành cho người tập luyện thể thao. Sản phẩm được trang bị những tính năng đắt giá mà không nhiều sản phẩm có được, trong đó phải kể đến tính năng đo lường chính xác lộ trình nhờ kết nối GPS, bền bỉ với người chơi thể thao, dung lượng pin dài đến cả tuần… Cũng vì sở hữu những tính năng đặc biệt này, Garmin luôn nằm trong top những chiếc đồng hồ được những người luyện tập thể thao tin tưởng lựa chọn, dù giá thành sản phẩm có nhỉnh hơn nhiều đồng hồ thể thao khác.
                </p>
             </div>
             <div class="tab-pane" style="background:black;">
                <h2>Sản phẩm nổi bật</h2>
                <img src="http://mauweb.monamedia.net/gwatch/wp-content/uploads/2018/03/watches-background-6-1024x576.jpg" alt="">
                <p>
                    Shop M-Watch cam kết tất cả sản phẩm đều là hàng chính hãng mới 100%, có hoá đơn rõ ràng và được bảo hành đến 12 tháng theo tiêu chuẩn của nhà sản xuất. Ngoài ra, Garmin Brand Store là điểm bảo hành uỷ quyền cấp cao nhất của Garmin, có thể xử lý đúng chuẩn ngay cho bất kỳ lỗi phát sinh nào cũng như có sẵn hàng hóa để đổi trả theo quy định. Tất cả những sản phẩm khác sẽ vận chuyển về đây để được bảo hành, vì vậy, khi mua tại Garmin Brand Store, bạn có thể bỏ qua những bước trung gian và được hỗ trợ nhanh nhất.
                </p>
             </div>
             <div class="tab-pane" style="background:black;">
                <h2>Sản phẩm giảm giá</h2>
                <img src="http://mauweb.monamedia.net/gwatch/wp-content/uploads/2018/03/background_visuel_1-1024x548.jpg" alt="">
                 <p>
                     Sản phẩm này đang giảm giá , nhanh tay thì còn , chậm tay thì hết. Chỉ  áp dụng coh những khách hàng đã mua tại shop M-Watch
                     Garmin là một trong những hãng sản xuất vòng đeo tay và đồng hồ thông minh được nhiều người dùng tin tưởng và lựa chọn. Các sản phẩm của hãng với thiết kế đẹp mắt sang trọng phù hợp với nhiều đối tượng sử dụng và tính năng đa dạng. Trong đó sản phẩm Garmin Fenix 6 thuộc phân khúc cao cấp với rất nhiều tính năng như hỗ trợ trong công việc luyện tập và rèn luyện sức khỏe.

                 </p>
             </div>
             <div class="tab-pane"style="background:black;">
                <h2> Bộ sưu tẩm sản phẩm</h2>
                <img src="http://mauweb.monamedia.net/gwatch/wp-content/uploads/2018/03/structure-tech-hd-1024x517.jpg" alt="">
                 <ul>
                     <li>Các bạn có thừa nhận rằng: Đàn ông đeo đồng hồ trông phong cách, thông minh, có năng lực và hấp dẫn trong mắt phụ nữ? Không người phụ nữ nào lại không thích đàn ông đeo đồng hồ?</li>
                 </ul>
             </div>
        </div>      
  </div>
</asp:Content>
