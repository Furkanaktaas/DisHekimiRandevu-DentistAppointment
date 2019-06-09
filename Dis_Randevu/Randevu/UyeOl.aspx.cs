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
    public partial class UyeOl : System.Web.UI.Page
    {
        Baglanti baglan = new Baglanti();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CinsiyetRb.Items.Add("ERKEK");
                CinsiyetRb.Items.Add("KADIN");
                KanGrubu.Items.Add("A+");
                KanGrubu.Items.Add("A-");
                KanGrubu.Items.Add("B+");
                KanGrubu.Items.Add("B-");
                KanGrubu.Items.Add("0+");
                KanGrubu.Items.Add("0-");
                KanGrubu.Items.Add("AB+");
                KanGrubu.Items.Add("AB-");

                ay.Items.Add("Ocak");
                ay.Items.Add("Şubat");
                ay.Items.Add("Mart");
                ay.Items.Add("Nisan");
                ay.Items.Add("Mayıs");
                ay.Items.Add("Haziran");
                ay.Items.Add("Temmuz");
                ay.Items.Add("Ağustos");
                ay.Items.Add("Eylül");
                ay.Items.Add("Ekim");
                ay.Items.Add("Kasım");
                ay.Items.Add("Aralık");
                for (int i = 1; i < 32; i++)
                {
                    gun.Items.Add(i.ToString());
                }

                for (int i = 2010; i > 1950; i--)
                {
                    yil.Items.Add(i.ToString());
                }

            }
        }
        protected void KayitBtn_Click(object sender, EventArgs e)
        {
            DateTime dogumTarihi = new DateTime(
            Convert.ToInt16(yil.SelectedItem.Value),
            Convert.ToInt16(ay.SelectedIndex+1),
            Convert.ToInt16(gun.SelectedItem.Value));
            //Doğum tarihi yıl ay gün olarak alındı
            baglan.con.Open();
            SqlCommand sorguKontrol = new SqlCommand("Select * from tblHasta where hastaTc = '" + TcNo.Text + "'", baglan.con);
            SqlDataReader dr = sorguKontrol.ExecuteReader();
            if (dr.Read())
            {
                Uyari.ForeColor = System.Drawing.Color.Red;
                Uyari.Text = "Bu TC Numarası Kullanılmaktadır eğer üye iseniz giriş yapınız.";
                dr.Close();
            }
            else
            {
                dr.Close();
                SqlCommand komut;
                //Veri kaydetmek için SQL komutumu yazıyorum
                komut = new SqlCommand("INSERT INTO tblHasta (hastaTc,ad,soyad,adres,cinsiyet,cepTel,email,dogumTar,dogumYer,kanGrubu,sifre) VALUES (@hastaTc,@ad,@soyad,@adres,@cinsiyet,@cepTel,@email,@dogumTar,@dogumYer,@kanGrubu,@sifre)", baglan.con);
                //Her bir alan için parametremin tipini belirtiyor ve bu parametrenin hangi alandan alınacağını gösteriyorum.

                komut.Parameters.Add("@hastaTc", System.Data.SqlDbType.VarChar, 11);
                komut.Parameters["@hastaTc"].Value = TcNo.Text;

                komut.Parameters.Add("@ad", System.Data.SqlDbType.VarChar, 20);
                komut.Parameters["@ad"].Value = Ad.Text;

                komut.Parameters.Add("@soyad", System.Data.SqlDbType.VarChar, 20);
                komut.Parameters["@soyad"].Value = Soyad.Text;

                komut.Parameters.Add("@adres", System.Data.SqlDbType.VarChar); //max??
                komut.Parameters["@adres"].Value = Adres.Text;

                komut.Parameters.Add("@cinsiyet", System.Data.SqlDbType.VarChar, 5);
                komut.Parameters["@cinsiyet"].Value = CinsiyetRb.Text;

                komut.Parameters.Add("@cepTel", System.Data.SqlDbType.VarChar, 11);
                komut.Parameters["@cepTel"].Value = Telefon.Text;

                komut.Parameters.Add("@email", System.Data.SqlDbType.VarChar); //max??
                komut.Parameters["@email"].Value = Email.Text;
                //Tarih nasıl alınır ?
                komut.Parameters.Add("@dogumTar", System.Data.SqlDbType.Date);//date, ?
                komut.Parameters["@dogumTar"].Value = dogumTarihi.ToShortDateString();

                komut.Parameters.Add("@dogumYer", System.Data.SqlDbType.VarChar, 20);
                komut.Parameters["@dogumYer"].Value = DogumYeri.Text;

                komut.Parameters.Add("@kanGrubu", System.Data.SqlDbType.VarChar, 3);
                komut.Parameters["@kanGrubu"].Value = KanGrubu.Text;

                komut.Parameters.Add("@sifre", System.Data.SqlDbType.VarChar);//max?
                komut.Parameters["@sifre"].Value = Sifre.Text;

                komut.ExecuteNonQuery();
                dr.Close();
                baglan.con.Close();
                Response.Redirect("GirisYap.aspx");
            }
        }
    }
}