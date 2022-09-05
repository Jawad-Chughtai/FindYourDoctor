using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FindYourDoctor.Web
{
    public class dbConnection
    {
        public static SqlConnection getCon()
        {
            return new SqlConnection(ConfigurationManager.ConnectionStrings["dbDoctor"].ConnectionString);
        }
    }
}