using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO
{
    public partial class ChiTietHoaDon1 : System.Web.UI.Page
    {
        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["mahd"] == null)
                return;
            lblMaHD.Text = Session["mahd"].ToString();
            LoadData();
        }

        public void LoadData()
        {
            string maHD = Session["mahd"].ToString();
            string sql = "SELECT CTHOADON.MaSP, TenSP, HinhAnh, DonGia, CTHOADON.TYLEKM, SoLuong, SoLuong * DonGia - (SoLuong * CTHOADON.TYLEKM * DonGia) / 100 AS ThanhTien FROM CTHOADON, SANPHAM WHERE CTHOADON.MaSP = SANPHAM.MaSP AND MaHD = '" + maHD + "'";
            GridView1.DataSource = connect.getData(sql);
            GridView1.DataBind();
            if (this.GridView1.Rows.Count != 0)
            {
                this.GridView1.FooterRow.Cells[5].Text = "Tổng tiền";
                this.GridView1.FooterRow.Cells[5].Font.Bold = true;
                this.GridView1.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Center;
                this.GridView1.FooterRow.Cells[5].VerticalAlign = VerticalAlign.Middle;

                this.GridView1.FooterRow.Cells[6].Font.Bold = true;
                this.GridView1.FooterRow.Cells[6].HorizontalAlign = HorizontalAlign.Center;
                this.GridView1.FooterRow.Cells[6].VerticalAlign = VerticalAlign.Middle;
                this.GridView1.FooterRow.Cells[6].ForeColor = System.Drawing.Color.Red;
                this.GridView1.FooterRow.Cells[6].Font.Size = 22;
                this.GridView1.FooterRow.Cells[6].Text = TinhTongTien().ToString("C0", CultureInfo.CreateSpecificCulture("vn-VN"));
            }
            foreach (GridViewRow row in this.GridView1.Rows)
            {
                row.Cells[3].Text = float.Parse(row.Cells[3].Text.ToString()).ToString("C0", CultureInfo.CreateSpecificCulture("vn-VN"));
                row.Cells[6].Text = float.Parse(row.Cells[6].Text.ToString()).ToString("C0", CultureInfo.CreateSpecificCulture("vn-VN"));
            }
            string query = "select HOTEN,SDT,DIACHI FROM TAIKHOAN,HOADON WHERE TAIKHOAN.TenDangNhap=HOADON.TenDangNhap AND MAHD='" + maHD + "'";
            DataTable dt = connect.getData(query);
            txthoten.Text = dt.Rows[0]["HOTEN"].ToString();
            txtdiachi.Text = dt.Rows[0]["DIACHI"].ToString();
            sdt.Text = dt.Rows[0]["SDT"].ToString();
        }

        public float TinhTongTien()
        {
            float total = 0;
            DataTable table = (DataTable)GridView1.DataSource;
            for (int i = 0; i < table.Rows.Count; i++)
            {
                total += float.Parse(table.Rows[i]["ThanhTien"].ToString());
            }
            return total;
        }

        protected void btn_trove_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Admin/QuanLyDonHang.aspx");
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridView1.PageIndex = e.NewSelectedIndex;
            LoadData();
        }
    }
}