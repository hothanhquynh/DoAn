using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO
{
    public partial class Checkout : System.Web.UI.Page
    {
        Connect kn = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (Session["Cart"] != null)
                {
                    ShoppingCartActions cart = (ShoppingCartActions)Session["Cart"];
                    LoadCart(cart);
                }
               
                kn.layketnoi();
                string sql = "SELECT * FROM TAIKHOAN WHERE TENDANGNHAP='" + Session["tendangnhap"].ToString() + "'";
                DataTable dt = kn.laydata(sql);
                sdt.Text = dt.Rows[0]["SDT"].ToString();
                txthoten.Text = dt.Rows[0]["HOTEN"].ToString();
                txtdiachi.Text = dt.Rows[0]["DIACHI"].ToString();
                
                kn.dongketnoi();
            }

        }
        public void LoadCart(ShoppingCartActions cart)
        {
            this.GridView1.DataSource = cart.GetCartItems();
            this.GridView1.DataBind();
            if (this.GridView1.Rows.Count != 0)
            {
                this.GridView1.FooterRow.Cells[5].Text = "Tổng tiền";
                this.GridView1.FooterRow.Cells[5].Font.Bold = true;
                this.GridView1.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Center;
                this.GridView1.FooterRow.Cells[5].VerticalAlign = VerticalAlign.Middle;

                this.GridView1.FooterRow.Cells[6].Font.Bold = true;
                this.GridView1.FooterRow.Cells[6].HorizontalAlign = HorizontalAlign.Center;
                this.GridView1.FooterRow.Cells[6].VerticalAlign = VerticalAlign.Middle;
                this.GridView1.FooterRow.Cells[6].ForeColor = System.Drawing.Color.Red;
                this.GridView1.FooterRow.Cells[6].Font.Size = 22;
                this.GridView1.FooterRow.Cells[6].Text = TinhTongTien().ToString("C0", CultureInfo.CreateSpecificCulture("vn-VN"));
               

            }
            foreach (GridViewRow row in this.GridView1.Rows)
            {
                row.Cells[3].Text = float.Parse(row.Cells[3].Text.ToString()).ToString("C0", CultureInfo.CreateSpecificCulture("vn-VN"));
                row.Cells[6].Text = float.Parse(row.Cells[6].Text.ToString()).ToString("C0", CultureInfo.CreateSpecificCulture("vn-VN"));
            }
            lblTotalAmount.Text = "Shopping Cart (" + CalcTotalAmount() + " items)";

        }

        public int CalcTotalAmount()
        {
            int sum = 0;
            ShoppingCartActions cart = (ShoppingCartActions)Session["Cart"];
            DataTable table = cart.GetCartItems();
            for (int i = 0; i < table.Rows.Count; i++)
            {
                sum++;
            }
            return sum;
        }

        public float TinhTongTien()
        {
            float total = 0;
            ShoppingCartActions cart = (ShoppingCartActions)Session["Cart"];
            DataTable table = cart.GetCartItems();
            for (int i = 0; i < table.Rows.Count; i++)
            {
                total += float.Parse(table.Rows[i]["ThanhTien"].ToString());
            }
            return total;
        }

        protected void btn_dathang_Click(object sender, EventArgs e)
        {
            //try
            //{

                kn.layketnoi();
                string sql = "insert into HOADON(TENDANGNHAP,SOLUONG,NGAYHD,TRANGTHAI) VALUES(@TEN,@SL,@NGAY," + "N'Chờ duyệt')";
                SqlCommand cmd = kn.command(sql);
                cmd.Parameters.AddWithValue("@TEN", Session["tendangnhap"].ToString());
                cmd.Parameters.AddWithValue("@SL", CalcTotalAmount());
                cmd.Parameters.AddWithValue("@NGAY", DateTime.Now.Date);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    kn.layketnoi();
                    SqlCommand cmd1 = kn.command("update TAIKHOAN set HOTEN=@TEN,SDT=@SDT,DIACHI=@DIACHI WHERE TENDANGNHAP=@TENDANGNHAP");
                    cmd1.Parameters.AddWithValue("@TENDANGNHAP", Session["tendangnhap"].ToString());
                    cmd1.Parameters.AddWithValue("@TEN", txthoten.Text);
                    cmd1.Parameters.AddWithValue("@SDT", sdt.Text);
                    cmd1.Parameters.AddWithValue("@DIACHI", txtdiachi.Text);
                    cmd1.ExecuteNonQuery();
                    SqlCommand cmd2 = kn.command("select top 1 MAHD from HOADON order by MAHD DESC");
                    int ma = Convert.ToInt32(cmd2.ExecuteScalar());
                    foreach (GridViewRow row in this.GridView1.Rows)
                    {
                        string[] a = row.Cells[4].Text.Split('%');  //Xử lý cột khuyến mại do format                        
                        kn.layketnoi();
                        SqlCommand cmd3 = kn.command("insert into CTHOADON VALUES(@MAHD, @MASP, @TEN, @GIA, @KM, @SL)");
                        cmd3.Parameters.AddWithValue("@MAHD", ma);
                        cmd3.Parameters.AddWithValue("@MASP", row.Cells[1].Text.ToString());
                        cmd3.Parameters.AddWithValue("@TEN", txthoten.Text);
                        cmd3.Parameters.AddWithValue("@GIA", row.Cells[3].Text);
                        cmd3.Parameters.AddWithValue("@KM", float.Parse(a[0].ToString()));
                        cmd3.Parameters.AddWithValue("@SL", ((Label)row.FindControl("txtSoLuong")).Text);
                        cmd3.ExecuteNonQuery();
                        //Update so luong khuyen mai
                        object slkm = kn.execScalar($"select SOLUONG from CTKHUYENMAI where MASP={row.Cells[1].Text.ToString()}");
                        if(slkm!=null)
                        {
                            if (int.Parse(slkm.ToString()) > 0) kn.execNonQuery("update CTKHUYENMAI set SOLUONG=SOLUONG-@SL where MASP=@MA", new object[] { "SL","MA" }, new object[] { ((Label)row.FindControl("txtSoLuong")).Text, row.Cells[1].Text.ToString() });
                        }
                        //Xử lý slkm <= 0
                        object slkm1 = kn.execScalar($"select SOLUONG from CTKHUYENMAI where MASP={row.Cells[1].Text.ToString()}");
                        if (slkm1 != null)
                        {
                            if (int.Parse(slkm1.ToString()) <= 0) kn.execNonQuery("update CTKHUYENMAI set SOLUONG=0 where MASP=@MA", new object[] { "MA" }, new object[] { row.Cells[1].Text.ToString() });
                        }                     
                        CDIO.KM km = new CDIO.KM();
                        km.KhuyenMai();
                        kn.dongketnoi();
                    }
                    Response.Write("<script>alert('Đặt hàng thành công!')</script>");
                    Session["cart"] = null;
                    Server.Transfer("Category_product.aspx");                   
                    kn.dongketnoi();
                }
                else Response.Write("<script>alert('Đặt hàng không thành công!')</script>");
                kn.dongketnoi();

            //}
            //catch { }



        }
    }
}