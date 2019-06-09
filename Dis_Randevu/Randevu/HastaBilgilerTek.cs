using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace WebProjeTemplate
{
    public class HastaBilgilerTek
    {
        //Hasta giriş yaptıktan sonraki Textboxtan alınan tc no ile giriş yapan hastaya ait bilgiler
        Baglanti baglan = new Baglanti();
        static string _hastaId, _hastaTc, _ad, _soyad, _adres, _cinsiyet, _cepTel, _email, _dogumTar, _dogumYer, _kanGrubu, _sifre;

        public string hastaId
        {
            get
            {
                return _hastaId;
            }

            set
            {
                _hastaId = value;
            }
        }
        public string hastaTc
        {
            get
            {
                return _hastaTc;
            }

            set
            {
                _hastaTc = value;
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
        public string kanGrubu
        {
            get
            {
                return _kanGrubu;
            }

            set
            {
                _kanGrubu = value;
            }
        }
        public string sifre
        {
            get
            {
                return _sifre;
            }

            set
            {
                _sifre = value;
            }
        }
        public void HastaBilgilerT(string YollahastaTc)
        {
            baglan.con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = baglan.con;
            komut.CommandText = "Select * from tblHasta where hastaTc ='" + YollahastaTc + "'";
            komut.ExecuteNonQuery();
            SqlDataReader dr = komut.ExecuteReader();
            if (dr.Read())
            {
                hastaId = dr["hastaId"].ToString();
                hastaTc = dr["hastaTc"].ToString();
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
                kanGrubu = dr["kanGrubu"].ToString();
                sifre= dr["sifre"].ToString();
            }
            dr.Close();
            baglan.con.Close();
        }
    }
}