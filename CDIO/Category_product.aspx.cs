using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO
{
    public partial class Category_product : System.Web.UI.Page
    {
        Connect connect = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.Open_CSDL();
            //if (!Page.IsPostBack)
            //{
            //    rptDanhSachSanPham.DataSource = Enumerable.Range(1, 10);
            //}
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

            //string makm=Request.QueryString.Get("MaKM");
            // if (makm == null)
            // {
            //     sql = "SELECT * FROM KHUYENMAI";
            // }
            // else
            // {
            //     sql = $"SELECT * FROM KHUYENMAI WHERE MAKM={makm}";
            // }
            DataTable dataTable = dataAccess.Lay_CSDl(sql);
            

            this.rptDanhSachSanPham.DataSource = dataTable;
            this.rptDanhSachSanPham.DataBind();
            
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









        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.Open_CSDL();
            if (DropDownList1.SelectedItem.Value.ToString() == "0")
            {
                string sql = "SELECT * FROM SANPHAM";
                DataTable dataTable = dataAccess.Lay_CSDl(sql);
                this.rptDanhSachSanPham.DataSource = null;
                this.rptDanhSachSanPham.DataSource = dataTable;
                this.rptDanhSachSanPham.DataBind();
            }
            if (DropDownList1.SelectedItem.Value.ToString() == "1")
            {
                string sql = "SELECT * FROM SANPHAM ORDER BY MaSP DESC";
                DataTable dataTable = dataAccess.Lay_CSDl(sql);
                this.rptDanhSachSanPham.DataSource = null;
                this.rptDanhSachSanPham.DataSource = dataTable;
                this.rptDanhSachSanPham.DataBind();
            }
            if (DropDownList1.SelectedItem.Value.ToString() == "2")
            {
                string sql = "SELECT * FROM SANPHAM ORDER BY DonGia";
                DataTable dataTable = dataAccess.Lay_CSDl(sql);
                this.rptDanhSachSanPham.DataSource = null;
                this.rptDanhSachSanPham.DataSource = dataTable;
                this.rptDanhSachSanPham.DataBind();
            }
            if (DropDownList1.SelectedItem.Value.ToString() == "3")
            {
                string sql = "SELECT * FROM SANPHAM ORDER BY DonGia DESC";
                DataTable dataTable = dataAccess.Lay_CSDl(sql);
                this.rptDanhSachSanPham.DataSource = null;
                this.rptDanhSachSanPham.DataSource = dataTable;
                this.rptDanhSachSanPham.DataBind();
            }
            dataAccess.Close_CSDL();

        
    }
    }
}