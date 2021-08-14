using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CDIO
{
    public class Connect
    {
        string connectionString;
        SqlConnection connection;

        public string ConnectionString { get => connectionString; set => connectionString = value; }

        public Connect()
        {
            ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=G:\hồ thanh quỳnh\DOAN\CDIO\CDIO\CDIO\App_Data\BANDONGHO.mdf;Integrated Security=True";
        }

        private void getConnection()
        {
            connection = new SqlConnection(ConnectionString);
            connection.Open();
        }

        private void closeConnection()
        {
            if (connection.State == ConnectionState.Open)
                connection.Close();
        }

        public DataTable getData(string query)
        {
            DataTable dataTable = new DataTable();
            try
            {
                getConnection();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, ConnectionString);
                dataAdapter.Fill(dataTable);
            }
            catch
            {
                dataTable = null;
            }
            finally
            {
                closeConnection();
            }
            return dataTable;
        }

        public object GetValue(string sql)
        {
            getConnection();
            SqlCommand command = new SqlCommand(sql, connection);
            object value = command.ExecuteScalar();
            closeConnection();
            return value;
        }

        public void InsertDeleteUpdate(string sql)
        {
            try
            {
                getConnection();
                SqlCommand command = new SqlCommand(sql, connection);
                int result = command.ExecuteNonQuery();
                if (result < 1) return;
            }
            catch (SqlException ex)
            {

            }
            finally
            {
                closeConnection();
            }
        }


        /*public DataRow getRow(string query, string condition)
        {
            DataRow row;
            getConnection();
            SqlCommand cmd = new SqlCommand(query, connection);

            try
            {
                row = cmd.
            }
            catch
            {
                row = null;
            }
            return row;
        }*/
        public void layketnoi()
        {
            connection = new SqlConnection(ConnectionString);
            connection.Open();
        }
        public void dongketnoi()
        {
            if (connection.State == System.Data.ConnectionState.Open)
                connection.Close();
        }
        public DataTable laydata(string sql)
        {
            DataTable dt = new DataTable();
            try
            {
                layketnoi();
                SqlDataAdapter adapter = new SqlDataAdapter(sql, connection);
                adapter.Fill(dt);
            }
            catch
            {
                dt = null;
            }
            finally
            {
                dongketnoi();
            }
            return dt;
        }
        public SqlDataReader reader(string sql)
        {
            SqlCommand command = new SqlCommand(sql, connection);
            SqlDataReader reader = command.ExecuteReader();
            return reader;
        }

        public SqlCommand command(string sql)
        {
            SqlCommand command = new SqlCommand(sql, connection);
            return command;
        }
        public string mahoa(string pass)
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(pass.Trim(), "MD5");
        }

        public object execScalar(String sql, object[] varName = null, object[] varValue = null)
        {
            getConnection();
            SqlCommand cmd = new SqlCommand(sql, connection);
            if (varName != null)
            {
                for (int i = 0; i < varName.Length; i++)
                    cmd.Parameters.AddWithValue("@" + varName[i] + "", varValue[i]);
            }
            
            object res = cmd.ExecuteScalar();
            closeConnection();
            return res;
        }
        public DataSet getDataSet(String sql, object[] varName = null, object[] varValue = null)
        {
            DataSet ds = new DataSet();
            getConnection();
            SqlCommand cmd = new SqlCommand(sql, connection);
            if (varName != null)
            {
                for (int i = 0; i < varName.Length; i++)
                    cmd.Parameters.AddWithValue(varName[i] + "", varValue[i]);
            }
            closeConnection();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            return ds; // Lấy về bảng dữ liệu

        }
        public int execNonQuery(String sql, object[] varName = null, object[] varValue = null)
        {
            getConnection();
            SqlCommand cmd = new SqlCommand(sql, connection);
            if (varName != null)
            {
                for (int i = 0; i < varName.Length; i++)
                    cmd.Parameters.AddWithValue("@" + varName[i] + "", varValue[i]);
            }
           
            int res = cmd.ExecuteNonQuery();
            closeConnection();
            return res;
        }

    }
}