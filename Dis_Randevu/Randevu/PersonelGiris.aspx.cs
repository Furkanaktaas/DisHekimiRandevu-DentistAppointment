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
    public partial class PersonelGiris1 : System.Web.UI.Page
    {
        Baglanti baglan = new Baglanti();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GirisBtn_Click(object sender, EventArgs e)
        {
            baglan.con.Open();
            SqlCommand komut = new SqlCommand("select * from tblKullanici where id='" + KullaniciAdi.Text + "' and pw='" + Sifre.Text + "'", baglan.con);
            SqlDataReader dr = komut.ExecuteReader();
            if (dr.Read())
            {
                string sorguUnvan = "select unvanAd from tblUnvan where unvanId=(select unvanId from tblPersonel where personelId=(select pId=(select pId from tblKullanici where id='" + KullaniciAdi.Text + "')))";
                string unvanAd;
                dr.Close();
                SqlCommand cmd = new SqlCommand(sorguUnvan, baglan.con);
                unvanAd = Convert.ToString(cmd.ExecuteScalar());
                if (unvanAd == "GENEL MÜDÜR")
                {
                    Session["KullaniciAdi"] = KullaniciAdi.Text;
                    Response.Redirect("GenelMudurr.aspx");
                }else if(unvanAd=="DİŞÇİ")
                {
                    Session["KullaniciAdi"] = KullaniciAdi.Text;
                    Response.Redirect("DoktorPanel.aspx");
                }
                else
                {
                    Session["KullaniciAdi"] = KullaniciAdi.Text;
                    Response.Redirect("SekreterPanel.aspx");
                }             
            }
            else
            {
                Uyari.ForeColor = System.Drawing.Color.Red;
                Uyari.Text = "Kullanıcı adı yada Şifre yanlış!";
            }
            baglan.con.Close();
        }
    }
}