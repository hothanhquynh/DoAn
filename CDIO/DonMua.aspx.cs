using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO
{
    public partial class DonMua : System.Web.UI.Page
    {
        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Session["tendangnhap"].ToString();
            this.lblUsername.Text = username;
            LoadOrder();
            LoadTrangThai();
        }

        // Các trạng thái của đơn hàng: Chờ duyệt (CD), Đang giao (G), Đã giao (DG), Đã hủy (DH)
        public void LoadOrder()
        {
            string username = Session["tendangnhap"].ToString();
            this.grdChoDuyet.DataSource = connect.getData("SELECT * FROM HOADON WHERE TenDangNhap = '" + username + "' AND TrangThai = N'Chờ duyệt'");
            this.grdChoDuyet.DataBind();
            this.grdvDangGiao.DataSource = connect.getData("SELECT * FROM HOADON WHERE TenDangNhap = '" + username + "' AND TrangThai = N'Đang giao'");
            this.grdvDangGiao.DataBind();
            this.grdDaGiaoDaHuy.DataSource = connect.getData("SELECT * FROM HOADON WHERE TenDangNhap = '" + username + "' AND (TrangThai  = N'Đã giao' OR TrangThai = N'Đã hủy')");
            this.grdDaGiaoDaHuy.DataBind();
            if (grdChoDuyet.Rows.Count == 0) lblChoDuyet.Text = "Không có đơn nào đang được chờ duyệt";
            if (grdvDangGiao.Rows.Count == 0) lblDangGiao.Text = "Không có đơn nào đang được giao";
            if (grdDaGiaoDaHuy.Rows.Count == 0) lblLichSu.Text = "Không có lịch sử đơn nào";
            HideButtonXoa();
        }

        public void HideButtonXoa()
        {
            foreach (GridViewRow row in grdDaGiaoDaHuy.Rows)
            {
                string s = HttpUtility.HtmlDecode(row.Cells[3].Text);

                if (s == "Đã giao") ((LinkButton)row.FindControl("btnXoa")).Visible = false;
            }
        }

        public void LoadTrangThai()
        {
            /* ddlTrangThai.DataSource = connect.getData("SELECT DISTINCT TrangThai FROM HOADON");
             ddlTrangThai.DataTextField = "TrangThai";
             ddlTrangThai.DataValueField = "TrangThai";
             ddlTrangThai.DataBind();*/
            if (ddlTrangThai.Items.Count == 0)
            {
                ListItem all = new ListItem();
                all.Text = "Tất cả";
                all.Value = "Tất cả";
                ddlTrangThai.Items.Add(all);
                ListItem huy = new ListItem();
                huy.Text = "Đã hủy";
                huy.Value = "dahuy";
                ddlTrangThai.Items.Add(huy);
                ListItem daGiao = new ListItem();
                daGiao.Text = "Đã giao";
                daGiao.Value = "dagiao";
                ddlTrangThai.Items.Add(daGiao);
                ddlTrangThai.SelectedItem.Value = "Tất cả";
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/user-info.aspx");
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            string username = Session["tendangnhap"].ToString();
            this.lblUsername.Text = username;
            string maHD = ((LinkButton)sender).CommandArgument.ToString();
            string sql = "UPDATE HOADON SET TrangThai = N'Đã hủy' WHERE MaHD = '" + maHD + "'";
            connect.InsertDeleteUpdate(sql);
            DataTable table = new DataTable();
            table.Columns.Add("MaSP");
            table.Columns.Add("SoLuong");
            table = connect.getData("SELECT MaSP, SoLuong FROM CTHOADON WHERE MaHD = '" + maHD + "'");
            foreach (DataRow row in table.Rows)
            {
                string maSP = row["MaSP"].ToString();
                string soLuong = row["SoLuong"].ToString();
                connect.InsertDeleteUpdate("UPDATE SANPHAM SET SoLuongTon = SoLuongTon + " + soLuong + " WHERE MaSP = '" + maSP + "'");
            }
            LoadOrder();
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string maHD = ((LinkButton)sender).CommandArgument.ToString();
            string sql1 = "DELETE FROM CTHOADON WHERE MaHD = '" + maHD + "'";
            connect.InsertDeleteUpdate(sql1);
            string sql2 = "DELETE FROM HOADON WHERE MaHD = '" + maHD + "'";
            connect.InsertDeleteUpdate(sql2);
            LoadOrder();
        }

        protected void ddlTrangThai_SelectedIndexChanged(object sender, EventArgs e)
        {
            string username = Session["tendangnhap"].ToString();
            string sql;
            if (ddlTrangThai.SelectedItem.Value == "dagiao")
            {
                sql = "SELECT * FROM HOADON WHERE TenDangNhap = N'" + username + "' AND TrangThai = N'Đã giao'";
            }
            else if (ddlTrangThai.SelectedItem.Value == "dahuy")
            {
                sql = "SELECT * FROM HOADON WHERE TenDangNhap = N'" + username + "' AND TrangThai = N'Đã hủy'";
            }
            else
            {
                sql = "SELECT * FROM HOADON WHERE TenDangNhap = N'" + username + "' AND TrangThai IN (N'Đã giao', N'Đã hủy')";
            }
            grdDaGiaoDaHuy.DataSource = connect.getData(sql);
            grdDaGiaoDaHuy.DataBind();
            HideButtonXoa();

        }

        protected void btnXemChiTiet_Click(object sender, EventArgs e)
        {
            string maHD = ((LinkButton)sender).CommandArgument.ToString();
            Session["mahd"] = maHD;
            Server.Transfer("~/ChiTietHoaDon.aspx");
        }

        protected void grdChoDuyet_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdChoDuyet.PageIndex = e.NewPageIndex;
            LoadOrder();
            LoadTrangThai();
        }

        protected void grdvDangGiao_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdvDangGiao.PageIndex = e.NewPageIndex;
            LoadOrder();
            LoadTrangThai();
        }

        protected void grdDaGiaoDaHuy_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdDaGiaoDaHuy.PageIndex = e.NewPageIndex;
            LoadOrder();
            LoadTrangThai();
        }
    }
}