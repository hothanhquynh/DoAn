using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (Session["Cart"] != null)
                {
                    ShoppingCartActions cart = (ShoppingCartActions)Session["Cart"];
                    LoadCart(cart);
                }

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
                this.lblTotal.Text = float.Parse(TinhTongTien().ToString()).ToString("C0", CultureInfo.CreateSpecificCulture("vn-VN"));

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
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string maSP = ((Button)sender).CommandArgument.ToString();
            ShoppingCartActions cart = (ShoppingCartActions)Session["Cart"];
            connect.InsertDeleteUpdate("UPDATE SANPHAM SET SoLuongTon = SoLuongTon + " + cart.GetSoLuong(maSP) + " WHERE MaSP = '" + maSP + "'"); ;
            cart.RemoveFromCart(maSP);
            LoadCart(cart);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] != null)
            {
                ShoppingCartActions cart = (ShoppingCartActions)Session["Cart"];
                foreach (GridViewRow row in this.GridView1.Rows)
                {
                    string maSP = row.Cells[1].Text;
                    int soLuongNew = int.Parse(((TextBox)row.FindControl("txtSoLuong")).Text);
                    // Kiểm tra người dùng nhập vào số lượng có âm hay không
                    if (soLuongNew <= 0)
                    {
                        Response.Write("<script>");
                        Response.Write("alert('Bạn phải nhập số lượng lơn hơn 0');");
                        Response.Write("</script>");
                        ((TextBox)row.FindControl("txtSoLuong")).Text = cart.GetSoLuong(maSP).ToString();
                    }
                    else
                    {
                        int soLuongTon = cart.GetSoLuongTon(maSP);
                        // số lượng thêm có thể âm hoặc dương, âm khi số lượng new < số lượng ban đầu và ngược lại
                        int soLuongThem = soLuongNew - cart.GetSoLuong(maSP);
                        // - Nếu update số lượng lại một số lớn hơn hoặc bàng số lượng ban đầu,
                        // thì kiểm tra xem số lượng thêm vào có lớn hơn số lượng tồn hay không,
                        // nếu lớn hơn số lượng tồn thì thông báo hết hàng, ngược lại update số lượng của giỏ hàng và số lượng tồn = số lượng tồn - số lượng thêm vào
                        // - Ngược lại, nếu update số lượng mới nhỏ hơn số lượng ban đầu,
                        // thì update số lượng tồn = số lượng tồn + số lượng người dùng giảm đi ( = số lượng new - số lượng)
                        if (soLuongThem >= 0) // nếu nhập số lượng mới lớn hơn hoặc bằng số lượng ban đầu
                        {
                            if (soLuongThem > soLuongTon)
                            {
                                ((TextBox)row.FindControl("txtSoLuong")).Text = cart.GetSoLuong(maSP).ToString();
                                Response.Write("<script>");
                                Response.Write("alert('Xin lỗi! Số lượng bạn vừa nhập lớn hơn số lượng sản phẩm hiện có trong cửa hàng.');");
                                Response.Write("</script>");
                            }
                            else
                            {
                                // Trước khi update, cộng số lượng tồn thêm 1 vì ban đầu đã có 1 sản phẩm ở giỏ
                                //connect.InsertDeleteUpdate("UPDATE SANPHAM SET SoLuongTon = SoLuongTon + 1 WHERE MaSP = '" + maSP + "'");
                                connect.InsertDeleteUpdate("UPDATE SANPHAM SET SoLuongTon = SoLuongTon - " + soLuongThem + " WHERE MaSP = '" + maSP + "'");
                                cart.UpdateItem(maSP, soLuongNew);
                                Session["Cart"] = cart;
                                LoadCart(cart);
                            }
                        }
                        else // Ngược lại, nếu nhập số lượng mới nhỏ hơn số lượng ban đầu
                        {
                            //connect.InsertDeleteUpdate("UPDATE SANPHAM SET SoLuongTon = SoLuongTon + 1 WHERE MaSP = '" + maSP + "'");
                            connect.InsertDeleteUpdate("UPDATE SANPHAM SET SoLuongTon = SoLuongTon + " + Math.Abs(soLuongThem) + " WHERE MaSP = '" + maSP + "'");
                            cart.UpdateItem(maSP, soLuongNew);
                            Session["Cart"] = cart;
                            LoadCart(cart);
                        }
                    }
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Category_product.aspx");
        }

        protected void btnContinueToCheckout_Click(object sender, EventArgs e)
        {
            if(Session["tendangnhap"]!=null)
            Server.Transfer("~/Checkout.aspx");
            else
            {
                Session["checkout"] = 1;
                Response.Write("<script>alert('Vui lòng đăng nhập trước khi tiến hành đặt hàng!')</script>");
            }
        }
    }
}