using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO
{
    public partial class MasterCategory_Product : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tendangnhap"] != null)
            {
                signin.Visible = false;
                signup.Visible = false;
                hello.Visible = true;
                // thoat.Visible = true;
                try
                {
                    lbl_hello.Text = "Xin chào, " + Session["name"].ToString();
                    //    lbl_thoat.Text = "Thoát";
                }
                catch { }
            }
            else
            {
                signin.Visible = true;
                signup.Visible = true;
            }
            DataAccess dataAccess = new DataAccess();
            dataAccess.Open_CSDL();
            String sql = "SELECT * FROM DANHMUC";
            DataTable dataTable = dataAccess.Lay_CSDl(sql);
            this.rptMenu.DataSource = dataTable;
            this.rptMenu.DataBind();

            this.rptdm2.DataSource = dataTable;
            this.rptdm2.DataBind();
            dataAccess.Close_CSDL();
        }
    }
}