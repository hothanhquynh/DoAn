using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO3.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        CDIO.Connect kn = new CDIO.Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tendangnhap"] != null)
            {
                try
                {
                    lbl_hello.Text = Session["name"].ToString();
                }
                catch { }
            }
            //Update khuyen mai
            CDIO.KM km = new CDIO.KM();
            km.KhuyenMai();
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Server.Transfer("~/Login.aspx");
        }
    }
}