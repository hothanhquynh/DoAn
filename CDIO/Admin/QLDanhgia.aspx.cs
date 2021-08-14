using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO.Admin
{
    public partial class QLDanhgia : System.Web.UI.Page
    {
        Connect connect = new Connect();
       
        protected void Page_Load(object sender, EventArgs e)
        {           
            if(!IsPostBack)
            {
                Calendar1.Visible = false;
                Calendar2.Visible = false;
            }
            LoadData();
        }
        public void LoadData()
        {
            DataTable dt = connect.laydata("select * from DANHGIA");
            gvdanhgia.DataSource = dt;
            gvdanhgia.DataBind();
        }
        protected void gvdanhgia_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtma.Text = gvdanhgia.SelectedRow.Cells[6].Text;
            txtten.Text = HttpUtility.HtmlDecode(gvdanhgia.SelectedRow.Cells[2].Text); //Http...format unicode
            txtcontent.Value = HttpUtility.HtmlDecode(gvdanhgia.SelectedRow.Cells[4].Text);
            txtsao.Text = gvdanhgia.SelectedRow.Cells[3].Text;
            txtngay.Text = gvdanhgia.SelectedRow.Cells[5].Text;
            Session["MaDG"]= gvdanhgia.SelectedRow.Cells[0].Text;
        }

        protected void btnxoa_Click(object sender, EventArgs e)
        {
            if (txtten.Text == "")
            {
                Response.Write("<script>alert('Vui lòng nhấn nút Chọn trước khi xóa')</script>");
                return;
            }
            
            else
            {
                try
                {
                    connect.layketnoi();
                    string madg = "";
                    if (Session["MaDG"] != null) madg = Session["MaDG"].ToString();
                    SqlCommand cmd = connect.command("delete DANHGIA WHERE MADG=@MADG");
                    cmd.Parameters.AddWithValue("@MADG", madg);
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {

                        txtma.Text = "";
                        txtcontent.Value = "";
                        txtngay.Text = "";
                        txtsao.Text = "";
                        txtten.Text = "";
                    }
                    LoadData();
                }
                catch { }
                
            }
            
        }
        protected void btnloc_Click(object sender, EventArgs e)
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
                string sql = $"select * from DANHGIA where convert(varchar,NGAYDG,103) BETWEEN '{from_day.Text}' AND '{to_day.Text}' order by NgayDG";  //103->dd/MM/yyy
                DataTable dt = connect.laydata(sql);
                gvdanhgia.DataSource = dt;
                gvdanhgia.DataBind();
                from_day.Text = "";
                to_day.Text = "";
            }
            catch { }
           
        }

        protected void btnhuyloc_Click(object sender, EventArgs e)
        {
            LoadData();
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if(e.Day.IsOtherMonth)      //Chỉ được chọn ngày trong tháng đó
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void img_calendar_Click(object sender, ImageClickEventArgs e)
        {
            if(Calendar1.Visible)
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

        protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth)      //Chỉ được chọn ngày trong tháng đó
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void gvdanhgia_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void gvdanhgia_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvdanhgia.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}