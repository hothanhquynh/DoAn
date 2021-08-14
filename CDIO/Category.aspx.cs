using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO
{
    public partial class Category : System.Web.UI.Page
    {
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
            
            this.rptdmsp.DataSource = dataTable;
            this.rptdmsp.DataBind();
            dataAccess.Close_CSDL();
        }
    }
}