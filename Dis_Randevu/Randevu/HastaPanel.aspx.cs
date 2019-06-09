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
    public partial class HastaPanel : System.Web.UI.Page
    {
        Baglanti baglan = new Baglanti();
        HastaBilgilerTek hastaT = new HastaBilgilerTek();

        static int doktorid;
        DateTime secilenTarih;
        int[] saatler = new int[10] { 8, 9, 10, 11, 12, 13, 14, 15, 16, 17 };
        /* Randevu Saatleri */
        public void bilgiler()
        {
            //Labellere hastanın bilgilerini yazdırma
            hastaT.HastaBilgilerT(Session["HastaTC"].ToString());
            hastaId.Text = hastaT.hastaId;
            hastaTc.Text = hastaT.hastaTc;
            adB.Text=hastaT.ad;
            soyadB.Text = hastaT.soyad;
            adresB.Text = hastaT.adres;
            cinsiyetB.Text = hastaT.cinsiyet;
            telefonB.Text = hastaT.cepTel;
            emailB.Text = hastaT.email;
            dogumTarB.Text = hastaT.dogumTar;
            dogumYerB.Text = hastaT.dogumYer;
            kanGrubuB.Text = hastaT.kanGrubu;
        }     
        /*RANDEVU GEÇMİŞİ FONKSİYONLARI  */
        public void AktifRandevular()
        {
            baglan.con.Open();
            string vericek = "select  hasta.ad+' '+hasta.soyad as HastaAdSoyad, klinik.klinikAd as KlinikAd, personel.ad+' '+personel.soyad as DoktorAdSoyad, CONVERT(VARCHAR(10),randevu.gun,104) as Tarih, randevu.saat as Saat, randevu.randevuId as RandevuNumarası from tblRandevu randevu  INNER JOIN tblHasta hasta on randevu.hastaId=hasta.hastaId INNER JOIN tblPersonel personel ON randevu.disciId=personel.personelId  INNER JOIN tblKlinik klinik ON personel.klinikId=klinik.klinikId where randevu.hastaId=" + hastaId.Text + " and randevu.silinmiş=0 order by gun asc,saat asc";
            SqlDataAdapter adptr = new SqlDataAdapter(vericek, baglan.con);
            DataTable dt = new DataTable(vericek);
            adptr.Fill(dt);
            randevuGecmisiGrid2.DataSource = dt;
            randevuGecmisiGrid2.DataBind();
            baglan.con.Close();
        }
        public void RandevuGecmis()
        {
            baglan.con.Open();
            string vericek = "select hasta.ad+' '+hasta.soyad as HastaAdSoyad, klinik.klinikAd as KlinikAd, personel.ad+' '+personel.soyad as DoktorAdSoyad, CONVERT(VARCHAR(10),randevu.gun,104) as Tarih, randevu.saat as Saat from tblRandevu randevu INNER JOIN tblHasta hasta on randevu.hastaId=hasta.hastaId INNER JOIN tblPersonel personel ON randevu.disciId=personel.personelId INNER JOIN tblKlinik klinik ON personel.klinikId=klinik.klinikId  where randevu.hastaId=" + hastaId.Text + " and randevu.silinmiş=1 order by gun desc,saat desc";
            SqlDataAdapter adptr = new SqlDataAdapter(vericek, baglan.con);
            DataTable dt = new DataTable(vericek);
            adptr.Fill(dt);
            randevuGecmisiGrid.DataSource = dt;
            randevuGecmisiGrid.DataBind();
            baglan.con.Close();
        }
        /*RANDEVU GEÇMİŞİ FONKSİYONLARI SONU  */
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["HastaTC"] != null) //sayfa yüklendiği anda session kontrolü yapılıyor.
            {
                if (!IsPostBack)
                {                    
                    baglan.con.Open();
                    string sorguHastaAdSoyad = "select ad + ' ' + soyad as AdSoyad from tblHasta where hastaTc='" + Session["HastaTC"].ToString() + "'";
                    SqlCommand cmd = new SqlCommand(sorguHastaAdSoyad, baglan.con);
                    hastaAdSoyad.Text = Convert.ToString(cmd.ExecuteScalar()); //bununla hasta tablosundaki adı soyadı alıyoruz
                    baglan.con.Close();
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
                    bilgiler();
                    AktifRandevular();
                    RandevuGecmis();
                    //Randeu Al Kodları----------------------------------
                    ilce.Enabled = false;
                    klinik.Enabled = false;
                    doktor.Enabled = false;
                    tarih.Enabled = false;
                    saat.Enabled = false;


                    /* İLLER DROPDOWNLİSTİ DOLDURMA */
                    baglan.con.Open();
                    SqlCommand komut = new SqlCommand("select ilAd from tblIller where aktif=1", baglan.con);
                    SqlDataReader dr = komut.ExecuteReader();
                    il.DataSource = dr;
                    il.DataTextField = "ilAd";
                    il.DataBind();
                    il.Items.Insert(0, new ListItem("İl Seçin", String.Empty));
                    il.SelectedIndex = 0;
                    dr.Close();
                    baglan.con.Close();
                    /* İLLER DROPDOWNLİSTİ DOLDURMA SONU */
                    //------------------------------------------------------
                }
            }
            else
            {
                Response.Redirect("GirisYap.aspx"); //session yoksa GirisYap.aspx sayfasına yönlendiriliyor.
            }
            
        }
        protected void duzenle_Click(object sender, EventArgs e)
        {
            if (duzenlePanel.Visible == true)
            {
                duzenlePanel.Visible = false;
            }
            else
            {
                //Textboxlara hastanın bilgilerini yazdırma.
                hastaT.HastaBilgilerT(Session["HastaTC"].ToString());
                duzenlePanel.Visible = true;
                Ad.Text = hastaT.ad;
                Soyad.Text = hastaT.soyad;
                Adres.Text = hastaT.adres;
                CinsiyetRb.Text = hastaT.cinsiyet;
                Telefon.Text = hastaT.cepTel;
                Email.Text = hastaT.email;
                DateTime tarih;
                tarih = Convert.ToDateTime(hastaT.dogumTar);
                gun.Text = tarih.Day.ToString();
                ay.SelectedIndex = tarih.Month - 1;
                yil.Text = tarih.Year.ToString();
                DogumYeri.Text = hastaT.dogumYer;
                KanGrubu.Text = hastaT.kanGrubu;
            }
        }
        protected void Guncelle_Click(object sender, EventArgs e)
        {
           DateTime dogumTarihi = new DateTime(
           Convert.ToInt16(yil.SelectedItem.Value),
           Convert.ToInt16(ay.SelectedIndex + 1),
           Convert.ToInt16(gun.SelectedItem.Value));
            string duzenleTarih;
            duzenleTarih = dogumTarihi.Year.ToString()+"."+ dogumTarihi.Month.ToString() + "." + dogumTarihi.Day.ToString();
            baglan.con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglan.con;
            komut.CommandText = "Update tblHasta set ad='" + Ad.Text + "', soyad='" + Soyad.Text + "', adres='" + Adres.Text + "', cinsiyet='" + CinsiyetRb.Text + "', cepTel='" + Telefon.Text + "', email='" + Email.Text + "', dogumTar='" + duzenleTarih + "', dogumYer='" + DogumYeri.Text + "', kanGrubu='" + KanGrubu.Text + "' where hastaTc='" + Session["HastaTC"].ToString() + "'";
            komut.ExecuteNonQuery();
            baglan.con.Close();
            duzenlePanel.Visible = false;
            bilgiler();
        }
        protected void sifreDegistirBtn_Click(object sender, EventArgs e)
        {
            SqlCommand guncelle = new SqlCommand();
            if (hastaT.sifre == eskiSifre.Text)
            {
                baglan.con.Open();
                guncelle.Connection = baglan.con;
                guncelle.CommandText = "Update tblHasta set sifre='" + yeniSifre.Text + "' where hastaTc='" + Session["HastaTC"].ToString() + "'";
                guncelle.ExecuteNonQuery();
                uyari.ForeColor = System.Drawing.Color.Green;
                uyari.Text = "Şifreniz Başarıyla Değiştirildi";
                eskiSifre.Text = "";
                yeniSifre.Text = "";
                yeniSifre2.Text = "";
            }
            else
            {
                uyari.ForeColor = System.Drawing.Color.Red;
                uyari.Text = "Şuanki Şifrenizi yanlış Girdiniz.";
            }
            baglan.con.Close();
        }
        //------------------------------Randevu Al kodları-----------------------------------------------------------
        protected void il_SelectedIndexChanged(object sender, EventArgs e)
        {
            /* İLÇELER DROPDOWNLİSTİ DOLDURMA */
            ilce.Enabled = true;
            baglan.con.Open();
            string sql_sorgum = "select ilceAd from tblIlceler where ilId=(select ilId from tblIller where ilAd='" + il.Text + "') and aktif=1";
            SqlDataAdapter adptr = new SqlDataAdapter(sql_sorgum, baglan.con);
            DataTable dt = new DataTable(sql_sorgum);
            adptr.Fill(dt);
            ilce.DataSource = dt;
            ilce.DataTextField = "ilceAd";
            ilce.DataBind();
            ilce.Items.Insert(0, new ListItem("İlçe Seçin", String.Empty));
            ilce.SelectedIndex = 0;
            baglan.con.Close();
            klinik.Enabled = false;
            doktor.Enabled = false;
            tarih.Enabled = false;
            saat.Enabled = false;
            klinik.Items.Clear();
            doktor.Items.Clear();
            saat.Items.Clear();
            /* İLÇELER DROPDOWNLİSTİ DOLDURMA SONU */

        }

        protected void ilce_SelectedIndexChanged(object sender, EventArgs e)
        {
            /* KLİNİK DROPDOWNLİSTİ DOLDURMA */
            klinik.Enabled = true;
            baglan.con.Open();
            SqlCommand komut3 = new SqlCommand("select klinikAd from tblKlinik where ilceId=(select ilceId from tblIlceler where ilceAd='" + ilce.Text + "') ", baglan.con);
            SqlDataReader dr3 = komut3.ExecuteReader();
            klinik.DataSource = dr3;
            klinik.DataTextField = "klinikAd";
            klinik.DataBind();
            klinik.Items.Insert(0, new ListItem("Klinik Seçin", String.Empty));
            klinik.SelectedIndex = 0;
            dr3.Close();
            baglan.con.Close();
            doktor.Enabled = false;
            tarih.Enabled = false;
            saat.Enabled = false;
            doktor.Items.Clear();
            saat.Items.Clear();
            /* KLİNİK DROPDOWNLİSTİ DOLDURMA SONU */
        }
        protected void klinik_SelectedIndexChanged(object sender, EventArgs e)
        {
            /* DOKTOR DROPDOWNLİSTİ DOLDURMA */
            doktor.Enabled = true;
            baglan.con.Open();
            string sql_sorgum = "select ad +' '+soyad as adsoyad , personelId from tblPersonel where klinikId=(select klinikId from tblKlinik where klinikAd='" + klinik.Text + "') and unvanId=2 ";
            SqlDataAdapter adptr = new SqlDataAdapter(sql_sorgum, baglan.con);
            DataTable dt = new DataTable(sql_sorgum);
            adptr.Fill(dt);
            doktor.DataSource = dt;
            doktor.DataTextField = "adsoyad";
            doktor.DataValueField = "personelId";
            doktor.DataBind();
            doktor.Items.Insert(0, new ListItem("Doktor Seçin", String.Empty));
            doktor.SelectedIndex = 0;
            baglan.con.Close();
            tarih.Enabled = false;
            saat.Enabled = false;
            saat.Items.Clear();
            /* DOKTOR DROPDOWNLİSTİ DOLDURMA SONU */
        }

        protected void tarih_DayRender(object sender, DayRenderEventArgs e)
        {
            /* CALENDER (TARİH) KISITLAMA KODLARI */
            DateTime a = DateTime.Today.AddDays(13);
            if (e.Day.IsOtherMonth || e.Day.Date < DateTime.Now.Date || e.Day.Date > a.Date || e.Day.IsWeekend)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Gray;
            }
            /* CALENDER (TARİH) KISITLAMA KODLARI SONU */
        }


        protected void doktor_SelectedIndexChanged(object sender, EventArgs e)
        {
            /* CLANEDAR(TARİHİ) AKTİF ETME KODU */

            if (doktor.SelectedIndex != 0)
            {
                doktorid = Convert.ToInt32(doktor.SelectedValue);
                tarih.SelectedDates.Clear();
                tarih.Enabled = true;
            }
            else
            {
                tarih.Enabled = false;
            }
            saat.Enabled = false;
            saat.Items.Clear();
            /* CLANEDAR(TARİHİ) AKTİF ETME KODU SONU */
        }

        protected void tarih_SelectionChanged(object sender, EventArgs e)
        {
            /* SAAT DROPDOWNLİSTİNİ DOLDURMA KODU */
            saat.Items.Clear();
            saat.Enabled = true;

            secilenTarih = tarih.SelectedDate;
            baglan.con.Open();
            for (int i = 0; i < 10; i++)
            {
                string sql_sorgum = "SELECT * FROM tblRandevu where disciId=@disciId and silinmiş=0 and saat=@saat and gun=@tarih";
                SqlDataAdapter adptr = new SqlDataAdapter(sql_sorgum, baglan.con);
                adptr.SelectCommand.Parameters.AddWithValue("@disciId", doktorid);
                adptr.SelectCommand.Parameters.AddWithValue("@saat", saatler[i]);
                adptr.SelectCommand.Parameters.AddWithValue("@tarih", secilenTarih);
                DataTable dt = new DataTable();
                adptr.Fill(dt);
                if (dt.Rows.Count == 0 && saatler[i] != 13 && saatler[i] != 17)
                {
                    saat.Items.Add(saatler[i].ToString() + ":00 - " + saatler[i + 1] + ":00");
                }

            }
            baglan.con.Close();
            /* SAAT DROPDOWNLİSTİNİ DOLDURMA KODU */

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            /*RANDEVU AL BUTONU KODLARI */
            baglan.con.Open();
            if (saat.Text == "8:00 - 9:00")
            {
                SqlCommand komut = new SqlCommand("insert into tblRandevu (hastaId,disciId,gun,saat) values ("+hastaId.Text+"," + doktor.SelectedValue + " ,'" + tarih.SelectedDate.ToString("MM.dd.yyyy") + "'," + 8 + ")", baglan.con);
                komut.ExecuteNonQuery();
            }
            else if (saat.Text == "9:00 - 10:00")
            {
                SqlCommand komut = new SqlCommand("insert into tblRandevu (hastaId,disciId,gun,saat) values (" + hastaId.Text + "," + doktor.SelectedValue + " ,'" + tarih.SelectedDate.ToString("MM.dd.yyyy") + "'," + 9 + ")", baglan.con);
                komut.ExecuteNonQuery();
            }
            else if (saat.Text == "10:00 - 11:00")
            {
                SqlCommand komut = new SqlCommand("insert into tblRandevu (hastaId,disciId,gun,saat) values (" + hastaId.Text + "," + doktor.SelectedValue + " ,'" + tarih.SelectedDate.ToString("MM.dd.yyyy") + "'," + 10 + ")", baglan.con);
                komut.ExecuteNonQuery();
            }
            else if (saat.Text == "11:00 - 12:00")
            {
                SqlCommand komut = new SqlCommand("insert into tblRandevu (hastaId,disciId,gun,saat) values (" + hastaId.Text + "," + doktor.SelectedValue + " ,'" + tarih.SelectedDate.ToString("MM.dd.yyyy") + "'," + 11 + ")", baglan.con);
                komut.ExecuteNonQuery();
            }
            else if (saat.Text == "12:00 - 13:00")
            {
                SqlCommand komut = new SqlCommand("insert into tblRandevu (hastaId,disciId,gun,saat) values (" + hastaId.Text + "," + doktor.SelectedValue + " ,'" + tarih.SelectedDate.ToString("MM.dd.yyyy") + "'," + 12 + ")", baglan.con);
                komut.ExecuteNonQuery();
            }
            else if (saat.Text == "14:00 - 15:00")
            {
                SqlCommand komut = new SqlCommand("insert into tblRandevu (hastaId,disciId,gun,saat) values (" + hastaId.Text + "," + doktor.SelectedValue + " ,'" + tarih.SelectedDate.ToString("MM.dd.yyyy") + "'," + 14 + ")", baglan.con);
                komut.ExecuteNonQuery();
            }
            else if (saat.Text == "15:00 - 16:00")
            {
                SqlCommand komut = new SqlCommand("insert into tblRandevu (hastaId,disciId,gun,saat) values (" + hastaId.Text + "," + doktor.SelectedValue + " ,'" + tarih.SelectedDate.ToString("MM.dd.yyyy") + "'," + 15 + ")", baglan.con);
                komut.ExecuteNonQuery();
            }
            else if (saat.Text == "16:00 - 17:00")
            {
                SqlCommand komut = new SqlCommand("insert into tblRandevu (hastaId,disciId,gun,saat) values (" + hastaId.Text + "," + doktor.SelectedValue + " ,'" + tarih.SelectedDate.ToString("MM.dd.yyyy") + "'," + 16 + ")", baglan.con);
                komut.ExecuteNonQuery();
            }
            else
            {
                basarili.Text="Uygun Değer Seçiniz";
            }

            basarili.Text = "Randevu Başarılı";

            ilce.Enabled = false;
            klinik.Enabled = false;
            doktor.Enabled = false;
            tarih.Enabled = false;
            saat.Enabled = false;
            il.Text = "";
            ilce.Items.Clear();
            klinik.Items.Clear();
            doktor.Items.Clear();
            tarih.SelectedDates.Clear();
            saat.Items.Clear();


            baglan.con.Close();
            /*RANDEVU AL BUTONU KODLARI SONU */

        }
        //------------------------------Randevu Al kodları Son---------------------------------------------------------

        //---------------------------------------RANDEVU GEÇMİŞİ-----------------------------------------------------

        protected void guncelleme_Click(object sender, EventArgs e)
        {
            /*RANDEVULARDAKİ GÜNCELLE BUTONU*/
            RandevuGecmis();
            AktifRandevular();
            /*GÜNCELLE BUTONU SONU*/

        }

        protected void randevuGecmisiGrid2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            /*GRİDVİEW SİL BUTONU */
            string id = randevuGecmisiGrid2.DataKeys[e.RowIndex].Value.ToString();
            SqlCommand cmd = new SqlCommand("delete from tblRandevu where randevuId=" + id, baglan.con);
            baglan.con.Open();
            cmd.ExecuteNonQuery();
            baglan.con.Close();
            AktifRandevular();
            /*GRİDVİEW SİL BUTONU SONU */
        }
        protected void randevuGecmisiGrid2_RowCreated(object sender, GridViewRowEventArgs e)
        {
            /*Randevu Geçmişi Sütun Gizleme KodU*/
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[6].Visible = false;

            }
            /*Randevu Geçmişi Sütun Gizleme Kodu SONU*/
        }

        //------------------------------RANDEVU GEÇMİŞİ SONU-------------------------------------------------
        protected void CikisBtn_Click(object sender, EventArgs e)
        {
            Session.Abandon(); //sessionu siliyoruz.
            Response.Redirect("index.aspx"); //Anasayfaya yönlendiriyoruz.
        }
    }
}