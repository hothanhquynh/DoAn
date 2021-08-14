using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO
{
    public partial class user_info : System.Web.UI.Page
    {
        Connect kn = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtdangnhap.Enabled = false;
            if (Session["tendangnhap"] != null)
            {
                signin_user.Visible = false;
                signup_user.Visible = false;
                hello_user.Visible = true;
                // thoat.Visible = true;
                try
                {
                    lbl_hello_user.Text = "Xin chào, " + Session["name"].ToString();
                    name.Text = Session["name"].ToString();
                    //    lbl_thoat.Text = "Thoát";
                }
                catch { }
            }
            else
            {
                signin_user.Visible = true;
                signup_user.Visible = true;
            }
            if (Page.IsPostBack == false)
            {
                txtdangnhap.Text = Session["tendangnhap"].ToString();
                txtemail.Text = Session["tendangnhap"].ToString();
                kn.layketnoi();
                string sql = "SELECT * FROM TAIKHOAN WHERE TENDANGNHAP='" + Session["tendangnhap"].ToString() + "'";
                DataTable dt = kn.laydata(sql);
                sdt.Text = dt.Rows[0]["SDT"].ToString();
                txthoten.Text = dt.Rows[0]["HOTEN"].ToString();
                txtdiachi.Text = dt.Rows[0]["DIACHI"].ToString();
                string gt = dt.Rows[0]["GIOITINH"].ToString();
                if (gt.Equals("true")) sex.SelectedIndex = 0;
                if (gt.Equals("false")) sex.SelectedIndex = 1;
                kn.dongketnoi();
            }

        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Home.aspx");
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {

            kn.layketnoi();
            int gt;
            string phai = sex.SelectedValue.ToString();
            if (phai.Equals("Nam")) gt = 1;
            else gt = 0;
            string sql1 = "UPDATE TAIKHOAN SET HOTEN=N'" + txthoten.Text.ToString() + "',SDT='" + sdt.Text.ToString() + "',EMAIL='" + txtemail.Text.ToString() + "',DIACHI=N'" + txtdiachi.Text.ToString() + "',GIOITINH=" + gt + " WHERE TENDANGNHAP='" + txtdangnhap.Text.ToString() + "'";
            SqlCommand cm = kn.command(sql1);
            int i = cm.ExecuteNonQuery();
            if (i == 1) Response.Write("<script>alert('Lưu thành công')</script>");
            else Response.Write("<script>alert('Lưu thất bại!')</script>");
            kn.dongketnoi();
        }

    }
}