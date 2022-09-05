using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindYourDoctor.Web
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = dbConnection.getCon();
            string command = @"Insert into tblPatient (FullName, Email, Password, Contact, Age) Values 
                            ('"+ fullName.Value + "','"+ email.Value +"', '"+ password.Value +"', '"+ contact.Value +"', '"+ age.Value +"')";

            SqlCommand cmd = new SqlCommand(command, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Login.aspx");
        }
    }
}