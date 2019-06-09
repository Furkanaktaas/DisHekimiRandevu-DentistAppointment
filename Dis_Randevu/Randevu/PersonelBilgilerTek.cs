using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace WebProjeTemplate
{
    public class PersonelBilgilerTek
    {
        //Personel giriş yaptıktan sonraki Textboxtan alınan Kullanıcı adı ile giriş yapan personele ait bilgiler
        Baglanti baglan = new Baglanti();
        static string _personelId, _tcNo, _ad, _soyad, _adres, _cinsiyet, _cepTel, _email, _dogumTar, _dogumYer, _unvanId, _klinikId, _unvanAd, _klinikAd;

        public string personelId
        {
            get
            {
                return _personelId;
            }

            set
            {
                _personelId = value;
            }
        }
        public string tcNo
        {
            get
            {
                return _tcNo;
            }

            set
            {
                _tcNo = value;
            }
        }
        public string ad
        {
            get
            {
                return _ad;
            }

            set
            {
                _ad = value;
            }
        }
        public string soyad
        {
            get
            {
                return _soyad;
            }

            set
            {
                _soyad = value;
            }
        }
        public string adres
        {
            get
            {
                return _adres;
            }

            set
            {
                _adres = value;
            }
        }
        public string cinsiyet
        {
            get
            {
                return _cinsiyet;
            }

            set
            {
                _cinsiyet = value;
            }
        }
        public string cepTel
        {
            get
            {
                return _cepTel;
            }

            set
            {
                _cepTel = value;
            }
        }
        public string email
        {
            get
            {
                return _email;
            }

            set
            {
                _email = value;
            }
        }
        public string dogumTar
        {
            get
            {
                return _dogumTar;
            }

            set
            {
                _dogumTar = value;
            }
        }
        public string dogumYer
        {
            get
            {
                return _dogumYer;
            }

            set
            {
                _dogumYer = value;
            }
        }
        public string unvanId
        {
            get
            {
                return _unvanId;
            }

            set
            {
                _unvanId = value;
            }
        }
        public string klinikId
        {
            get
            {
                return _klinikId;
            }

            set
            {
                _klinikId = value;
            }
        }
        public string unvanAd
        {
            get
            {
                return _unvanAd;
            }

            set
            {
                _unvanAd = value;
            }
        }
        public string klinikAd
        {
            get
            {
                return _klinikAd;
            }

            set
            {
                _klinikAd = value;
            }
        }
        public void PersonelBilgilerT(string yollaPerseonelId)
        {
            baglan.con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglan.con;
            komut.CommandText = "SELECT p.personelId,p.tcNo,p.ad,p.soyad,p.adres,p.cinsiyet,p.cepTel,p.email,p.dogumTar,p.dogumYer,p.unvanId,p.klinikId,u.unvanAd,k.klinikAd from tblPersonel as p inner join tblUnvan as u on p.unvanId = u.unvanId inner join tblKlinik as k on p.klinikId = k.klinikId where p.personelId='" + yollaPerseonelId + "'";
            komut.ExecuteNonQuery();
            SqlDataReader dr = komut.ExecuteReader();
            if (dr.Read())
            {
                personelId = dr["personelId"].ToString();
                tcNo = dr["tcNo"].ToString();
                ad = dr["ad"].ToString();
                soyad = dr["soyad"].ToString();
                adres = dr["adres"].ToString();
                cinsiyet = dr["cinsiyet"].ToString();
                cepTel = dr["cepTel"].ToString();
                email = dr["email"].ToString();
                DateTime tarih;
                tarih = Convert.ToDateTime(dr["dogumTar"].ToString());
                dogumTar = tarih.Day.ToString() + "." + tarih.Month.ToString() + "." + tarih.Year.ToString();
                dogumYer = dr["dogumYer"].ToString();
                unvanId = dr["unvanId"].ToString();
                unvanAd = dr["unvanAd"].ToString();
                klinikId = dr["klinikId"].ToString();
                klinikAd = dr["klinikAd"].ToString();
            }
            dr.Close();
            baglan.con.Close();
        }
    }
}
