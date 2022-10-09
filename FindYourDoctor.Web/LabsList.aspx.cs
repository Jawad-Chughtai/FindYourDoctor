using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindYourDoctor.Web
{
    public partial class LabsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string QueryString = Request.QueryString["Area"];
            string Spe = Request.QueryString["Spe"];
            string command = "";
            if (string.IsNullOrEmpty(QueryString) && string.IsNullOrEmpty(Spe))
            {
                command = @"select * from tblLab 
                                Inner join tblArea on tblLab.Area = tblArea.Id inner join tblSpeciality on tblSpeciality.Id = SpecialityId";
            }
            else if (!string.IsNullOrEmpty(Spe))
            {
                command = @"select * from tblLab 
                                Inner join tblArea on tblLab.Area = tblArea.Id inner join tblSpeciality on tblSpeciality.Id = SpecialityId where tblLab.SpecialityId = '" + Spe + "'";
            }
            else
            {
                command = @"select * from tblLab 
                                Inner join tblArea on tblLab.Area = tblArea.Id inner join tblSpeciality on tblSpeciality.Id = SpecialityId where tblLab.Area = '" + QueryString + "'";
            }
            SqlConnection con = dbConnection.getCon();

            SqlCommand cmd = new SqlCommand(command, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                int Id = Convert.ToInt32(reader["Id"]);
                string Name = reader["LabName"].ToString();
                string Description = reader["Description"].ToString();
                string Area = reader["AreaName"].ToString();
                string City = reader["City"].ToString();
                string OpensAt = string.Format("{0:t}", reader["OpensAt"]);
                string ClosesAt = string.Format("{0:t}", reader["ClosesAt"]);

                Labs.InnerHtml += String.Format(@"<div class='card'>
                        <div class='card-body'>
                            <div class='doctor-widget'>
                                <div class='doc-info-left'>
                                    <div class='doctor-img'>
                                        <a href='doctor-profile.html'>
                                            <img src='assets/img/features/feature-01.jpg' class='img-fluid' alt='User Image'>
                                        </a>
                                    </div>
                                    <div class='doc-info-cont'>
                                        <h4 class='doc-name'><a href='#'>{0}</a></h4>
                                        <p class='doc-speciality'>{1}</p>
                                        <h5 class='doc-department'>
                                           {2} to {3}</h5>
                                        <div class='rating'>
                                            <i class='fas fa-star filled'></i>
                                            <i class='fas fa-star filled'></i>
                                            <i class='fas fa-star filled'></i>
                                            <i class='fas fa-star filled'></i>
                                            <i class='fas fa-star'></i>
                                        </div>
                                        <div class='clinic-details'>
                                            <p class='doc-location'><i class='fas fa-map-marker-alt'></i> {4}, {5}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class='doc-info-right'>
                                    <div class='clini-infos'>
                                        <ul>
                                            <li><i class='far fa-thumbs-up'></i>98%</li>
                                            <li><i class='far fa-comment'></i>17 Feedback</li>
                                            <li><i class='fas fa-map-marker-alt'></i>{4}, {5}</li>
                                        </ul>
                                    </div>
                                    <div class='clinic-booking'>
                                        <a class='apt-btn' href='booking.aspx?book=Lab&id={6}'>Book Appointment</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>", Name, Description, OpensAt, ClosesAt, Area, City, Id);
            }
            con.Close();

        }

        protected void search_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("LabsList.aspx?Area=" + area.SelectedValue);
        }

        protected void speciality_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("LabsList.aspx?Spe=" + specialityDDl.SelectedValue);
        }
    }
}