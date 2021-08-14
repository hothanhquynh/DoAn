using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace CDIO
{
    public class KM
    {
        CDIO.Connect kn = new CDIO.Connect();
        public void KhuyenMai()
        {
            try
            {
                //Update trang thai khuyen mai
                string q1 = @"update KHUYENMAI set TrangThai = N'Ngừng khuyến mãi' 
                    where CONVERT(nvarchar, denngay,103)= CONVERT(nvarchar, GETDATE(), 103)";
                string q2 = @"update KHUYENMAI set TrangThai = N'Đang khuyến mãi' 
                where CONVERT(nvarchar, TuNgay,103)= CONVERT(nvarchar, GETDATE(), 103)";
                string q3 = @"update KHUYENMAI set TrangThai = N'Chưa khuyến mãi' 
                where CONVERT(nvarchar, TuNgay,103)> CONVERT(nvarchar, GETDATE(), 103)";
                kn.execNonQuery(q1);
                kn.execNonQuery(q2);
                kn.execNonQuery(q3);
                //Update ty le khuyen mai khi dang khuyen mai
                string query = @"select ct.masp,ct.tylekm from CTKHUYENMAI ct,SANPHAM sp,KHUYENMAI km where ct.MaKM=km.MaKM
                            and ct.MaSP = sp.MaSP and km.TrangThai = N'Đang khuyến mãi'";
                DataTable dataTable1 = kn.laydata(query);
                foreach (DataRow row in dataTable1.Rows)
                {
                    string query1 = $"UPDATE SANPHAM set TYLEKM={row["TYLEKM"]} where MASP={row["MASP"]}";
                    kn.execNonQuery(query1);
                }
                //Update ty le khuyen mai khi ngung khuyen mai
                string q = @"select ct.masp,ct.tylekm from CTKHUYENMAI ct,SANPHAM sp,KHUYENMAI km where ct.MaKM=km.MaKM
                            and ct.MaSP = sp.MaSP and km.TrangThai = N'Ngừng khuyến mãi'";
                DataTable data = kn.laydata(q);
                foreach (DataRow row in data.Rows)
                {
                    string query1 = $"UPDATE SANPHAM set TYLEKM=0 where MASP={row["MASP"]}";
                    kn.execNonQuery(query1);
                }
                //Update ty le khuyen mai khi so luong het
                string q4 = @"select ct.masp,ct.tylekm from CTKHUYENMAI ct,SANPHAM sp,KHUYENMAI km where ct.MaKM=km.MaKM
                            and ct.MaSP = sp.MaSP and ct.soluong <= 0";
                DataTable data1 = kn.laydata(q4);
                foreach (DataRow row in data1.Rows)
                {
                    string query1 = $"UPDATE SANPHAM set TYLEKM=0 where MASP={row["MASP"]}";
                    kn.execNonQuery(query1);
                }
            }
            catch { }
        }
    }
}