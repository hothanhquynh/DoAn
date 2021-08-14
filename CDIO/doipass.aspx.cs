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
    public partial class doipass : System.Web.UI.Page
    {
        Connect kn = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
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
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Server.Transfer("Home.aspx");
        }

        protected void btnsavemk_Click(object sender, EventArgs e)
        {
            kn.layketnoi();
            string passcu = kn.mahoa(mkcu.Text);
            string sql = "SELECT * FROM TAIKHOAN WHERE MATKHAU='" + passcu + "'";
            DataTable dt = kn.laydata(sql);
            if (dt.Rows.Count > 0)
            {
                kn.layketnoi();
                string passmoi = kn.mahoa(mkmoi.Text);
                string sql1 = "UPDATE TAIKHOAN SET MATKHAU='" + passmoi + "' WHERE TENDANGNHAP='" + Session["tendangnhap"].ToString() + "'";
                SqlCommand command1 = kn.command(sql1);
                int i = command1.ExecuteNonQuery();
                if (i == 1)
                {
                    Response.Write("<script>alert('Đổi mật khẩu thành công')</script>");
                    mkcu.Text = "";
                    mkmoi.Text = "";
                    xnmk.Text = "";
                }

            }
            else
            {
                Response.Write("<script>alert('Mật khẩu cũ chưa chính xác!')</script>");
            }
            kn.dongketnoi();
        }
    }
}