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
    public partial class GenelMudurr : System.Web.UI.Page
    {
        Baglanti baglan = new Baglanti();
        PersonelBilgilerTek personelT = new PersonelBilgilerTek();
        static int personelnumarasi;
       
        public string sifre;
        public string mudurId;
        public static string personelId;
        public static string deneme;

        public void bilgiler()
        {
            //Personel bilgileri güncelle kısmındaki textboxlara veri çekme
            personelT.PersonelBilgilerT(mudurId);
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
        public void klinikler()
        {
            baglan.con.Open();
            string vericek = "select klinikAd from tblKlinik";
            SqlDataAdapter adptr = new SqlDataAdapter(vericek, baglan.con);
            DataTable dt = new DataTable(vericek);
            adptr.Fill(dt);
            personelklinik.DataSource = dt;
            personelklinik.DataTextField = "klinikAd";
            personelklinik.DataBind();
            kliniklistesi.DataSource = dt;
            kliniklistesi.DataTextField = "klinikAd";
            kliniklistesi.DataBind();
            kliniklistesi.Items.Insert(0, new ListItem("Tümü", String.Empty));
            kliniklistesi.SelectedIndex = 0;
            klinikpersonelekle.DataSource = dt;
            klinikpersonelekle.DataTextField = "klinikAd";
            klinikpersonelekle.DataBind();
            baglan.con.Close();
        }
        public void Unvanlar()
        {
            baglan.con.Open();

            string vericek2 = "select unvanAd from tblUnvan";
            SqlDataAdapter adptr2 = new SqlDataAdapter(vericek2, baglan.con);
            DataTable dt2 = new DataTable(vericek2);
            adptr2.Fill(dt2);
            personelunvan.DataSource = dt2;
            personelunvan.DataTextField = "unvanAd";
            personelunvan.DataBind();
            unvanpersonelekle.DataSource = dt2;
            unvanpersonelekle.DataTextField = "unvanAd";
            unvanpersonelekle.DataBind();
            baglan.con.Close();

        }
        public void Calisanlarlistesi()
        {
            baglan.con.Open();
            string vericek = "select personel.personelId as PersonelNumarası,personel.tcNo as TCKimlikNumarası,  personel.ad as Ad,  personel.soyad as Soyad, personel.adres as Adres,  personel.cinsiyet as Cinsiyet,  personel.ceptel as CepTelefonu, personel.email as Email,  personel.dogumTar as DoğumTarihi, personel.dogumYer as DogumYeri,  unvan.unvanAd as Unvan, klinik.klinikAd as KlinikAdı from tblKlinik klinik INNER JOIN tblPersonel personel ON klinik.klinikId=personel.klinikId  INNER JOIN tblUnvan unvan ON personel.UnvanId=unvan.unvanId";
            SqlDataAdapter adptr = new SqlDataAdapter(vericek, baglan.con);
            DataTable dt = new DataTable(vericek);
            adptr.Fill(dt);
            calisanlar.DataSource = dt;
            calisanlar.DataBind();
            baglan.con.Close();
        }
        public void Randevu()
        {
            baglan.con.Open();
            string hastasorgu = "select * from tblHasta";
            SqlDataAdapter adptr2 = new SqlDataAdapter(hastasorgu, baglan.con);
            DataTable dt3 = new DataTable(hastasorgu);
            adptr2.Fill(dt3);
            hastaGrid.DataSource = dt3;
            hastaGrid.DataBind();
            baglan.con.Close();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciAdi"] != null) //sayfa yüklendiği anda session kontrolü yapılıyor.
            {
                if (!IsPostBack)
            {
                baglan.con.Open();
                string sorguKulAdi = "select ad + ' ' + soyad as AdSoyad from tblPersonel where personelId=(select pId from tblKullanici where id ='" + Session["KullaniciAdi"].ToString() + "')";
                SqlCommand cmd1 = new SqlCommand(sorguKulAdi, baglan.con);
                kullaniciAdiLbl.Text = Convert.ToString(cmd1.ExecuteScalar()); //bununla personel tablosundaki adı alıyoruz
                string sorguUnvan = "select unvanAd from tblUnvan where unvanId=(select unvanId from tblPersonel where personelId=(select pId=(select pId from tblKullanici where id='" + Session["KullaniciAdi"].ToString() + "')))";
                SqlCommand cmd = new SqlCommand(sorguUnvan, baglan.con);
                unvan.Text = Convert.ToString(cmd.ExecuteScalar());
                string sorgumudurId = "select personelId from tblPersonel where personelId=(select pId from tblKullanici where id ='" + Session["KullaniciAdi"].ToString() + "')";
                SqlCommand cmd2 = new SqlCommand(sorgumudurId, baglan.con);
                mudurId = Convert.ToString(cmd2.ExecuteScalar());
                baglan.con.Close();


                //KLİNİK YÜKLEME
                klinikler();
                Unvanlar();
                Calisanlarlistesi();

                //TARİH YÜKELEME
                personelay.Items.Add("Ocak");
                personelay.Items.Add("Şubat");
                personelay.Items.Add("Mart");
                personelay.Items.Add("Nisan");
                personelay.Items.Add("Mayıs");
                personelay.Items.Add("Haziran");
                personelay.Items.Add("Temmuz");
                personelay.Items.Add("Ağustos");
                personelay.Items.Add("Eylül");
                personelay.Items.Add("Ekim");
                personelay.Items.Add("Kasım");
                personelay.Items.Add("Aralık");
                aypersonelekle.Items.Add("Ocak");
                aypersonelekle.Items.Add("Şubat");
                aypersonelekle.Items.Add("Mart");
                aypersonelekle.Items.Add("Nisan");
                aypersonelekle.Items.Add("Mayıs");
                aypersonelekle.Items.Add("Haziran");
                aypersonelekle.Items.Add("Temmuz");
                aypersonelekle.Items.Add("Ağustos");
                aypersonelekle.Items.Add("Eylül");
                aypersonelekle.Items.Add("Ekim");
                aypersonelekle.Items.Add("Kasım");
                aypersonelekle.Items.Add("Aralık");
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
                CinsiyetRb.Items.Add("ERKEK");
                CinsiyetRb.Items.Add("KADIN");

                for (int i = 1; i < 32; i++)
                {
                    personelgun.Items.Add(i.ToString());
                    gunpersonelekle.Items.Add(i.ToString());
                    gun.Items.Add(i.ToString());
                }

                for (int i = 2010; i > 1950; i--)
                {
                    personelyil.Items.Add(i.ToString());
                    yilpersonelekle.Items.Add(i.ToString());
                    yil.Items.Add(i.ToString());
                }

                // KLİNİK EKLEMEK İÇİN İLLERİ DOLDURMA
                baglan.con.Open();
                string illersorgusu = "select ilAd from tblIller";
                SqlDataAdapter adptr = new SqlDataAdapter(illersorgusu, baglan.con);
                DataTable dt = new DataTable(illersorgusu);
                adptr.Fill(dt);
                ilklinikekle.DataSource = dt;
                ilklinikekle.DataTextField = "ilAd";
                ilklinikekle.DataBind();
                ilklinikekle.Items.Insert(0, new ListItem("İl Seçin", String.Empty));
                ilklinikekle.SelectedIndex = 0;

                // RANDEVULAR 
                string randevusorgu = "select hasta.ad+' '+hasta.soyad as HastaAdSoyad, klinik.klinikAd as KlinikAd, personel.ad+' '+personel.soyad as DoktorAdSoyad, CONVERT(VARCHAR(10),randevu.gun,104) as Tarih, randevu.saat as Saat from tblRandevu randevu INNER JOIN tblHasta hasta on randevu.hastaId=hasta.hastaId INNER JOIN tblPersonel personel ON randevu.disciId=personel.personelId INNER JOIN tblKlinik klinik ON personel.klinikId=klinik.klinikId order by gun desc,saat desc";
                SqlDataAdapter adptr1 = new SqlDataAdapter(randevusorgu, baglan.con);
                DataTable dt2 = new DataTable(randevusorgu);
                adptr1.Fill(dt2);
                randevuGrid.DataSource = dt2;
                randevuGrid.DataBind();
                baglan.con.Close();
                //HASTA BİLGİLERİ 

                Randevu();
                bilgiler();



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
        
        // KLİNİK LİSTESİNE GÖRE ÇALIŞAN LİSTELEME BAŞLANGIÇ ----------------------
        protected void kliniklistesi_SelectedIndexChanged(object sender, EventArgs e)
        {
            int secim = kliniklistesi.SelectedIndex;
            if (kliniklistesi.SelectedIndex==0)
            {
                baglan.con.Open();
                string vericek = "select personel.personelId as PersonelNumarası,personel.tcNo as TCKimlikNumarası,  personel.ad as Ad,  personel.soyad as Soyad, personel.adres as Adres,  personel.cinsiyet as Cinsiyet,  personel.ceptel as CepTelefonu, personel.email as Email,   CONVERT(VARCHAR(10),personel.dogumTar ,104) as DoğumTarihi, personel.dogumYer as DogumYeri,  unvan.unvanAd as Unvan, klinik.klinikAd as KlinikAdı from tblKlinik klinik INNER JOIN tblPersonel personel ON klinik.klinikId=personel.klinikId  INNER JOIN tblUnvan unvan ON personel.UnvanId=unvan.unvanId";
                SqlDataAdapter adptr = new SqlDataAdapter(vericek, baglan.con);
                DataTable dt = new DataTable(vericek);
                adptr.Fill(dt);
                calisanlar.DataSource = dt;
                calisanlar.DataBind();
                baglan.con.Close();
            }
            else {
                
                baglan.con.Open();
                string vericek = "select personel.personelId as PersonelNumarası,personel.tcNo as TCKimlikNumarası,  personel.ad as Ad,  personel.soyad as Soyad, personel.adres as Adres,   personel.cinsiyet as Cinsiyet,  personel.ceptel as CepTelefonu, personel.email as Email,  CONVERT(VARCHAR(10),personel.dogumTar ,104) as DoğumTarihi, personel.dogumYer as DogumYeri,  unvan.unvanAd as Unvan, klinik.klinikAd as KlinikAdı from tblKlinik klinik INNER JOIN tblPersonel personel ON klinik.klinikId = personel.klinikId  INNER JOIN tblUnvan unvan ON personel.UnvanId = unvan.unvanId where klinik.klinikAd='" + kliniklistesi.Text+"'";
                SqlDataAdapter adptr = new SqlDataAdapter(vericek, baglan.con);
                DataTable dt = new DataTable(vericek);
                adptr.Fill(dt);
                calisanlar.DataSource = dt;
                calisanlar.DataBind();
                baglan.con.Close();
            }
           
        }

        // KLİNİK LİSTESİNE GÖRE ÇALIŞAN LİSTELEME SON ----------------------------


        protected void calisanlar_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            /*GRİDVİEW SİL BUTONU */
            string id = calisanlar.DataKeys[e.RowIndex].Value.ToString();
            SqlCommand cmd = new SqlCommand("delete from tblPersonel where personelId=" + id, baglan.con);
            baglan.con.Open();
            cmd.ExecuteNonQuery();
            baglan.con.Close();
            Calisanlarlistesi();
                       
            /*GRİDVİEW SİL BUTONU SONU */
        }
        
        // SEÇİLİ PERSONELİ DÜZENLEME PANELİ--------------------------------------------------------
        protected void calisanlar_SelectedIndexChanged(object sender, EventArgs e)
        {

            personelduzenle.Visible = true;
            kadinpersonelguncelle.Checked = false;
            erkekpersonelguncelle.Checked = false;

            personeltc.Text = calisanlar.SelectedRow.Cells[2].Text;
            personeladi.Text = HttpUtility.HtmlDecode(calisanlar.SelectedRow.Cells[3].Text);
            personelsoyadi.Text = HttpUtility.HtmlDecode(calisanlar.SelectedRow.Cells[4].Text);
            personeladres.Text = HttpUtility.HtmlDecode(calisanlar.SelectedRow.Cells[5].Text);
            if (calisanlar.SelectedRow.Cells[6].Text=="ERKEK")
            {
                erkekpersonelguncelle.Checked = true;
            }
            else 
            {
                kadinpersonelguncelle.Checked = true;
            }

            personeltelefon.Text = calisanlar.SelectedRow.Cells[7].Text;
            personelemail.Text = HttpUtility.HtmlDecode(calisanlar.SelectedRow.Cells[8].Text);
            DateTime tarih;
            tarih = Convert.ToDateTime(calisanlar.SelectedRow.Cells[9].Text);
            personelgun.Text = tarih.Day.ToString();
            personelay.SelectedIndex = tarih.Month - 1;
            personelyil.Text = tarih.Year.ToString();
            personeldogumyeri.Text = HttpUtility.HtmlDecode(calisanlar.SelectedRow.Cells[10].Text);
            personelunvan.Text = HttpUtility.HtmlDecode(calisanlar.SelectedRow.Cells[11].Text);
            personelklinik.Text = HttpUtility.HtmlDecode(calisanlar.SelectedRow.Cells[12].Text);
            personelnumarasi =Convert.ToInt32( calisanlar.SelectedRow.Cells[1].Text);
       
        }
        string personelcinsiyet;
      

        // SEÇİLİ PERSONELİ DÜZENLEME PANELİ  SON--------------------------------------------------------

            //PeRONEL GUNCELLE CLİCK -----------------------------------
        protected void personelGuncelle_Click(object sender, EventArgs e)
        {

            DateTime dogumTarihi = new DateTime(
             Convert.ToInt16(personelyil.SelectedItem.Value),
             Convert.ToInt16(personelay.SelectedIndex + 1),
             Convert.ToInt16(personelgun.SelectedItem.Value));
            string duzenleTarih;
            duzenleTarih = dogumTarihi.Year.ToString() + "-" + dogumTarihi.Month.ToString() + "-" + dogumTarihi.Day.ToString();
            if (erkekpersonelguncelle.Checked)
                personelcinsiyet = "ERKEK";
            else
                personelcinsiyet = "KADIN";
            baglan.con.Open();

           
            string personelunvannocek = "select unvanId from tblUnvan where unvanAd='"+personelunvan.Text+"'";
            String personelunvanno;
            SqlCommand cmd1 = new SqlCommand(personelunvannocek, baglan.con);
            personelunvanno = Convert.ToString(cmd1.ExecuteScalar());

            string kliniknocek = "select klinikId from tblKlinik where klinikAd='" + personelklinik.Text + "'";
            String klinikno;
            SqlCommand cmd2 = new SqlCommand(kliniknocek, baglan.con);
            klinikno = Convert.ToString(cmd2.ExecuteScalar());


            SqlCommand guncelle = new SqlCommand("update tblPersonel set tcNO='"+personeltc.Text+"', ad='"+personeladi.Text+"', soyad='"+personelsoyadi.Text+"', adres='"+personeladres.Text+"', cinsiyet='"+personelcinsiyet+"', cepTel='"+personeltelefon.Text+"', email='"+personelemail.Text+"', dogumTar='"+ duzenleTarih + "',  dogumYer='" + personeldogumyeri.Text + "',  unvanId='" + personelunvanno+"', klinikId='"+klinikno+"' where personelId='"+personelnumarasi+"'",baglan.con);
            personeladi.Text = personelnumarasi.ToString();
            guncelle.ExecuteNonQuery();
            baglan.con.Close();
            personelduzenle.Visible = false;
            Calisanlarlistesi();
        }


        string cinsiyet;
        //PeRsONEL GUNCELLE CLİCK SON -----------------------------------

        protected void personelekle_Click(object sender, EventArgs e)
        {
            baglan.con.Open();
            DateTime personelDogumTarihi = new DateTime(
            Convert.ToInt16(yilpersonelekle.SelectedItem.Value),
            Convert.ToInt16(aypersonelekle.SelectedIndex + 1),
            Convert.ToInt16(gunpersonelekle.SelectedItem.Value));
            string DogumTarihi;
            DogumTarihi = personelDogumTarihi.Year.ToString() + "-" + personelDogumTarihi.Month.ToString() + "-" + personelDogumTarihi.Day.ToString();
           
            if (erkekpersonelekle.Checked)
                cinsiyet = "ERKEK";
            else
                cinsiyet = "KADIN";
            string personelekleunvannocek = "select unvanId from tblUnvan where unvanAd='" + unvanpersonelekle.Text + "'";
            String personelekleunvanno;
            SqlCommand cmd1 = new SqlCommand(personelekleunvannocek, baglan.con);
            personelekleunvanno = Convert.ToString(cmd1.ExecuteScalar());

            string personeleklekliniknocek = "select klinikId from tblKlinik where klinikAd='" + klinikpersonelekle.Text + "'";
            String personekleklinikno;
            SqlCommand cmd2 = new SqlCommand(personeleklekliniknocek, baglan.con);
            personekleklinikno = Convert.ToString(cmd2.ExecuteScalar());

           
            SqlCommand kaydet = new SqlCommand("insert into tblPersonel values('"+tcpersonelekle.Text+"','"+adpersonelekle.Text+"','"+soyadpersonelekle.Text+"','"+adrespersonelekle.Text+"','"+cinsiyet+"','"+ceptelefonupersonelekle.Text+"','"+emailpersonelekle.Text+"','"+DogumTarihi+"','"+dogumyeripersonelekle.Text+"','"+personelekleunvanno+"', '"+personekleklinikno+"')",baglan.con);
            kaydet.ExecuteNonQuery();

            string personelSorguId = "select personelId from tblPersonel where tcNo='"+ tcpersonelekle.Text +"'";
            string personelEklePersonelId;
            SqlCommand cmd3 = new SqlCommand(personelSorguId, baglan.con);
            personelEklePersonelId = Convert.ToString(cmd3.ExecuteScalar());

            SqlCommand kaydet2 = new SqlCommand("insert into tblKullanici values('"+kullaniciadipersonelekle.Text+"','"+sifrepersonelekle.Text+"','"+personelEklePersonelId+"')",baglan.con);
            kaydet2.ExecuteNonQuery();

            baglan.con.Close();
            tcpersonelekle.Text = "";
            adpersonelekle.Text = "";
            soyadpersonelekle.Text = "";
            adrespersonelekle.Text = "";
            emailpersonelekle.Text = "";
            ceptelefonupersonelekle.Text = "";
            dogumyeripersonelekle.Text = "";
            kullaniciadipersonelekle.Text = "";
            sifrepersonelekle.Text="";

        }

       
        //KLİNİK İL DEĞİŞİNCE İLÇE GELME---------------------------
        protected void ilklinikekle_SelectedIndexChanged(object sender, EventArgs e)
        {
            baglan.con.Open();
            string illersorgusu = "select ilceAd from tblIlceler where ilId=(select ilId from tblIller where ilAd='"+ilklinikekle.Text+"')";
            SqlDataAdapter adptr = new SqlDataAdapter(illersorgusu, baglan.con);
            DataTable dt = new DataTable(illersorgusu);
            adptr.Fill(dt);
            ilceklinikekle.DataSource = dt;
            ilceklinikekle.DataTextField = "ilceAd";
            ilceklinikekle.DataBind();
            ilceklinikekle.Items.Insert(0, new ListItem("İlce Seçin", String.Empty));
            ilceklinikekle.SelectedIndex = 0;
            baglan.con.Close();
        }
        //KLİNİK İL DEĞİŞİNCE İLÇE GELME SONU---------------------------

            // KLİNİK EKLE BUTONU ---------------------------------------
        protected void klinikEkleBtn_Click(object sender, EventArgs e)
        {
            baglan.con.Open();


            string KlinikilIdsorgu = "select ilId from tblIller where ilAd='" + ilklinikekle.Text + "'";
            string klinikilId;
            SqlCommand cmd = new SqlCommand(KlinikilIdsorgu, baglan.con);
            klinikilId = Convert.ToString(cmd.ExecuteScalar());

            string KlinikilceIdsorgu = "select ilceId from tblIlceler where ilceAd='" + ilceklinikekle.Text + "'";
            string klinikilceId;
            SqlCommand cmd2 = new SqlCommand(KlinikilceIdsorgu, baglan.con);
            klinikilceId = Convert.ToString(cmd2.ExecuteScalar());

            SqlCommand klinikeklemekomut = new SqlCommand("insert into tblKlinik values('"+ klinikilId + "','"+ klinikilceId + "','"+klinikAdklinikekle.Text+"','"+klinikAdresklinikekle.Text+"')",baglan.con);
            klinikeklemekomut.ExecuteNonQuery();
            baglan.con.Close();
            ilklinikekle.Text = "";
            ilceklinikekle.Items.Clear();
            klinikAdklinikekle.Text = "";
            klinikAdresklinikekle.Text = "";
        }
        // KLİNİK EKLE BUTONU SONU ---------------------------------------
        protected void hastaGrid_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[1].Visible = false;

            }
        }

        protected void hastaGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = hastaGrid.DataKeys[e.RowIndex].Value.ToString();
            SqlCommand cmd = new SqlCommand("delete from tblHasta where hastaId=" + id, baglan.con);
            baglan.con.Open();
            cmd.ExecuteNonQuery();
            baglan.con.Close();

            Randevu();
        }
        
    }
}