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
    public partial class index : System.Web.UI.Page
    {
        Baglanti baglan = new Baglanti();

            
        protected void Page_Load(object sender, EventArgs e)
        {
            baglan.con.Open();
            SqlCommand randevuguncelle = new SqlCommand("update tblRandevu set silinmiş=1 where gun<=(select CONVERT(DATE,GETDATE(),104)) and saat<=(select CONVERT(VARCHAR(2),GETDATE(),108)) ", baglan.con);
            randevuguncelle.ExecuteNonQuery();
            baglan.con.Close();

        }
        
    }
}
