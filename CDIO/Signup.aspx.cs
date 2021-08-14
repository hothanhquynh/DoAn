using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO
{
    public partial class Signup : System.Web.UI.Page
    {
        Connect kn = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            Youremail.Focus();
        }
        protected void signup_Click(object sender, EventArgs e)
        {

            try
            {
                kn.layketnoi();
                if (maxn.Text.ToString() == ViewState["Captcha"].ToString())

                {
                    string query = "SELECT TENDANGNHAP FROM TAIKHOAN WHERE TENDANGNHAP='" + Youremail.Text.ToString() + "'";

                    SqlCommand command = kn.command(query);
                    SqlDataReader reader = kn.reader(query);

                    if (reader.Read())
                    {
                        reader.Close();
                        Response.Write("<script>alert('Email đã tồn tại!')</script>");
                        maxn.Text = "";
                        Youremail.Text = "";
                        Youremail.Focus();
                    }
                    else
                    {
                        reader.Close();
                        string query1 = "INSERT INTO TAIKHOAN(TENDANGNHAP,MATKHAU,HOTEN,SDT,EMAIL,MALOAI,TRANGTHAI) VALUES('" + Youremail.Text.Trim() + "','" + kn.mahoa(Pass.Text.Trim()) + "',N'" + txtten.Text.Trim() + "','" + SDT.Text.Trim() + "','" + Youremail.Text.Trim() + "','2','1')";
                        kn.layketnoi();
                        SqlCommand command1 = kn.command(query1);
                        int i = command1.ExecuteNonQuery();
                        if (i == 1)
                        {
                            Response.Write("<script>alert('Đăng ký thành công')</script>");
                            maxn.Text = "";
                            Pass.Text = "";
                            Youremail.Text = "";
                            SDT.Text = "";
                            txtten.Text = "";
                            Server.Transfer("Login.aspx");
                        }
                        else Response.Write("<script>alert('Đăng ký không thành công')</script>");
                    }
                    kn.dongketnoi();
                }
                else Response.Write("<script>alert('Mã xác nhận không chính xác!')</script>");
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void sendma_Click(object sender, EventArgs e)
        {

            maxn.ReadOnly = false;
            Random r = new Random();
            ViewState["Captcha"] = r.Next(10000, 99999).ToString();
            SmtpClient client = new SmtpClient();
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("mailconfirm2000@gmail.com", "abc@12345678");
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("mailconfirm2000@gmail.com");
            mail.To.Add(Youremail.Text.Trim());
            mail.Subject = "Send's mail";
            mail.Body = "Mã xác nhận của bạn là: " + ViewState["Captcha"].ToString();
            try
            {
                client.Send(mail);
                thongbao.Text = "Mã xác nhận đã gửi về mail của bạn!";
            }
            catch
            {
                thongbao.Text = "Gửi không thành công!";
            }

        }
    }
}