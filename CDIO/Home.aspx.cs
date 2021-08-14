using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO
{
    public partial class Home1 : System.Web.UI.Page
    {
        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.Open_CSDL();

            string mahang = Request.QueryString.Get("MaHang");
            string sql;
            if (mahang == null)
            {
                sql = "SELECT * FROM SANPHAM";
            }
            else
            {
                sql = $"SELECT * FROM SANPHAM WHERE MAHang={mahang}";
            }

            DataTable dataTable = dataAccess.Lay_CSDl(sql);

            //------------------Xử lý  giá cũ giá mới ở đây---------------------





            this.rpttranghome.DataSource = dataTable;
            this.rpttranghome.DataBind();


            dataAccess.Close_CSDL();
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            ShoppingCartActions shoppingCart = null;
            if (Session["Cart"] == null)
            {
                shoppingCart = new ShoppingCartActions();
            }
            else
            {
                shoppingCart = (ShoppingCartActions)Session["Cart"];
            }
            Session["Cart"] = shoppingCart;
            string maSP = ((LinkButton)sender).CommandArgument.ToString();
            if (shoppingCart.AddToCart(maSP, new CartItem(maSP, 1)))
            {
                connect.InsertDeleteUpdate("UPDATE SANPHAM SET SoLuongTon = SoLuongTon - 1 WHERE MaSP = '" + maSP + "'");
                Response.Redirect("~/ShoppingCart.aspx");
            }
            else
            {
                Response.Write("<script>");
                Response.Write("alert('Đã hết hàng!');");
                Response.Write("</script>");
            }
        }
    }
}