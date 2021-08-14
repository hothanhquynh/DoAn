using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO
{
    public partial class Quenpass : System.Web.UI.Page
    {
        Connect kn = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void quenmk_Click(object sender, EventArgs e)
        {
            //Tao pass
            string str = "abcdefghijklmnopqrstuvwxyz0123456789";
            Random random = new Random();
            int randomCharIndex = 0;
            char randomChar;
            string passmoi = "";
            for (int i = 0; i < 8; i++)
            {
                randomCharIndex = random.Next(0, str.Length);
                randomChar = str[randomCharIndex];
                passmoi += Convert.ToString(randomChar);
            }
            //Send pass
            try
            {
                SmtpClient client = new SmtpClient();
                client.Port = 587;
                client.Host = "smtp.gmail.com";
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("mailconfirm2000@gmail.com", "abc@12345678");
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("mailconfirm2000@gmail.com");
                mail.To.Add(email_quenpass.Text.Trim());
                mail.Subject = "Send's mail";
                mail.Body = "Mật khẩu mới của bạn là: " + passmoi + "\nVui lòng đổi mật khẩu khi đăng nhập thành công để bảo mật tài khoản của bạn";
                try
                {
                    client.Send(mail);

                }
                catch
                {
                    Response.Write("<script>alert('Lỗi gửi mail')</script>");
                }
            }
            catch { }
            //Update pass
            kn.layketnoi();
            string sql = "SELECT * FROM TAIKHOAN WHERE TENDANGNHAP='" + email_quenpass.Text.ToString() + "'";
            DataTable dt = kn.laydata(sql);
            if (dt.Rows.Count != 0)
            {
                kn.layketnoi();
                string passmahoa = kn.mahoa(passmoi);
                string sql1 = "UPDATE TAIKHOAN SET MATKHAU='" + passmahoa + "' WHERE TENDANGNHAP='" + email_quenpass.Text.ToString() + "'";
                SqlCommand command1 = kn.command(sql1);
                int i = command1.ExecuteNonQuery();
                if (i == 1)
                    Response.Write("<script>alert('Mật khẩu mới đã gửi vào email của bạn')</script>");

            }
            else Response.Write("<script>alert('Tên đăng nhập không chính xác')</script>");
            kn.dongketnoi();
            Server.Transfer("Login.aspx");
        }

    }
}