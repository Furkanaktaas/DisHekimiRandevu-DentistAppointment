using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace WebProjeTemplate
{
    public class Baglanti
    {
        public SqlConnection con;
        public Baglanti()
        {
            con = new SqlConnection("Data Source=FURKAN;Initial Catalog=db_DisKlinik;Integrated Security=True");
        }
    }
}