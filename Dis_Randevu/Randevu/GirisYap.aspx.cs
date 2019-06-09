using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebProjeTemplate
{
    public partial class GirisYap : System.Web.UI.Page
    {
        Baglanti baglan = new Baglanti();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        protected void GirisBtn_Click(object sender, EventArgs e)
        {
            baglan.con.Open();
            SqlCommand komut = new SqlCommand("select * from tblHasta where hastaTc='" + TcNo.Text + "' and sifre='" + Sifre.Text + "'", baglan.con);
            SqlDataReader dr = komut.ExecuteReader();
            if (dr.Read())
            {
                //HastaID ile almaya gerek varmı?
                Session["HastaTC"] = TcNo.Text;
                Response.Redirect("HastaPanel.aspx");
            }
            else
            {
                Uyari.ForeColor = System.Drawing.Color.Red;
                Uyari.Text = "Tc No yada Şifre yanlış!"; 
            }
            baglan.con.Close();
        }
    }
}