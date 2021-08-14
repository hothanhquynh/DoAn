using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CDIO
{
    public class DataAccess
    {
        SqlConnection connection;
        public void Open_CSDL()
        {
            connection = new SqlConnection();
            connection.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=G:\hồ thanh quỳnh\DOAN\CDIO\CDIO\CDIO\App_Data\BANDONGHO.mdf;Integrated Security=True";
            connection.Open();
        }
        public DataTable Lay_CSDl(string sql)
        {
            SqlDataAdapter adapter = new SqlDataAdapter(sql, this.connection);
            DataTable dataTable = new DataTable();
            // Thực thi câu lệnh sql, điền duex liệu vào 
            adapter.Fill(dataTable);
            return dataTable;
        }
        public int ThucThiCauLenhSql(string sql)
        {
            SqlCommand cmd = new SqlCommand();

            cmd.Connection = this.connection;
            cmd.CommandText = sql;

            // Thực thi câu lệnh sql, trả về số dòng tác động
            return cmd.ExecuteNonQuery();
        }
        public void Close_CSDL()
        {
            if (connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
        }
    }
}