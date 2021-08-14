using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CDIO.Admin
{
    public partial class ThemKM : System.Web.UI.Page
    {
        Connect kn = new Connect();
        List<String> l1 = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadData();
                LoadGrid();
            }
            
        }
        public void LoadData()
        {
            string makm = "";
            if(Context.Items["MaKM"]!=null)
            {
                makm = Context.Items["MaKM"].ToString();
               string sql = "select * from KHUYENMAI where MAKM=@MA";
                DataSet ds = kn.getDataSet(sql, new object[] { "MA" }, new object[] { makm });
                txtma.Text = ds.Tables[0].Rows[0]["MAKM"].ToString();
                txtten.Text = ds.Tables[0].Rows[0]["TENKM"].ToString();
                from_day.Text = ds.Tables[0].Rows[0]["TUNGAY"].ToString();
                to_day.Text = ds.Tables[0].Rows[0]["DENNGAY"].ToString();
                ddl_trangthai.SelectedItem.Text = ds.Tables[0].Rows[0]["TRANGTHAI"].ToString();
            }           
            
        }
        public void LoadGrid()
        {
            if(Context.Items["MaKM"] != null)
            {
                string makm = Context.Items["MaKM"].ToString();
                string sql = $"select * from CTKHUYENMAI where MAKM={makm}";
                DataTable dt = kn.laydata(sql);
                GridView1.DataSource = null;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }         
        }
        protected void btn_them_Click(object sender, EventArgs e)
        {
            int res = 0;
            
            foreach(ListItem item in ListBox1.Items)
            {
                if (item.Selected)
                {
                    l1.Add(item.Text);
                } 
            }
            try
            {   
                foreach(string item in l1)
                {
                    string sql = "insert into CTKHUYENMAI values(@MAKM,@MASP,@TYLE,N'" + txtghichu.Text.ToString() + "',@SL)";
                    res = kn.execNonQuery(sql, new object[] { "MAKM", "MASP", "TYLE", "SL" }, new object[] { txtma.Text,item, txttyle.Text, txtsl.Text });
                }
                if (res > 0) Response.Write("<script>alert('Thêm khuyến mãi thành công!')</script>");
                LoadGrid();
                Lammoi();                      
            }
            catch { }
            
         
        }

        protected void btn_huy_Click(object sender, EventArgs e)
        {
            Server.Transfer("../Admin/QLKM.aspx");
        }
        public void Lammoi()
        {       
            txtsl.Text = "";  
            txttyle.Text = "";
            txtghichu.Text = "";
            ListBox1.ClearSelection();
        }

        protected void btn_sua_Click(object sender, EventArgs e)
        {
            
            string sql = "update CTKHUYENMAI set TYLEKM=@TYLE,GHiCHU=N'" + txtghichu.Text + "',SOLUONG=@SL where MASP=@MASP";
                int res = kn.execNonQuery(sql, new object[] { "TYLE", "SL", "MASP" }, new object[] { txttyle.Text, txtsl.Text, GridView1.SelectedRow.Cells[1].Text});
            if (res > 0)
            {
                Response.Write("<script>alert('Sửa khuyến mãi thành công!')</script>");
                LoadGrid();
                ListBox1.Enabled = true;
                Lammoi();
            }
            
        
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            string[]a = row.Cells[2].Text.Split('%');
            txttyle.Text = a[0];
            txtghichu.Text = HttpUtility.HtmlDecode(row.Cells[3].Text);
            txtsl.Text = row.Cells[4].Text;
            

        }

        protected void lblxoa_Click(object sender, EventArgs e)
        {
            //Update khuyen mai
            string masp = ((LinkButton)sender).CommandArgument;
            string query1 = $"UPDATE SANPHAM set TYLEKM=0 where MASP={masp}";
            kn.execNonQuery(query1);
            string sql = "delete from CTKHUYENMAI where MASP=@MA";
            kn.execNonQuery(sql, new object[] { "MA" }, new object[] { masp });
           
           
            
          
            LoadGrid();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadGrid();
        }
    }
}