using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO.Admin
{
    public partial class QLKM : System.Web.UI.Page
    {
        Connect kn = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Visible = false;
                Calendar2.Visible = false;
                LoadData();
            }
            
        }
        public void LoadData()
        {
            string sql = "select * from KHUYENMAI";
            DataTable dt = kn.laydata(sql);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(DropDownList1.SelectedValue.Equals("0"))
            {
                string sql = "select * from KHUYENMAI";
                DataTable dt = kn.laydata(sql);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            if (DropDownList1.SelectedValue.Equals("1"))
            {
                string sql = "select * from KHUYENMAI where TRANGTHAI=N'Đang khuyến mãi'";
                DataTable dt = kn.laydata(sql);
                GridView1.DataSource = null;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            if (DropDownList1.SelectedValue.Equals("2"))
            {
                string sql = "select * from KHUYENMAI where TRANGTHAI=N'Chưa khuyến mãi'";
                DataTable dt = kn.laydata(sql);
                GridView1.DataSource = null;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            if (DropDownList1.SelectedValue.Equals("3"))
            {
                string sql = "select * from KHUYENMAI where TRANGTHAI=N'Ngừng khuyến mãi'";
                DataTable dt = kn.laydata(sql);
                GridView1.DataSource = null;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btn_them_Click(object sender, EventArgs e)
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
                object ma = kn.execScalar("select MAKM from KHUYENMAI where MAKM=@MA", new object[] { "MA" }, new object[] { txtma.Text });
                if (ma + "" != "")
                {
                    Response.Write("<script>alert('Mã khuyến mãi đã tồn tại!')</script>");
                }
                else
                {
                    string sql = "insert into KHUYENMAI values(@MA,N'"+txtten.Text+"',@TUNGAY,@DENNGAY,N'Chưa khuyến mãi')";
                    int res = kn.execNonQuery(sql, new object[] { "MA", "TUNGAY", "DENNGAY"}, new object[] { txtma.Text,Convert.ToDateTime(from_day.Text), Convert.ToDateTime(to_day.Text)});
                   
                    
                    if (res > 0) Response.Write("<script>alert('Thêm khuyến mãi thành công!')</script>");
                    Lammoi();
                    //Update khuyen mai
                    CDIO.KM km = new CDIO.KM();
                    km.KhuyenMai();
                    LoadData();
                }
            }
            catch { }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadData();
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
        
        public void Lammoi()
        {
            txtma.Text = "";        
            txtten.Text = ""; 
            
           
            from_day.Text = "";
            to_day.Text = "";
        }
        protected void lblxoa_Click(object sender, EventArgs e)
        {
                
                string makm = ((LinkButton)sender).CommandArgument;
                //Update khuyen mai
                string query = @"select ct.masp,ct.tylekm from CTKHUYENMAI ct,SANPHAM sp,KHUYENMAI km where ct.MaKM=km.MaKM
                            and ct.MaSP = sp.MaSP";
                DataTable dataTable1 = kn.laydata(query);
                foreach (DataRow row in dataTable1.Rows)
                {
                    string query1 = $"UPDATE SANPHAM set TYLEKM=0 where MASP={row["MASP"]}";
                    kn.execNonQuery(query1);
                }
            string sql = "delete from KHUYENMAI where MAKM=@MA";
                string sql1 = "delete from CTKHUYENMAI where MAKM=@MA";
                kn.execNonQuery(sql1, new object[] { "MA" }, new object[] { makm });
                kn.execNonQuery(sql, new object[] { "MA" }, new object[] { makm });
                
                 LoadData();
           
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            txtma.Text = row.Cells[0].Text;
            txtten.Text = HttpUtility.HtmlDecode(row.Cells[1].Text);
        
            from_day.Text = row.Cells[2].Text; ;
            to_day.Text = row.Cells[3].Text; ;
           
        }

        protected void btn_sua_Click(object sender, EventArgs e)
        {
            if(txtma.Text=="")
                Response.Write("<script>alert('Vui lòng chọn mã khuyến mãi cần sửa!')</script>");
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
            string sql = "update KHUYENMAI set TENKM=N'"+txtten.Text+"',TUNGAY=@TUNGAY,DENNGAY=@DENNGAY where MAKM=@MA";
           
            int res = kn.execNonQuery(sql, new object[] { "MA", "TUNGAY", "DENNGAY" }, new object[] { txtma.Text, Convert.ToDateTime(from_day.Text), Convert.ToDateTime(to_day.Text) });
            
            if (res > 0) Response.Write("<script>alert('Sửa khuyến mãi thành công!')</script>");
            CDIO.KM km = new CDIO.KM();
            km.KhuyenMai();
            Lammoi();
            LoadData();
        }

        protected void lblxem_Click(object sender, EventArgs e)
        {
            string makm = ((LinkButton)sender).CommandArgument;
            Context.Items["MaKM"] = makm;
            Server.Transfer("../Admin/ThemKM.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string makm = ((LinkButton)sender).CommandArgument;
            string sql = "update KHUYENMAI set TRANGTHAI=N'Ngừng khuyến mãi' where MAKM='"+makm+"'";

            int res = kn.execNonQuery(sql);

            if (res > 0) Response.Write("<script>alert('Sửa khuyến mãi thành công!')</script>");
            
            LoadData();
        }
    }
}