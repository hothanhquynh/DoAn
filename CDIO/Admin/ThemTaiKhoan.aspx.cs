using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO.Admin
{
    public partial class ThemTaiKhoan : System.Web.UI.Page
    {
        Connect kn = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NapDropDL();
                RadioButtonList1.SelectedValue = "Nam";
                Label11.Text = "True";
                Label11.Visible = false;
                DropDownList1.SelectedIndex = 1;
                Label12.Text = "2";
                Label12.Visible = false;
                RadioButtonList2.SelectedValue = "Mở";
                Label13.Text = "True";
                Label13.Visible = false;
            }
        }

        void NapDropDL()
        {
            DropDownList1.DataSource = kn.getDataSet("Select *from LOAITK");
            DropDownList1.DataValueField = "MaLoai";
            DropDownList1.DataTextField = "TenLoai";
            DropDownList1.DataBind();
        }
        public int kt_trumgma()
        {
            String sql = "Select TenDangNhap from TAIKHOAN where TenDangNhap =@TenDangNhap";
            object ma = kn.execScalar(sql, new object[] { "TenDangNhap" }, new object[] { txttdn.Text });
            if (ma + "" == txttdn.Text)
            {
                return 1;
            }
            return 0;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txttdn.Text == "" || txtmk.Text == "")
            {
                Response.Write("<script>alert('Bạn chưa nhập mật khẩu hoặc tên đăng nhập !')</script>");
                return;
            }
            else if (kt_trumgma() == 1)
            {
                Response.Write("<script>alert('Tên đăng nhập bị trùng.Mời bạn nhập tên khác !')</script>");
                return;
            }
            else
            {
                String sql1 = "insert into  TAIKHOAN values(@TenDangNhap,@MatKhau,@HoTen,@GioiTinh,@SDT,@Email,@DiaChi,@MaLoai,@TrangThai)";
                int res = kn.execNonQuery(sql1, new object[] { "TenDangNhap", "MatKhau", "HoTen", "GioiTinh", "SDT", "Email", "DiaChi", "MaLoai", "TrangThai" },
                    new object[] { txttdn.Text, kn.mahoa(txtmk.Text), txtht.Text, Label11.Text, txtsdt.Text, txtemail.Text, txtdc.Text, Label12.Text, Label13.Text });
                if (res > 0)
                {
                    Response.Write("<script>alert('Thêm thành công!')</script>");
                    return;
                }
                else
                {
                    Response.Write("<script>alert('Lỗi!')</script>");
                    return;
                }
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue.Equals("Nam"))
            {
                Label11.Text = "True";
            }
            else
            {
                Label11.Text = "False";
            }
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex.ToString() == "0")
            {
                Label12.Text = "1";
            }
            else
            {
                Label12.Text = "2";
            }
        }

        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList2.SelectedValue.Equals("Mở"))
            {
                Label13.Text = "True";

            }
            else
            {
                Label13.Text = "False";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Server.Transfer("../Admin/QLTK.aspx");
        }
    }
}