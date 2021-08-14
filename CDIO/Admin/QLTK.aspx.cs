using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO.Admin
{
    public partial class QLTK1 : System.Web.UI.Page
    {
        Connect kn = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_data();
                chuyen();
            }
        }
        public void chuyen()
        {
            GridView1.DataSource = kn.getDataSet("select TenDangNhap,MatKhau,Hoten,case when GioiTinh='True' then N'Nam' else N'Nữ' end as GioiTinh,SDT,Email,DiaChi" +
                ",case when MaLoai='1' then N'Admin' else N'User' end MaLoai, case when TrangThai='True' then N'Mở' else N'Khóa' end as TrangThai  from TAIKHOAN");
            GridView1.DataBind();
        }

        public void load_data()
        {
           


            GridView1.Columns[1].Visible = true;
            GridView1.DataSource = kn.getDataSet("select * from TAIKHOAN");
            GridView1.DataBind();
            GridView1.Columns[1].Visible = false;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string TenDangNhap = GridView1.SelectedRow.Cells[0].Text;
            Response.Redirect("../Admin/SuaTTTK.aspx?TenDangNhap=" + TenDangNhap);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String sql1 = "Select TenDangNhap from HOADON where TenDangNhap =@TenDangNhap";
            object ma = kn.execScalar(sql1, new object[] { "TenDangNhap" }, new object[] { GridView1.Rows[e.RowIndex].Cells[0].Text });
            if (ma + "" != "")
            {
                Response.Write("<script>alert('Bạn không thể xóa ! Vì tài khoản đã có lịch sử mua hàng')</script>");
                return;
            }
            try
            {
                String sql = "Delete from TAIKHOAN where TenDangNhap=@TenDangNhap";
                int res = kn.execNonQuery(sql, new object[] { "TenDangNhap" }, new object[] { GridView1.Rows[e.RowIndex].Cells[0].Text });
                if (res > 0)
                {
                    Response.Write("<script>alert('Xóa thành công!')</script>");
                    load_data();
                    return;
                }
                else
                {
                    Response.Write("<script>alert('Lỗi!')</script>");
                    return;
                }
            }
            catch { }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Server.Transfer("../Admin/ThemTaiKhoan.aspx");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load_data();
            chuyen();
        }
    }
}