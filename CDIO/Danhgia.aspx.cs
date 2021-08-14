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
    public partial class Danhgia : System.Web.UI.Page
    {
        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.Open_CSDL();
            string idSanPham = Request.QueryString.Get("MaSP");
            if (idSanPham != null)
            {
                string sql = $"SELECT * FROM SANPHAM WHERE MaSP={idSanPham}";
                DataTable dataTable = dataAccess.Lay_CSDl(sql);
                // Gán dưx liệu vào conttrol
                ltTenSanPham1.Text = dataTable.Rows[0]["TenSP"].ToString();
                imgsanpham1.ImageUrl = "/assets/img/img_home/img_product/" + dataTable.Rows[0]["HinhAnh"].ToString();
                //string gia = dataTable.Rows[0]["DonGia"].ToString();
                Label1.Text = string.Format("{0:c0}", dataTable.Rows[0]["DonGia"]);
                Ltmota1.Text = dataTable.Rows[0]["MoTa"].ToString();
                ltkm1.Text = dataTable.Rows[0]["TyLeKM"].ToString();
                tensp.Text = dataTable.Rows[0]["TenSP"].ToString();
            }
            string sql1 = "select SoLuongTon from SANPHAM where MaSP=" + idSanPham;
            DataTable dataTable1 = dataAccess.Lay_CSDl(sql1);
            if (Convert.ToInt32(dataTable1.Rows[0]["SoLuongTon"].ToString()) > 0)
            {
                state_product.Text = "CÒN HÀNG";
            }
            else
            {
                state_product.Text = "HẾT HÀNG";
                state_product.Style.Add("color", "red");
                Button1.Style.Add("cursor", "not-allowed");
                Button1.Style.Add("background", "#ff000057");
                Button1.Enabled = false;
            }
           
            dataAccess.Close_CSDL();

        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            ShoppingCartActions shoppingCart = null;
            string maSP = Request.QueryString.Get("MaSP");
            if (Session["Cart"] == null)
            {
                shoppingCart = new ShoppingCartActions();
            }
            else
            {
                shoppingCart = (ShoppingCartActions)Session["Cart"];
            }
            Session["Cart"] = shoppingCart;
            //string maSP = ((Button)sender).CommandArgument.ToString();
            if (shoppingCart.AddToCart(maSP, new CartItem(maSP, 1)))
            {
                connect.InsertDeleteUpdate("UPDATE SANPHAM SET SoLuongTon = SoLuongTon - 1 WHERE MaSP = '" + maSP + "'");
                Response.Redirect("~/ShoppingCart.aspx");
            }
        }

        protected void btn_danhgia_Click(object sender, EventArgs e)
        {
            string idSanPham = Request.QueryString.Get("MaSP");
            connect.layketnoi();
            string sql = "insert into DANHGIA(TENDANGNHAP,TEN,SOSAO,NOIDUNG,NGAYDG,MASP) VALUES(@TENDN,N'"+txthoten.Text+"',@SOSAO,@ND,@NGAYDG,@MASP)";
            SqlCommand cmd = connect.command(sql);
            cmd.Parameters.AddWithValue("@TENDN", Session["tendangnhap"].ToString());
            cmd.Parameters.AddWithValue("@SOSAO", sosao.SelectedItem.Value.ToString());
            cmd.Parameters.AddWithValue("@ND", txtcontent.Value);
            cmd.Parameters.AddWithValue("@NGAYDG", DateTime.Now.Date);
            cmd.Parameters.AddWithValue("@MASP", idSanPham.ToString());
            
            int i = cmd.ExecuteNonQuery();
            if(i>0)
            {
                //Quay lai trang san pham vua danh gia
                Response.Redirect("Product-detail.aspx?MaSP=" + idSanPham);
                
            }
            connect.dongketnoi();
        }
    }
}