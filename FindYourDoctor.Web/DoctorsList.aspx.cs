using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindYourDoctor.Web
{
    public partial class DoctorsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string QueryString = Request.QueryString["Area"];
            string Spe = Request.QueryString["Spe"];

            SqlConnection con = dbConnection.getCon();
            string command = "";
            if (string.IsNullOrEmpty(QueryString) && string.IsNullOrEmpty(Spe))
            {
                command = @"select * from tblDoctor 
                                Inner join tblArea on tblDoctor.Area = tblArea.Id inner join tblSpeciality on tblSpeciality.Id = SpecialityId";
            }
            else if (!string.IsNullOrEmpty(Spe))
            {

                command = @"select * from tblDoctor 
                                Inner join tblArea on tblDoctor.Area = tblArea.Id inner join tblSpeciality on tblSpeciality.Id = SpecialityId where SpecialityId = '" + Spe + "'";
            }
            else
            {
                command = @"select * from tblDoctor 
                                Inner join tblArea on tblDoctor.Area = tblArea.Id inner join tblSpeciality on tblSpeciality.Id = SpecialityId where tblDoctor.Area = '" + QueryString +"'";
            }
            SqlCommand cmd = new SqlCommand(command, con);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                int Id = Convert.ToInt32(reader["Id"]);
                string Name = Convert.ToString(reader["Name"]);
                string Gender = Convert.ToString(reader["Gender"]);
                string Speciality = Convert.ToString(reader["Speciality"]);
                string Fee = String.Format("{0:N}", reader["Fee"]);
                string Area = Convert.ToString(reader["AreaName"]);
                string City = Convert.ToString(reader["City"]);
                string Description = Convert.ToString(reader["Description"]);
                string OpensAt = string.Format("{0:t}", reader["StartAt"]);
                string ClosesAt = string.Format("{0:t}", reader["CloseAt"]);

                doctors.InnerHtml += String.Format(@"
                    <div class='card'>
                        <div class='card-body'>
                            <div class='doctor-widget'>
                                <div class='doc-info-left'>
                                    <div class='doctor-img'>
                                        <a href='#'>
                                            <img src='assets/img/doctors/{0}.jpg' class='img-fluid' alt='User Image'>
                                        </a>
                                    </div>
                                    <div class='doc-info-cont'>
                                        <h4 class='doc-name'><a href='#'>{1}</a></h4>
                                        <p class='doc-speciality'>{2}</p>
                                        <h5 class='doc-department'>
                                            <img src='assets/img/specialities/{10}.png' class='img-fluid' alt='Speciality'>{3}</h5>
                                        <h5 class='doc-department'>
                                            {4} to {5}</h5>
                                        <div class='rating'>
                                            <i class='fas fa-star filled'></i>
                                            <i class='fas fa-star filled'></i>
                                            <i class='fas fa-star filled'></i>
                                            <i class='fas fa-star filled'></i>
                                            <i class='fas fa-star'></i>
                                        </div>
                                        <div class='clinic-details'>
                                            <p class='doc-location'><i class='fas fa-map-marker-alt'></i> {6}, {7}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class='doc-info-right'>
                                    <div class='clini-infos'>
                                        <ul>
                                            <li><i class='far fa-thumbs-up'></i>98%</li>
                                            <li><i class='far fa-comment'></i>17 Feedback</li>
                                            <li><i class='fas fa-map-marker-alt'></i>{6}, {7}</li>
                                            <li><i class='far fa-money-bill-alt'></i> {8} <i class='fas fa-info-circle' data-toggle='tooltip' title='Fee'></i></li>
                                        </ul>
                                    </div>
                                    <div class='clinic-booking'>
                                        <a class='apt-btn' href='booking.aspx?book=Doctor&id={9}'>Book Appointment</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>", Gender, Name, Description, Speciality, OpensAt, ClosesAt, Area, City, Fee, Id, Speciality);
            }
        }

        protected void search_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("DoctorsList.aspx?Area=" + area.SelectedValue);
        }

        protected void speciality_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("DoctorsList.aspx?Spe=" + specialityDDl.SelectedValue);
        }
    }
}