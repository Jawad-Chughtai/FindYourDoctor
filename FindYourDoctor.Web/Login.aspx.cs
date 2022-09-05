using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindYourDoctor.Web
{
    public partial class Login : System.Web.UI.Page
    {
        string Booking = "";
        string Id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.RemoveAll();
            }

            Booking = Request.QueryString["book"];
            Id = Request.QueryString["id"];
        }

        protected void submit_ServerClick(object sender, EventArgs e)
        {
            SqlConnection con = dbConnection.getCon();
            string command = "select * from tblPatient where Email = '"+ email.Value +"' and Password = '"+ password.Value +"'";
            SqlCommand cmd = new SqlCommand(command, con);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Session["PatientId"] = reader["Id"].ToString();
                Session["PatientName"] = reader["FullName"].ToString();
                if (string.IsNullOrEmpty(Booking) || string.IsNullOrEmpty(Id))
                {
                    Response.Redirect("Index.aspx");
                }
                else
                {
                    Response.Redirect("Booking.aspx?book=" + Booking + "&id=" + Id);
                }
            }
            else
            {
                Response.Write("<script>alert('Email or Password is invalid.')</script>");
            }
            con.Close();
        }
    }
}