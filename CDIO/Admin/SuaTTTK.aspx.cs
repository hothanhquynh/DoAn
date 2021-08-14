using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO.Admin
{
    public partial class SuaTTTK : System.Web.UI.Page
    {
        Connect db = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load_droplist();
                load_data();
                txttdn.Enabled = false;
                Label16.Visible = false;
                Label17.Visible = false;
                Label18.Visible = false;
            }
        }
        public void load_droplist()
        {
            DropDownList1.DataSource = db.getDataSet("Select *from LOAITK");
            DropDownList1.DataValueField = "MaLoai";
            DropDownList1.DataTextField = "TenLoai";
            DropDownList1.DataBind();
        }
        public void load_data()
        {
            String sql = "select *from TAIKHOAN where TenDangNhap=@TenDangNhap";
            DataSet ds = db.getDataSet(sql, new object[] { "TenDangNhap" }, new object[] { Request.QueryString["TenDangNhap"] });
            if (ds.Tables[0].Rows.Count > 0)
            {
                txttdn.Text = ds.Tables[0].Rows[0]["TenDangNhap"].ToString();
                txtht.Text = ds.Tables[0].Rows[0]["HoTen"].ToString();
                txtsdt.Text = ds.Tables[0].Rows[0]["SDT"].ToString();
                txtemail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                txtdc.Text = ds.Tables[0].Rows[0]["DiaChi"].ToString();


                if (ds.Tables[0].Rows[0]["GioiTinh"].ToString() == "True")
                {
                    RadioButtonList1.SelectedValue = "Nam";
                    Label16.Text = "True";
                }
                else
                {
                    RadioButtonList1.SelectedValue = "Nữ";
                    Label16.Text = "False";
                }


                if (ds.Tables[0].Rows[0]["TrangThai"].ToString() == "True")
                {
                    RadioButtonList2.SelectedValue = "Mở";
                    Label18.Text = "True";
                }
                else
                {
                    RadioButtonList2.SelectedValue = "Khóa";
                    Label18.Text = "False";
                }



                if (ds.Tables[0].Rows[0]["MaLoai"].ToString() == "1")
                {
                    DropDownList1.SelectedIndex = 0;
                    Label17.Text = "1";
                }
                else
                {
                    DropDownList1.SelectedIndex = 1;
                    Label17.Text = "2";
                }
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue.Equals("Nam"))
            {
                Label16.Text = "True";
            }
            else
            {
                Label16.Text = "False";
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex.ToString() == "0")
            {
                Label17.Text = "1";
            }
            else
            {
                Label17.Text = "2";
            }
        }

        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList2.SelectedValue.Equals("Mở"))
            {
                Label18.Text = "True";

            }
            else
            {
                Label18.Text = "False";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String sql = "update TAIKHOAN set HoTen=@Hoten,GioiTinh=@GioiTinh,SDT=@SDT,Email=@Email,DiaChi=@DiaChi,MaLoai=@MaLoai,TrangThai=@TrangThai where TenDangNhap=@TenDangNhap";
            int res = db.execNonQuery(sql, new object[] { "HoTen", "GioiTinh", "SDT", "Email", "DiaChi", "MaLoai", "TrangThai", "TenDangNhap" },
                                new object[] { txtht.Text, Label16.Text, txtsdt.Text, txtemail.Text, txtdc.Text, Label17.Text, Label18.Text, txttdn.Text });
            if (res > 0)
            {
                Response.Write("<script>alert('Cập nhật thành công!')</script>");
                load_data();
                return;
            }
            else
            {
                Response.Write("<script>alert('Lỗi!')</script>");
                return;
            }
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            Server.Transfer("../Admin/QLTK.aspx");
        }
    }
}