using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO.Admin
{
    public partial class QLTKe : System.Web.UI.Page
    {
        Connect kn = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Visible = false;
                Calendar2.Visible = false;
            }
            //ThongKe_DT();
            //LoadTK_HD();
            //LoadData();
            
        }
        public void LoadTK_HD()
        {
            string sql = $"select ct.masp,sp.tensp,sum(ct.soluong) as slmua,sum(ct.soluong*ct.gia-(ct.gia*ct.TYLEKM/100)) as thanhtien from HOADON hd,CTHOADON ct,SANPHAM sp where hd.MaHD=ct.MaHD and ct.MaSP=sp.MaSP group by ct.MaSP,sp.TenSP order by sum(ct.soluong*ct.gia-(ct.gia*ct.TYLEKM/100))";  //103->dd/MM/yyy
            DataTable dt = kn.laydata(sql);
            GridView3.DataSource = dt;
            GridView3.DataBind();
        }
        public void LoadData()
        {
            string sql = $@"select ct.masp,sp.tensp,nx.gianhap,nx.giaxuat,nx.soluong,sum(ct.soluong) as slban,(nx.soluong-sum(ct.soluong)) as soluongton,(nx.GiaNhap*nx.SoLuong) as TTNHAPVAO,
                sum(ct.SoLuong*ct.Gia-(ct.Gia*ct.TYLEKM/100)) as TTBANRA,sum(ct.SoLuong*ct.Gia)-(nx.GiaNhap*nx.SoLuong) as DOANHTHU 
                from SANPHAM sp,NHAPXUAT nx,CTHOADON ct,HOADON hd where sp.MaSP=nx.MaSP and hd.MaHD=ct.MaHD and sp.MaSP=ct.MaSP and convert(varchar,hd.NGAYHD,103) BETWEEN '{from_day.Text}' AND '{to_day.Text}' group by  ct.masp,sp.tensp,nx.gianhap,nx.giaxuat,nx.soluong,ct.soluong,sp.soluongton";
            DataTable dt = kn.laydata(sql);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadData();
        }
        public void ThongKe_DT()
        {

            //string sql = @"select sum(soluong) as SOLUONGNHAP from NHAPXUAT 
            //            select sum(soluong) as SOLUONGBAN from CTHOADON select sum(soluong)*sum(gianhap) as TONGNHAP from NHAPXUAT 
            //            select sum(soluong*gia) as TONGBAN from CTHOADON ";
            //DataSet ds = kn.getDataSet(sql);  
            string sql = $@"select nx.gianhap,nx.giaxuat,nx.soluong,sum(ct.soluong) as slban,(nx.soluong-sum(ct.soluong)) as soluongton,(nx.GiaNhap*nx.SoLuong) as TTNHAPVAO,
                sum(ct.SoLuong*ct.Gia-(ct.Gia*ct.TYLEKM/100)) as TTBANRA,sum(ct.SoLuong*ct.Gia)-(nx.GiaNhap*nx.SoLuong) as DOANHTHU 
                from SANPHAM sp,NHAPXUAT nx,CTHOADON ct,HOADON hd where sp.MaSP=nx.MaSP and hd.MaHD=ct.MaHD and sp.MaSP=ct.MaSP and convert(varchar,hd.NGAYHD,103) BETWEEN '{from_day.Text}' AND '{to_day.Text}' group by nx.gianhap,nx.giaxuat,nx.soluong,ct.soluong,sp.soluongton";
            DataTable dt = kn.laydata(sql);
            int nhap = 0;
            int ban = 0;
            long t1 = 0;
            long t2 = 0;
            long dthu = 0;
            foreach (DataRow row in dt.Rows)
            {
                nhap += Convert.ToInt32(row["SOLUONG"].ToString());
                ban += Convert.ToInt32(row["SLBAN"].ToString());
                t1 += Convert.ToInt64(row["TTNHAPVAO"]);
                t2 += Convert.ToInt64(row["TTBANRA"]);
                dthu+= Convert.ToInt64(row["DOANHTHU"]);
            }
            
            string tongnhap = (t1).ToString("#,## đ", CultureInfo.CreateSpecificCulture("vn-VN"));
            string tongban = (t2).ToString("#,## đ", CultureInfo.CreateSpecificCulture("vn-VN"));
            string doanhthu = (dthu).ToString("#,## đ", CultureInfo.CreateSpecificCulture("vn-VN"));

            DataTable dt1 = new DataTable();
            dt1.Columns.Add("SLNHAP");
            dt1.Columns.Add("SLBAN");
            dt1.Columns.Add("TONGNHAP");
            dt1.Columns.Add("TONGBAN");
            dt1.Columns.Add("DOANHTHU");
            dt1.Rows.Add(nhap, ban, tongnhap, tongban, doanhthu);
            GridView2.DataSource = dt1;
            GridView2.DataBind();

        }
        protected void img_calendar_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }
            else
            {
                Calendar1.Visible = true;
            }
            Calendar1.Attributes.Add("style", "position:absolute");

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            from_day.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");           
            Calendar1.Visible = false;
        }

        protected void img_calendar2_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar2.Visible)
            {
                Calendar2.Visible = false;
            }
            else
            {
                Calendar2.Visible = true;
            }
            Calendar2.Attributes.Add("style", "position:absolute");
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            to_day.Text = Calendar2.SelectedDate.ToString("dd/MM/yyyy");
            Calendar2.Visible = false;
        }

        protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView3.PageIndex = e.NewPageIndex;

        }

        protected void btn_loc_Click(object sender, EventArgs e)
        {
            try
            {
                string[] a = from_day.Text.Split('/');
                int from = Convert.ToInt32(a[0]);
                string[] b = to_day.Text.Split('/');
                int to = Convert.ToInt32(b[0]);
                if (Convert.ToInt32(a[1]) > Convert.ToInt32(b[1]))
                {
                    Response.Write("<script>alert('Chọn từ ngày đến ngày cho hợp lệ')</script>");
                    from_day.Text = "";
                    to_day.Text = "";
                    return;
                }
                else if ((to - from) <= 0)
                {
                    Response.Write("<script>alert('Chọn từ ngày đến ngày cho hợp lệ')</script>");
                    from_day.Text = "";
                    to_day.Text = "";
                    return;
                }
               
                    string sql = $"select ct.masp,sp.tensp,sum(ct.soluong) as slmua,sum(ct.soluong*ct.gia-(ct.gia*ct.TYLEKM/100)) as thanhtien from HOADON hd,CTHOADON ct,SANPHAM sp where hd.MaHD=ct.MaHD and ct.MaSP=sp.MaSP and convert(varchar,hd.NGAYHD,103) BETWEEN '{from_day.Text}' AND '{to_day.Text}' group by ct.MaSP,sp.TenSP order by sum(ct.soluong*ct.gia-(ct.gia*ct.TYLEKM/100))";  //103->dd/MM/yyy
                    DataTable dt = kn.laydata(sql);
                    GridView3.DataSource = dt;
                    GridView3.DataBind();
                    LoadData();
                    ThongKe_DT();
                    from_day.Text = "";
                    to_day.Text = "";

        }
            catch { }
            
        }

        protected void btn_huy_Click(object sender, EventArgs e)
        {
            LoadTK_HD();
        }
    }
}