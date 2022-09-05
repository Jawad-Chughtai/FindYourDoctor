using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindYourDoctor.Web
{
    public partial class Booking : System.Web.UI.Page
    {
        string Bookings = "";
        string Id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Bookings = Request.QueryString["book"];
            Id = Request.QueryString["id"];
            if (string.IsNullOrEmpty(Bookings) || string.IsNullOrEmpty(Id))
            {
                Response.Redirect("Index.aspx");
            }

            if (Session["PatientId"] == null)
            {
                Response.Redirect("Login.aspx?book="+Bookings+"&id="+Id);
            }
            string command = "";
            string Name = "";
            string Image = "";
            string Location = "";

            if (Bookings == "Lab")
            {
                command = "select * from tblLab inner join tblArea on tblLab.Area = tblArea.Id where tblLab.Id = " + Id;

                SqlConnection con = dbConnection.getCon();
                SqlCommand cmd = new SqlCommand(command, con);
                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    Name = rd["LabName"].ToString();
                    Image = "assets/img/features/feature-01";
                    Location = rd["AreaName"].ToString() + ", " + rd["City"].ToString();
                }
                con.Close();
            }
            else if (Bookings == "Doctor")
            {
                command = "select * from tblDoctor inner join tblArea on tblDoctor.Area = tblArea.Id where tblDoctor.Id = " + Id;

                SqlConnection con = dbConnection.getCon();
                SqlCommand cmd = new SqlCommand(command, con);
                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    Name = rd["Name"].ToString();
                    Image = "assets/img/doctors/" + rd["Gender"].ToString();
                    Location = rd["AreaName"].ToString() + ", " + rd["City"].ToString();
                }
                con.Close();
            }



            Details.InnerHtml += String.Format(@"
                    <div class='card'>
                        <div class='card-body'>
                            <div class='booking-doc-info'>
                                <a href='doctor-profile.html' class='booking-doc-img'>
                                    <img src='{0}.jpg' alt='User Image'>
                                </a>
                                <div class='booking-info'>
                                    <h4><a href='doctor-profile.html'>{1}</a></h4>
                                    <div class='rating'>
                                        <i class='fas fa-star filled'></i>
                                        <i class='fas fa-star filled'></i>
                                        <i class='fas fa-star filled'></i>
                                        <i class='fas fa-star filled'></i>
                                        <i class='fas fa-star'></i>
                                        <span class='d-inline-block average-rating'>35</span>
                                    </div>
                                    <p class='text-muted mb-0'><i class='fas fa-map-marker-alt'></i> {2}</p>
                                </div>
                            </div>
                        </div>
                    </div>", Image, Name, Location);
        }

        protected void submit_ServerClick(object sender, EventArgs e)
        {
            string command = "";
            SqlConnection con = dbConnection.getCon();
            if(Bookings == "Lab")
            {
                command = @"Insert into tblAppointment (PatientId, LabId, DoctorId, Date, Time, IsCancelled) 
                            Values ('" + Convert.ToInt32(Session["PatientId"])+"', '"+Convert.ToInt32(Id)+"'," +
                            "'"+0+"', '"+date.Value+"', '"+time.Value+"', '"+ false +"')";
            }
            else if(Bookings == "Doctor")
            {
                command = @"Insert into tblAppointment (PatientId, DoctorId, LabId, Date, Time, IsCancelled) 
                            Values ('" + Convert.ToInt32(Session["PatientId"]) + "', '" + Convert.ToInt32(Id) + "'," +
                            "'" + 0 + "', '" + date.Value + "', '" + time.Value + "', '"+ false +"')";
            }

            SqlCommand cmd = new SqlCommand(command, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            command = "SELECT * FROM tblAppointment WHERE Id=(SELECT max(id) FROM tblAppointment)";
            cmd = new SqlCommand(command, con);
            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            int appointment = 0;
            if (rd.Read())
            {
                appointment = Convert.ToInt32(rd["Id"]);
            }
            con.Close();
            Response.Redirect("Success.aspx?Id=" + appointment);
        }
    }
}