using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO.Admin
{
    public partial class QLSanPham : System.Web.UI.Page
    {
        Connect db = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LayDanhMucSanPham();
                loadData();
            }
        }
        public void loadData()
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.Open_CSDL();
            string sql = $@"
                SELECT SANPHAM.*,DANHMUC.TenHang
                FROM SANPHAM
                INNER JOIN DANHMUC ON
                SANPHAM.MaHang = DANHMUC.MaHang";

            DataTable dataTable = dataAccess.Lay_CSDl(sql);
            this.rptdssp.DataSource = dataTable;
            this.rptdssp.DataBind();
            dataAccess.Close_CSDL();


        }

        protected void LayDanhMucSanPham()
        {
            DataAccess data = new DataAccess();
            data.Open_CSDL();
            string sql = $"SELECT * FROM DANHMUC";
            DataTable dataTable = data.Lay_CSDl(sql);
            this.lddDanhMuc.DataTextField = "TenHang";
            this.lddDanhMuc.DataValueField = "MaHang";
            this.lddDanhMuc.DataSource = dataTable;
            this.lddDanhMuc.DataBind();
            data.Close_CSDL();
        }


        protected void btnthem_Click(object sender, EventArgs e)
        {
            DataAccess data = new DataAccess();
            data.Open_CSDL();
            string tensp = tbTenSanPham.Text;

            int iddm = int.Parse(lddDanhMuc.SelectedValue);
            int giasp = int.Parse(tbGia.Text);
            int soluongton = int.Parse(tbsoluongton.Text);
            string hinhanh = UpLoadHinhAnh();
            string motasp = tbMota.Text;
            int giaxuat = int.Parse(tbGiaXuat.Text);
            Connect kn = new Connect();
           
            string sql = $@"INSERT INTO SANPHAM (TenSP, MaHang, DonGia, SoLuongTon, HinhAnh, MoTa,TyLeKM)  VALUES(N'{tensp}','{iddm}','{giaxuat}','{soluongton}','{hinhanh}',N'{motasp}',0)";
            
            
            DateTime ngay = DateTime.Now.Date;
            
            string sql1 = $@"INSERT INTO NHAPXUAT (GiaNhap,GiaXuat,NgayApDung, SoLuong)  VALUES('{giasp}','{giaxuat}','{Convert.ToDateTime(ngay)}','{soluongton}')";

            data.ThucThiCauLenhSql(sql1);
            int soDongTacDong = data.ThucThiCauLenhSql(sql);
            object masp = kn.execScalar("select top 1 masp from SANPHAM order by MASP DESC");
            object manx = kn.execScalar("select top 1 manhapxuat from NHAPXUAT order by MANHAPXUAT DESC");
            string q = $"update NHAPXUAT set MASP={masp} where MANHAPXUAT={manx}";
            data.ThucThiCauLenhSql(q);
            string query = @"select ct.masp,ct.tylekm from CTKHUYENMAI ct,SANPHAM sp,KHUYENMAI km where ct.MaKM=km.MaKM
                            and ct.MaSP = sp.MaSP and km.TrangThai = N'Đang khuyến mãi'";
            DataTable dataTable = kn.laydata(query);
            foreach (DataRow row in dataTable.Rows)
            {
                string query1 = $"UPDATE SANPHAM set TYLEKM={row["TYLEKM"]} where MASP={row["MASP"]}";
                kn.execNonQuery(query1);
            }
            if (soDongTacDong > 0)
            {
                XoaDuLieuCuaCacControl();

                Response.Write("<script>alert('Thêm thành công!')</script>");

            }
            else
            {
                Response.Write("<script>alert('Thêm thất bại!')</script>");
            }


            loadData();


        }


        protected string UpLoadHinhAnh()
        {
            if (fulHinhAnh.HasFile)
            {

                string thumuchinhanh = Server.MapPath("../assets/img/img_home/img_product/");

                string tenfileupload = fulHinhAnh.FileName;

                string duongdanhinhanh = thumuchinhanh + tenfileupload;

                fulHinhAnh.SaveAs(duongdanhinhanh);
                return tenfileupload;

            }
            else
            {
                return "";

            }
        }
        protected void XoaDuLieuCuaCacControl()
        {
            tbTenSanPham.Text = "";
            lddDanhMuc.ClearSelection();
            tbGia.Text = "";
            tbMota.Text = "";
            tbGiaXuat.Text = "";
            tbsoluongton.Text = "";
        }


        //------------ Xử ly sửa -----------------
        protected void LayThongTinSanPham()
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.Open_CSDL();

            // Lấy idSanPham từ Query String của URL
            string idSanPham = Request.QueryString.Get("idSanPham");

            if (idSanPham != null)
            {
                string sql = $"SELECT * FROM SANPHAM WHERE ID = {idSanPham}";

                DataTable dataTable = dataAccess.Lay_CSDl(sql);

                DataRow dataRow = dataTable.Rows[0];

                // Gán dữ liệu vào các control
                tbTenSanPham.Text = dataRow["TenSP"].ToString();
                lddDanhMuc.SelectedValue = dataRow["MaHang"].ToString();
                tbGia.Text = dataRow["DonGia"].ToString();
                tbMota.Text = dataRow["MoTa"].ToString();
               
                tbsoluongton.Text = dataRow["SoLuongTon"].ToString();

            }

            dataAccess.Close_CSDL();
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            DataAccess data = new DataAccess();
            data.Open_CSDL();
            string masp = ((LinkButton)sender).CommandArgument.ToString();
            string q = "DELETE FROM CTHOADON WHERE MaSP = '" + masp + "'";
            string q1 = "DELETE FROM CTKHUYENMAI WHERE MaSP = '" + masp + "'";
            string sql = "DELETE FROM NHAPXUAT WHERE MaSP = '" + masp + "'";
            string sql1 = "DELETE FROM SANPHAM WHERE MaSP = '" + masp + "'";
            db.InsertDeleteUpdate(q);
            db.InsertDeleteUpdate(q1);
            db.InsertDeleteUpdate(sql);
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