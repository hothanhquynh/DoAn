<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="QLDM.aspx.cs" Inherits="CDIO.Admin.QLDM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Quản lý danh mục</title>
    <link href="../assets/css/QLDM.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <div style="text-align: center;">
            <div class="h1">
                <h1>Danh sách danh mục</h1>
            </div>
           <div class="main">


              <div class="left">
            
                <table style="transform: translateX(150%);" >
                    <tr style="height: 100px;">
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Mã hàng" Font-Bold="True" Font-Size="Large" CssClass="title-dm"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True" CssClass="input-dm"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Tên hàng" Font-Bold="True" Font-Size="Large" CssClass="title-dm"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" AutoPostBack="True" CssClass="input-dm"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                   <asp:FormView ID="FormView1" runat="server" DefaultMode="Insert" CssClass="image">
                      <InsertItemTemplate>
                          
                          <asp:Label ID="Label6" runat="server" Text="Hình ảnh" Font-Bold="true" Font-Size="Large"></asp:Label>
                          
                         
                          <asp:FileUpload ID="FileUpload2" runat="server" CssClass="btn_upload"/>
                      </InsertItemTemplate>
                       </asp:FormView>
                  <br />

                 
            <asp:Button ID="Button1" CssClass="button2 button1" runat="server" Text="Thêm" OnClick="Button1_Click" />
            <asp:Button ID="Button2" CssClass="button2 button1" runat="server" Text="Sửa" OnClick="Button2_Click" onclientclick="return confirm('Bạn có chắc muốn cập nhật không?');"/>
            <asp:Button ID="Button3" CssClass="button2 button1" runat="server" Text="Xóa" OnClick="Button3_Click" onclientclick="return confirm('Bạn có chắc muốn xóa không?');" />
            <asp:Button ID="Button4" CssClass="button2 button1" runat="server" Text="Làm mới" OnClick="Button4_Click" />

</div>


                     

                  

               <div class="left1">
          
            <asp:GridView ID="GridView1"   runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" GridLines="None" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" CellPadding="4" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="MaHang" HeaderText="Mã hàng"   ReadOnly="True" >
                    <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TenHang" HeaderText="Tên hàng" ReadOnly="True" >
                    <ItemStyle Width="200px" />
                    </asp:BoundField>
                 
                    <asp:TemplateField HeaderText="Hình ảnh">
                      <ItemTemplate>
                          <asp:Image ID="Image3" runat="server" ImageUrl='<%# "~/assets/img/img_home/img_product/"+Eval("HinhAnh") %>' Height="80px" Width="80px" />
                      </ItemTemplate>
                  </asp:TemplateField>

                    <asp:CommandField ShowSelectButton="True" >
                    <ItemStyle Width="200px" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
                
               </div>

         
</div>
        </div>


</asp:Content>
