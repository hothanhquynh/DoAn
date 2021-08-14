using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CDIO
{
    public class CartItem
    {
        string maSP;
        int soLuong;

        public CartItem(string maSP, int soLuong)
        {
            this.maSP = maSP;
            this.soLuong = soLuong;
        }

        public string MaSP { get => maSP; set => maSP = value; }
        public int SoLuong { get => soLuong; set => soLuong = value; }
        public CartItem()
        {
            //
            // TODO: Add constructor logic here
            //
        }
    }
}