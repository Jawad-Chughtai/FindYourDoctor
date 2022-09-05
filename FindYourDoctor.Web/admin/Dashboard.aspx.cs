using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindYourDoctor.Web.admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        public int TotalDoctors = 0;
        public int TotalLabs = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = dbConnection.getCon();
            SqlCommand cmd = new SqlCommand("Select * from tblDoctor", con);
            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                TotalDoctors += 1;
            }
            con.Close();

            cmd = new SqlCommand("Select * from tblLab", con);
            con.Open();
            rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                TotalLabs += 1;
            }
            con.Close();


        }
    }
}