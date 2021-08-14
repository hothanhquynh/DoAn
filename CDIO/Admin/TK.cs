using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CDIO.Admin
{
    public class TK
    {
        public String TENDANGNHAP { get; set; }
        public String MATKHAU { get; set; }
        public String GIOITINH { get; set; }
        public String HOTEN { get; set; }
        public String EMAIL { get; set; }
        public String SDT { get; set; }
        public String DIACHI { get; set; }
        public String TRANGTHAI { get; set; }
        public String MALOAI { get; set; }

        public TK() { }
        public TK(String a, String b, String c, String d, String e, String f, String g, String h, String i)
        {
            TENDANGNHAP = a;
            MATKHAU = b;
            GIOITINH = c;
            HOTEN = d;
            EMAIL = e;
            SDT = f;
            DIACHI = g;
            MALOAI = h;
            TRANGTHAI = i;

        }

    }
}