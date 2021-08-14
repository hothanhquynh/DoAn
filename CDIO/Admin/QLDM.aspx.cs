using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO.Admin
{
    public partial class QLDM : System.Web.UI.Page
    {
        Connect db = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            load_data();
        }
        public void load_data()
        {
            String sql = "Select *from DANHMUC";
            DataSet ds = db.getDataSet(sql, null, null);
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataMember = "";
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FileUpload f = (FileUpload)FormView1.FindControl("FileUpload2");
            String path = Server.MapPath("~/assets/img/img_home/img_product/");
            f.SaveAs(path + f.FileName);

            String sql = "Select MaHang from DANHMUC where MaHang=@MaHang";
            object ma = db.execScalar(sql, new object[] { "MaHang" }, new object[] { TextBox1.Text });
            if (TextBox1.Text == "" || TextBox2.Text == "")
            {
                Response.Write("<script>alert('Bạn chưa nhập đầy đủ!')</script>");
                return;
            }
            if (ma + "" != "")
            {
                Response.Write("<script>alert('Mã đã tồn tại!')</script>");
                TextBox1.Text = "";
                return;
            }
            else
            {
                String sql1 = "insert into DANHMUC(MAHANG,TENHANG,HINHANH) values(@MaHang,@TenHang,@HinhAnh)";
                int i = db.execNonQuery(sql1, new object[] { "MaHang", "TenHang","HinhAnh" }, new object[] { TextBox1.Text, TextBox2.Text,f.FileName });
                if (i == 0)
                {
                    Response.Write("<script>alert('Thêm thất bại!')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Thêm thành công!')</script>");
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                }
            }
            load_data();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            TextBox1.Text = row.Cells[0].Text;
            TextBox2.Text = row.Cells[1].Text;
            TextBox1.Enabled = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            FileUpload f = (FileUpload)FormView1.FindControl("FileUpload2");
            String path = Server.MapPath("~/assets/img/img_home/img_product/");
            f.SaveAs(path + f.FileName);
            if (TextBox2.Text == "")
            {
                Response.Write("<script>alert('Bạn chưa nhập tên hàng!')</script>");
                return;
            }
            else
            {
                String sql1 = "update DANHMUC set TenHang=@TenHang,HinhAnh=@HinhAnh where MaHang=@MaHang";
                int i = db.execNonQuery(sql1, new object[] { "TenHang", "MaHang","HinhAnh" }, new object[] { TextBox2.Text, TextBox1.Text,f.FileName });
                if (i == 0)
                {
                    Response.Write("<script>alert('Cập nhật thất bại!')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Cập nhật thành công!')</script>");
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox1.Enabled = true;
                }
            }
            load_data();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            String sql = "delete from DANHMUC where MaHang=@MaHang";
            int i = db.execNonQuery(sql, new object[] { "MaHang" }, new object[] { TextBox1.Text });
            if (i == 0)
            {
                Response.Write("<script>alert('Xóa thất bại!')</script>");
            }
            else
            {
                Response.Write("<script>alert('Xóa thành công!')</script>");
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox1.Enabled = true;
            }
            load_data();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox1.Enabled = true;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            load_data();
        }
    }
}