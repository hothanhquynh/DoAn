using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO
{
    public partial class Header : System.Web.UI.MasterPage
    {
        Connect kn = new Connect();
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
           
            this.rptdm1.DataSource = dataTable;
            this.rptdm1.DataBind();
            this.rptdm3.DataSource = dataTable;
            this.rptdm3.DataBind();
            dataAccess.Close_CSDL();
            //Update khuyen mai
            CDIO.KM km = new CDIO.KM();
            km.KhuyenMai();


        }
    }
}