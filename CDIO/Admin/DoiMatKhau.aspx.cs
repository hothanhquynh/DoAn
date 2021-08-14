using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO.Admin
{
    public partial class DoiMatKhau : System.Web.UI.Page
    {
        Connect db = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_data();
                TextBox1.Enabled = false;
            }
        }
        public void load_data()
        {
            String sql = "select *from TAIKHOAN where TenDangNhap=@TenDangNhap";
            DataSet ds = db.getDataSet(sql, new object[] { "TenDangNhap" }, new object[] { Request.QueryString["TenDangNhap"] });
            if (ds.Tables[0].Rows.Count > 0)
            {
                TextBox1.Text = ds.Tables[0].Rows[0]["TenDangNhap"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            object ma = db.execScalar("select MatKhau from TaiKhoan where TenDangNhap=@TenDangNhap", new object[] { "TenDangNhap" }, new object[] { TextBox1.Text });
            if (ma + "" != db.mahoa(TextBox4.Text))
            {
                Response.Write("<script>alert('Mật khẩu cũ không đúng!')</script>");
                return;
            }
            else if (TextBox2.Text == "" || TextBox3.Text == "" || TextBox4.Text == "")
            {
                Response.Write("<script>alert('Phải nhập thông tin đầy đủ!')</script>");
                return;
            }
            else if (TextBox3.Text != TextBox2.Text)
            {
                Response.Write("<script>alert('Mật khẩu xác nhận không khớp!')</script>");
                return;
            }
            else
            {
                String sql = "update TAIKHOAN set MatKhau=@MatKhau where TenDangNhap=@TenDangNhap";
                int res = db.execNonQuery(sql, new object[] { "MatKhau", "TenDangNhap" }, new object[] { db.mahoa(TextBox2.Text), TextBox1.Text });
                if (res > 0)
                {
                    Response.Write("<script>alert('Đổi mật khẩu thành công!')</script>");
                    return;
                }
                else
                {
                    Response.Write("<script>alert('Lỗi!')</script>");
                    return;
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Server.Transfer("../Admin/QLTK.aspx");
        }
    }
}