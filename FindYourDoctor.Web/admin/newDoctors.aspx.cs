using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindYourDoctor.Web.admin
{
    public partial class newDoctors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = dbConnection.getCon();
            string command = @"insert into tblDoctor (Name, Area, City, Description, Speciality, Fee, Gender, StartAt, CloseAt)
                        Values ('" + name.Value + "', '" + area.SelectedValue + "', '" + city.Value + "'," +
                        "'"+ description.Value +"', '"+ speciality.Value +"', '"+ fee.Value +"', '"+ gender.SelectedValue +"'," +
                        "'"+ opens.Value +"', '"+ closes.Value +"')";
            SqlCommand cmd = new SqlCommand(command, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("newDoctors.aspx");
        }
    }
}