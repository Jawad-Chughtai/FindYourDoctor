using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindYourDoctor.Web.admin
{
    public partial class speciality : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmitLab_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = dbConnection.getCon();
            SqlCommand cmd = new SqlCommand("Insert into tblSpeciality (Speciality, IsForDoctor) values('" + forLab.Value + "', '"+false+"')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("speciality.aspx");
        }

        protected void btnSubmitDoctor_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = dbConnection.getCon();
            SqlCommand cmd = new SqlCommand("Insert into tblSpeciality (Speciality, IsForDoctor) values('" + forDoctor.Value + "', '" + true + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("speciality.aspx");
        }
    }
}