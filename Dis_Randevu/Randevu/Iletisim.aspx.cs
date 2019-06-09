using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace WebProjeTemplate
{
    public partial class Iletisim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
            protected void gonderbtn_Click(object sender, EventArgs e)
        {
            try
            {

                //MailAddress Mailismo = new MailAddress("ismailcangezmis@gmail.com");
                
                MailMessage mail = new MailMessage(); //mesaj sınıfından mail nesnesi oluşturuyoruz.                 
                mail.From = new MailAddress(email.Text);      //kimden gönderilecek. 
                mail.To.Add("ismailcangezmis@gmail.com");      //kime gidecek

                mail.Subject = ad.Text +" "+ soyad.Text;      //mailin konusu. ad ve soyad
                mail.Body = mesaj.Text;     //mailin içeriği
                mail.IsBodyHtml = true;        //html kodlarına izin verilsin. 
                //SmtpClient client = new SmtpClient("smtp.live.com", 587);    //mail smtp adresi tanımlaması
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);    //gmail smtp adresi tanımlaması
                client.EnableSsl = true;           // Gmail için sslin aktif olması gerekiyor. 
                NetworkCredential credentials = new NetworkCredential("ismailcangezmis@gmail.com", "190728fb");      //gmail kullanıcı adı ve şifre.
                client.Credentials = credentials;
                try
                {
                    client.Send(mail);
                    uyari.ForeColor = System.Drawing.Color.Green;
                    uyari.Text = "Mesajınız Başarıyla Gönderilmiştir";
                    ad.Text = "";
                    soyad.Text = "";
                    email.Text = "";
                    mesaj.Text = "";
                }

                catch (Exception hata)
                {
                    Response.Write(hata);  //hata ayıklama ile hata olduğunda hata mesajı yazdırılacak.
                }
            }
            catch (Exception)
            {

            }
        }
    }
}