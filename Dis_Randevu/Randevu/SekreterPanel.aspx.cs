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
    public partial class SekreterPanel : System.Web.UI.Page
    {
        Baglanti baglan = new Baglanti();
        PersonelBilgilerTek personelT = new PersonelBilgilerTek();
        
        public static string personelId;
        public string sifre;
        public string sekreterId;

        public void Aktif(){
            baglan.con.Open();
            string sql_sorgum = "select  hasta.ad+' '+hasta.soyad as HastaAdSoyad, klinik.klinikAd as KlinikAd, personel.ad+' '+personel.soyad as DoktorAdSoyad, CONVERT(VARCHAR(10),randevu.gun,104) as Tarih, randevu.saat as Saat, randevu.randevuId as randevuId from tblRandevu randevu  INNER JOIN tblHasta hasta on randevu.hastaId=hasta.hastaId INNER JOIN tblPersonel personel ON randevu.disciId=personel.personelId  INNER JOIN tblKlinik klinik ON personel.klinikId=klinik.klinikId where klinik.klinikId=" + klinikIdLbl.Text + " and randevu.silinmiş=0 order by gun asc,saat asc";
            SqlDataAdapter adptr = new SqlDataAdapter(sql_sorgum, baglan.con);
            DataTable dt = new DataTable(sql_sorgum);
            adptr.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            baglan.con.Close();

        }
        public void Gecmis()
        {
            baglan.con.Open();
            string sqlsorgu2 = "select hasta.ad+' '+hasta.soyad as HastaAdSoyad, klinik.klinikAd as KlinikAd, personel.ad+' '+personel.soyad as DoktorAdSoyad, CONVERT(VARCHAR(10),randevu.gun,104) as Tarih, randevu.saat as Saat from tblRandevu randevu INNER JOIN tblHasta hasta on randevu.hastaId=hasta.hastaId INNER JOIN tblPersonel personel ON randevu.disciId=personel.personelId INNER JOIN tblKlinik klinik ON personel.klinikId=klinik.klinikId  where klinik.klinikId =" + klinikIdLbl.Text + " and randevu.silinmiş=1 order by gun desc,saat desc";
            SqlDataAdapter adptr2 = new SqlDataAdapter(sqlsorgu2, baglan.con);
            DataTable dt2 = new DataTable(sqlsorgu2);
            adptr2.Fill(dt2);
            GridView2.DataSource = dt2;
            GridView2.DataBind();
            baglan.con.Close();

        }

        public void bilgiler()
        {
            //Personel bilgileri güncelle kısmındaki textboxlara veri çekme
            personelT.PersonelBilgilerT(sekreterId);
            Ad.Text = personelT.ad;
            Soyad.Text = personelT.soyad;
            Adres.Text = personelT.adres;
            CinsiyetRb.Text = personelT.cinsiyet;
            Telefon.Text = personelT.cepTel;
            Email.Text = personelT.email;
            DateTime tarih;
            tarih = Convert.ToDateTime(personelT.dogumTar);
            gun.Text = tarih.Day.ToString();
            ay.SelectedIndex = tarih.Month - 1;
            yil.Text = tarih.Year.ToString();
            DogumYeri.Text = personelT.dogumYer;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciAdi"] != null) //sayfa yüklendiği anda session kontrolü yapılıyor.
            {
                if (!IsPostBack)
                { 
                baglan.con.Open();
                string sorguKulAdi = "select ad + ' ' + soyad as AdSoyad from tblPersonel where personelId=(select pId from tblKullanici where id ='" + Session["KullaniciAdi"].ToString() + "')";
                SqlCommand cmd = new SqlCommand(sorguKulAdi, baglan.con);
                kullaniciAdiLbl.Text= Convert.ToString(cmd.ExecuteScalar()); //bununla personel tablosundaki adı alıyoruz

                string sorguUnvan = "select unvanAd from tblUnvan where unvanId=(select unvanId from tblPersonel where personelId=(select pId=(select pId from tblKullanici where id='" + Session["KullaniciAdi"].ToString() + "')))";
                SqlCommand cmd1 = new SqlCommand(sorguUnvan, baglan.con);
                unvan.Text = Convert.ToString(cmd1.ExecuteScalar());

                string sorguKlinikId = "select klinikId from tblPersonel where personelId=(select pId from tblKullanici where id ='" + Session["KullaniciAdi"].ToString() + "')";
                SqlCommand cmd2 = new SqlCommand(sorguKlinikId, baglan.con);
                klinikIdLbl.Text = Convert.ToString(cmd2.ExecuteScalar());

                string sorgusekreterId = "select personelId from tblPersonel where personelId=(select pId from tblKullanici where id ='" + Session["KullaniciAdi"].ToString() + "')";
                SqlCommand cmd3 = new SqlCommand(sorgusekreterId, baglan.con);
                sekreterId = Convert.ToString(cmd3.ExecuteScalar());
                baglan.con.Close();

                    //Bilgileri Güncelle kısmındaki textboxlara çekilen veriler--------------------------
                    //Gun Ay yıl DropDownları Doldurma--------
                CinsiyetRb.Items.Add("ERKEK");
                CinsiyetRb.Items.Add("KADIN");
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
                //Gun Ay yıl DropDownları Doldurma--------
                //Textboxlara verileri çekme
                bilgiler();
                    Aktif();
                    Gecmis();
                }
            }
            else
            {
                Response.Redirect("PersonelGiris.aspx"); //session yoksa PersonelGiris.aspx sayfasına yönlendiriliyor.
            }
        }
        protected void Guncelle_Click(object sender, EventArgs e)
        {
            DateTime dogumTarihi = new DateTime(
            Convert.ToInt16(yil.SelectedItem.Value),
            Convert.ToInt16(ay.SelectedIndex + 1),
            Convert.ToInt16(gun.SelectedItem.Value));
            string duzenleTarih;
            duzenleTarih = dogumTarihi.Year.ToString() + "." + dogumTarihi.Month.ToString() + "." + dogumTarihi.Day.ToString();
            baglan.con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglan.con;
            komut.CommandText = "Update tblPersonel set ad='" + Ad.Text + "', soyad='" + Soyad.Text + "', adres='" + Adres.Text + "', cinsiyet='" + CinsiyetRb.Text + "', cepTel='" + Telefon.Text + "', email='" + Email.Text + "', dogumTar='" + duzenleTarih + "', dogumYer='" + DogumYeri.Text + "' where personelId='" + personelT.personelId + "'";
            komut.ExecuteNonQuery();
            baglan.con.Close();
            uyari.ForeColor = System.Drawing.Color.Green;
            uyari.Text = "Bilgileriniz Başarıyla Güncellenmiştir.";
        }
        protected void sifreDegistirBtn_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            SqlCommand guncelle = new SqlCommand();
            baglan.con.Open();
            komut.Connection = baglan.con;
            komut.CommandText = "Select * from tblKullanici where id ='" + Session["KullaniciAdi"].ToString() + "'";
            komut.ExecuteNonQuery();
            SqlDataReader dr = komut.ExecuteReader();
            if (dr.Read())
            {
                sifre = dr["pw"].ToString();
            }
            dr.Close();
            if (sifre == eskiSifre.Text)
            {
                guncelle.Connection = baglan.con;
                guncelle.CommandText = "Update tblKullanici set pw='" + yeniSifre.Text + "' where id='" + Session["KullaniciAdi"].ToString() + "'";
                guncelle.ExecuteNonQuery();
                uyari2.ForeColor = System.Drawing.Color.Green;
                uyari2.Text = "Şifreniz Başarıyla Değiştirildi";
                eskiSifre.Text = "";
                yeniSifre.Text = "";
                yeniSifre2.Text = "";
            }
            else
            {
                uyari2.ForeColor = System.Drawing.Color.Red;
                uyari2.Text = "Şuanki Şifrenizi yanlış Girdiniz.";
            }
            baglan.con.Close();
        }
        protected void CikisBtn_Click(object sender, EventArgs e)
        {
            Session.Abandon(); //sessionu siliyoruz.
            Response.Redirect("index.aspx"); //Anasayfaya yönlendiriyoruz.
        }
        protected void kulAdıDegistirBtn_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            SqlCommand guncelle = new SqlCommand();
            baglan.con.Open();
            komut.Connection = baglan.con;
            komut.CommandText = "Select id from tblKullanici where id ='" + kulAdıDüzenle.Text + "'";
            komut.ExecuteNonQuery();
            SqlDataReader dr = komut.ExecuteReader();
            if (dr.Read())
            {
                uyariKuladiDegistirLbl.Text = "Bu kullanıcı Adı kullanılmaktadır.";
                dr.Close();
            }
            else
            {
                dr.Close();
                guncelle.Connection = baglan.con;
                guncelle.CommandText = "Update tblKullanici set id='" + kulAdıDüzenle.Text + "' where pId='" + personelT.personelId + "'";
                guncelle.ExecuteNonQuery();
                uyariKuladiDegistirLbl.ForeColor = System.Drawing.Color.Green;
                uyariKuladiDegistirLbl.Text = "Kullanıcı Adı Başarıyla Değiştirildi";
                kulAdıDüzenle.Text = "";
            }
        }


        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            SqlCommand cmd = new SqlCommand("delete from tblRandevu where randevuId=" + id, baglan.con);
            baglan.con.Open(); // veritabanı bağlantı açma
            cmd.ExecuteNonQuery();
            baglan.con.Close(); // veritabanı bağlantı kapama
            Aktif();
        }
    }
}