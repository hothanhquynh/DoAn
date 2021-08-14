using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CDIO
{
    public class ShoppingCartActions
    {
        Dictionary<string, CartItem> cartItems = new Dictionary<string, CartItem>();
        public ShoppingCartActions()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public bool AddToCart(string maSP, CartItem item)
        {
            bool trans = true;
            int soLuongTon = GetSoLuongTon(maSP);
            if (soLuongTon <= 0)
                return false;
            if (cartItems.ContainsKey(maSP))
            {
                if (cartItems[maSP].SoLuong > soLuongTon)
                    trans = false;
                else cartItems[maSP].SoLuong++;
            }
            else
            {
                cartItems.Add(maSP, item);
            }
            return trans;
        }

        public int GetSoLuong(string maSP)
        {
            return cartItems[maSP].SoLuong;
        }

        public int GetSoLuongTon(string maSP)
        {
            Connect connect = new Connect();
            SqlConnection connection = new SqlConnection(connect.ConnectionString);
            connection.Open();
            string sql = "SELECT SoLuongTon FROM SANPHAM WHERE MaSP = '" + maSP + "'";
            //SqlCommand command = new SqlCommand(sql, connection);
            //int sl = (int)command.ExecuteScalar();
            SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            int sl = Convert.ToInt32(dt.Rows[0]["SoLuongTon"].ToString());
            connection.Close();
            return sl;
        }

        public void RemoveFromCart(string maSP)
        {
            if (cartItems.ContainsKey(maSP))
            {
                cartItems.Remove(maSP);
            }
        }

        public void UpdateItem(string maSP, int soLuongMoi)
        {
            if (cartItems.ContainsKey(maSP))
            {
                cartItems[maSP].SoLuong = soLuongMoi;
            }
        }


        public DataSet getProductInfo(string maSP, int soLuong)
        {
            Connect connect = new Connect();
            SqlConnection connection = new SqlConnection(connect.ConnectionString);
            connection.Open();
            string sql = "SELECT MaSP, TenSP, DonGia, HinhAnh, SoLuongTon, DonGia * " + soLuong + "- (" + soLuong + " * DonGia * TyLeKM / 100) AS ThanhTien,TyLeKM FROM SANPHAM WHERE MaSP = '" + maSP + "'";
            SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);
            connection.Close();
            return dataSet;
        }

        public DataTable GetCartItems()
        {
            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("MaSP");
            dataTable.Columns.Add("TenSP");
            dataTable.Columns.Add("SoLuong");
            dataTable.Columns.Add("DonGia");
            dataTable.Columns.Add("HinhAnh");
            dataTable.Columns.Add("ThanhTien");
            dataTable.Columns.Add("SoLuongTon");
            dataTable.Columns.Add("TyLeKM");

            foreach (CartItem item in cartItems.Values)
            {
                DataRow row = dataTable.NewRow();
                row["MaSP"] = item.MaSP;
                row["SoLuong"] = item.SoLuong;
                DataSet dataSet = new DataSet();
                dataSet = getProductInfo(item.MaSP, item.SoLuong);
                row["TenSP"] = dataSet.Tables[0].Rows[0]["TenSP"].ToString();
                row["DonGia"] = dataSet.Tables[0].Rows[0]["DonGia"].ToString();
                row["HinhAnh"] = dataSet.Tables[0].Rows[0]["HinhAnh"].ToString();
                row["ThanhTien"] = dataSet.Tables[0].Rows[0]["ThanhTien"].ToString();
                row["SoLuongTon"] = dataSet.Tables[0].Rows[0]["SoLuongTon"].ToString();
                row["TyLeKM"] = dataSet.Tables[0].Rows[0]["TyLeKM"].ToString();
                dataTable.Rows.Add(row);
            }
            return dataTable;
        }
    }
}
