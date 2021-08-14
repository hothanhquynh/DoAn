using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO.Admin
{
    public partial class QuanLyDonHang : System.Web.UI.Page
    {
        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadChoDuyet();
            LoadTrangThai();
            LoadChung();
        }

        public void HideButton()
        {
            foreach (GridViewRow row in grdChung.Rows)
            {
                string s = HttpUtility.HtmlDecode(row.Cells[4].Text);
                switch (s)
                {
                    case "Đã hủy":
                        ((LinkButton)row.FindControl("btnDaGiao")).Visible = false;
                        break;
                    case "Đã giao":
                        ((LinkButton)row.FindControl("btnDaGiao")).Visible = false;
                        break;
                    case "Đang giao":
                        ((LinkButton)row.FindControl("btnDaGiao")).Visible = true;
                        ((LinkButton)row.FindControl("btnXoa")).Visible = true;
                        break;
                }
            }
        }

        public void LoadChoDuyet()
        {
            this.grdChoDuyet.DataSource = connect.getData("SELECT * FROM HOADON WHERE TrangThai = N'Chờ duyệt'");
            this.grdChoDuyet.DataBind();
            if (grdChoDuyet.Rows.Count == 0) lblChoDuyet.Text = "Không có đơn hàng nào đang được chờ duyệt";
        }

        public void LoadChung()
        {
            this.grdChung.DataSource = connect.getData("SELECT * FROM HOADON WHERE TrangThai <> N'Chờ duyệt'");
            this.grdChung.DataBind();
            if (grdChung.Rows.Count == 0) lblChoDuyet.Text = "Không có đơn hàng nào";
            HideButton();
        }

        public void LoadTrangThai()
        {
            if (ddlTrangThai.Items.Count == 0)
            {
                ListItem all = new ListItem();
                all.Text = "Tất cả";
                all.Value = "all";
                ddlTrangThai.Items.Add(all);
                ListItem huy = new ListItem();
                huy.Text = "Đã hủy";
                huy.Value = "dahuy";
                ddlTrangThai.Items.Add(huy);
                ListItem dangGiao = new ListItem();
                dangGiao.Text = "Đang giao";
                dangGiao.Value = "danggiao";
                ddlTrangThai.Items.Add(dangGiao);
                ListItem daGiao = new ListItem();
                daGiao.Text = "Đã giao";
                daGiao.Value = "dagiao";
                ddlTrangThai.Items.Add(daGiao);
                ddlTrangThai.SelectedItem.Value = "all";
            }
        }

        protected void btnXemChiTiet_Click(object sender, EventArgs e)
        {
            string maHD = ((LinkButton)sender).CommandArgument.ToString();
            Session["mahd"] = maHD;
            Server.Transfer("../Admin/ChiTietHoaDon.aspx");
        }

        protected void btnDuyet_Click(object sender, EventArgs e)
        {
            string maHD = ((LinkButton)sender).CommandArgument.ToString();
            string sql = "UPDATE HOADON SET TrangThai = N'Đang giao' WHERE MaHD = '" + maHD + "'";
            connect.InsertDeleteUpdate(sql);
            LoadChoDuyet();
            LoadChung();
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string maHD = ((LinkButton)sender).CommandArgument.ToString();
            string sql1 = "DELETE FROM CTHOADON WHERE MaHD = '" + maHD + "'";
            connect.InsertDeleteUpdate(sql1);
            string sql2 = "DELETE FROM HOADON WHERE MaHD = '" + maHD + "'";
            connect.InsertDeleteUpdate(sql2);
            LoadChoDuyet();
            LoadChung();
        }

        protected void btnDaGiao_Click(object sender, EventArgs e)
        {
            string maHD = ((LinkButton)sender).CommandArgument.ToString();
            string sql = "UPDATE HOADON SET TrangThai = N'Đã giao' WHERE MaHD = '" + maHD + "'";
            connect.InsertDeleteUpdate(sql);
            LoadChoDuyet();
            LoadChung();
        }

        protected void ddlTrangThai_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql;
            if (ddlTrangThai.SelectedItem.Value == "dagiao")
            {
                sql = "SELECT * FROM HOADON WHERE TrangThai = N'Đã giao'";
            }
            else if (ddlTrangThai.SelectedItem.Value == "dahuy")
            {
                sql = "SELECT * FROM HOADON WHERE TrangThai = N'Đã hủy'";
            }
            else if (ddlTrangThai.SelectedItem.Value == "danggiao")
            {
                sql = "SELECT * FROM HOADON WHERE TrangThai = N'Đang giao'";
            }
            else
            {
                sql = "SELECT * FROM HOADON WHERE TrangThai IN (N'Đã giao', N'Đã hủy', N'Đang giao')";
            }
            grdChung.DataSource = connect.getData(sql);
            grdChung.DataBind();
            HideButton();
        }

        protected void grdChoDuyet_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdChoDuyet.PageIndex = e.NewPageIndex;
            LoadChoDuyet();
        }

        protected void grdChung_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void grdChung_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdChung.PageIndex = e.NewPageIndex;
            LoadChung();
        }
    }
}