using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO.Admin
{
    public partial class SuaSanPham : System.Web.UI.Page
    {
        Connect db = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LayThongTinSanPham();
                LayDanhMucSanPham();
                loadData();
            }
        }
        protected void LayDanhMucSanPham()
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.Open_CSDL();

            string sql = $"SELECT * FROM DANHMUC";

            DataTable dataTable = dataAccess.Lay_CSDl(sql);

            // Chỉ định các thuộc tính
            this.lddDanhMuc1.DataTextField = "TenHang";
            this.lddDanhMuc1.DataValueField = "MaHang";

            // Thực hiện data binding
            this.lddDanhMuc1.DataSource = dataTable;
            this.lddDanhMuc1.DataBind();

            dataAccess.Close_CSDL();
        }
        public void loadData()
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.Open_CSDL();
            string sql = $@"
                SELECT SANPHAM.*,DANHMUC.TenHang
                FROM SANPHAM
                INNER JOIN DANHMUC ON
                SANPHAM.MaHang = DANHMUC.MaHang ";
            

            DataTable dataTable = dataAccess.Lay_CSDl(sql);
            this.rptdssp.DataSource = dataTable;
            this.rptdssp.DataBind();
            dataAccess.Close_CSDL();


        }


        protected void LayThongTinSanPham()
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.Open_CSDL();

            // Lấy idSanPham từ Query String của URL
            string idSanPham = Request.QueryString.Get("MaSP");

            if (idSanPham != null)
            {
                string sql = $"SELECT * FROM SANPHAM WHERE MaSP = {idSanPham}";
                string sql1 = $"SELECT * FROM NHAPXUAT WHERE MaSP = {idSanPham}";
                DataTable dataTable = dataAccess.Lay_CSDl(sql);
                DataTable dataTable1 = dataAccess.Lay_CSDl(sql1);
                DataRow dataRow = dataTable.Rows[0];
                DataRow dataRow1 = dataTable1.Rows[0];
                // Gán dữ liệu vào các control

                tbTenSanPham1.Text = dataRow["TenSP"].ToString();
                lddDanhMuc1.SelectedValue = dataRow["MaHang"].ToString();
                tbGia1.Text = dataRow1["GiaNhap"].ToString();
                tbMota1.Text = dataRow["MoTa"].ToString();
               
                tbsoluongton1.Text = dataRow["SoLuongTon"].ToString();
                tbGiaXuat1.Text = dataRow1["GiaXuat"].ToString();
            }

            //dataAccess.Close_CSDL();
        }

        // Phương thức xử lý sự kiện khi "button Thêm" được click
        protected void btnSua_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();

            dataAccess.Open_CSDL();

            // Lấy idSanPham từ Query String của URL
            string idSanPham = Request.QueryString.Get("MaSP");

            string tenSanPham = tbTenSanPham1.Text;
            int idDanhMuc = int.Parse(lddDanhMuc1.SelectedValue);
            int giaSanPham = int.Parse(tbGia1.Text);
            string hinhAnhSanPham = UpLoadHinhAnh();
            string mieuTaSanPham = tbMota1.Text;
            
            int soluong = int.Parse(tbsoluongton1.Text);
            int giaxuat = int.Parse(tbGiaXuat1.Text);
            string sql = $@"
            UPDATE SANPHAM
            SET TenSP = N'{tenSanPham}',MaHang = {idDanhMuc},
	            DonGia = {giaxuat},
	            HinhAnh = '{hinhAnhSanPham}',
	            MoTa= N'{mieuTaSanPham}',
              
                SoLuongTon={soluong}
            WHERE MaSP = {idSanPham}";
            string sql1 = $@"
            UPDATE NHAPXUAT
            SET GiaNhap = {giaSanPham},
	            GiaXuat = '{giaxuat}',
                SoLuong={soluong}
            WHERE MaSP = {idSanPham}";
            int soDongTacDong = dataAccess.ThucThiCauLenhSql(sql);
            dataAccess.ThucThiCauLenhSql(sql1);
            if (soDongTacDong > 0)
            {
                //XoaDuLieuCuaCacControl();
                Response.Write("<script>alert('Cập nhật thành công!')</script>");
            }
            else
            {
                Response.Write("<script>alert('Cập nhật thất bại!')</script>");
            }


            loadData();
        }

        protected string UpLoadHinhAnh()
        {
            if (fulHinhAnh1.HasFile)
            {
                // Lấy đườn dẫn thư mục hình ảnh
                string thumuchinhanh = Server.MapPath("../assets/img/img_home/img_product/");
                // Tên file hình ảnh dc upload
                string tenfileupload = fulHinhAnh1.FileName;
                // Tên đường dẫn hình ảnh dc lưu
                string duongdanhinhanh = thumuchinhanh + tenfileupload;
                // Gọi phương thức SaveAs để lưu hình ảnh dc upload
                fulHinhAnh1.SaveAs(duongdanhinhanh);
                return tenfileupload;

            }
            else
            {
                return "";

            }
        }

        protected void XoaDuLieuCuaCacControl()
        {
            tbTenSanPham1.Text = "";
            lddDanhMuc1.ClearSelection();
            tbGia1.Text = "";
            tbMota1.Text = "";
          
            tbsoluongton1.Text = "";
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            DataAccess data = new DataAccess();
            data.Open_CSDL();
            string masp = ((LinkButton)sender).CommandArgument.ToString();
            string sql1 = "DELETE FROM SANPHAM WHERE MaSP = '" + masp + "'";
            db.InsertDeleteUpdate(sql1);
            int soDongTacDong = data.ThucThiCauLenhSql(sql1);

            if (soDongTacDong > 0)
            {
                XoaDuLieuCuaCacControl();

                Response.Write("<script>alert('Xóa thất bại!')</script>");

            }
            else
            {
                Response.Write("<script>alert('Xóa thành công!')</script>");
            }
            loadData();
            data.Close_CSDL();

        }
    }
}