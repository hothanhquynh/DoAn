using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO
{
    public partial class Login : System.Web.UI.Page
    {
        Connect kn = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.Cookies["ghinho"] != null) ghinho.Checked = true;
            if (Page.IsPostBack == false) //Kiem tra trang va Luu du lieu maxn
            {
                Random random = new Random();
                ViewState["maxn"] = captcha.Text = random.Next(10000, 99999).ToString();
            }
            //if (Request.Cookies["tk"] != null)
            //{
            //    email_login.Text = Request.Cookies["tk"].Value.ToString();
            //    pass_login.Text = Request.Cookies["mk"].Value.ToString();
            //    ghinho.Checked = true;
            //}
        }
        protected void login_Click(object sender, EventArgs e)
        {
            if (maxn_login.Text.ToString() == ViewState["maxn"].ToString())
            {
                kn.layketnoi();
                string passmahoa = kn.mahoa(pass_login.Text);
                string query = "SELECT * FROM TAIKHOAN WHERE TENDANGNHAP='" + email_login.Text.ToString() + "' AND MATKHAU='" + passmahoa + "'";
                //SqlCommand command = kn.command(query);
                //SqlDataReader reader = kn.reader(query);
                //if (reader.Read())
                //{
                //    reader.Close();
                //    Response.Write("<script>alert('Đăng nhập thành công!')</script>");
                //}
                //else
                //{
                //    reader.Close();
                //    Response.Write("<script>alert('Tên đăng nhập hoặc mật khẩu không chính xác!')</script>");
                //}
                DataTable dt = kn.laydata(query);
                if (dt.Rows.Count != 0)
                {
                    DataView view = new DataView(dt);
                    view.RowFilter = "MALOAI = 1";
                    if (view.Count != 0)
                    {
                        view.RowFilter = "TRANGTHAI = False";
                        if (view.Count != 0) Response.Write("<script>alert('Tài khoản đã bị khóa')</script>");
                        else
                        {
                            //if (ghinho.Checked)
                            //{
                            //    Response.Cookies["tk"].Value = email_login.Text.ToString();
                            //    Response.Cookies["mk"].Value = pass_login.Text.ToString();
                            //    ghinho.Checked = true;
                            //}
                            //else
                            //{
                            //    Response.Cookies["tk"].Expires = DateTime.Now.AddDays(-1);
                            //    Response.Cookies["mk"].Expires = DateTime.Now.AddDays(-1);
                            //}
                            Session["name"] = dt.Rows[0]["HOTEN"];
                            Session["tendangnhap"] = email_login.Text.ToString();
                            Server.Transfer("./Admin/Admin.aspx");
                        }
                    }
                    else
                    {
                        view.RowFilter = "TRANGTHAI = False";
                        if (view.Count != 0) Response.Write("<script>alert('Tài khoản đã bị khóa')</script>");
                        else
                        {
                            //if (ghinho.Checked)
                            //{
                            //    Response.Cookies["tk"].Value = email_login.Text.ToString();
                            //    Response.Cookies["mk"].Value = pass_login.Text.ToString();
                            //  //  Response.Cookies["ghinho"].Value = "true";
                            //}
                            //else
                            //{
                            //    //Response.Cookies["tk"].Value = null;
                            //    //Response.Cookies["mk"].Value = null;
                            //    //Response.Cookies["ghinho"].Value = null;
                            //    Response.Cookies["tk"].Expires = DateTime.Now.AddDays(-1);
                            //    Response.Cookies["mk"].Expires = DateTime.Now.AddDays(-1);
                            //}
                            Session["name"] = dt.Rows[0]["HOTEN"];
                            Session["tendangnhap"] = email_login.Text.ToString();
                            if (Session["danhgia"]!=null)   //Kiem tra co phai tu trang danh gia 
                            {
                                Response.Redirect("Product-detail.aspx?MaSP=" + Session["danhgia"].ToString());
                                Session["danhgia"] = null;
                            }
                            if (Session["checkout"] != null)   //Kiem tra co phai tu trang mua hang 
                            {
                                Server.Transfer("ShoppingCart.aspx");
                                Session["checkout"] = null;
                            }

                            Server.Transfer("Home.aspx");
                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Tên đăng nhập hoặc mật khẩu không chính xác')</script>");
                }
                kn.dongketnoi();
            }
            else Response.Write("<script>alert('Mã xác nhận không chính xác!')</script>");

        }

        protected void lblquenpass_Click(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}