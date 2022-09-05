using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindYourDoctor.Web
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            int id = 0;
            string Name = "";
            string Description = "";
            string Location = "";
            string Fee = "";
            string Gender = "";

            SqlConnection con = dbConnection.getCon();
            SqlCommand cmd = new SqlCommand("select TOP 5 * from tblDoctor inner join tblArea on tblDoctor.Area = tblArea.Id", con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                id = Convert.ToInt32(reader["Id"]);
                Name = reader["Name"].ToString();
                Description = reader["Description"].ToString();
                Location = reader["AreaName"].ToString() + ", " + reader["City"];
                Fee = String.Format("{0:N}", reader["Fee"]);
                Gender = reader["Gender"].ToString();

                doctorWidget.InnerHtml += String.Format(@"
                        <div class='profile-widget'>
                            <div class='doc-img'>
                                <a href='doctor-profile.html'>
                                    <img class='img-fluid' alt='User Image' src='assets/img/doctors/{0}.jpg'>
                                </a>
                                <a href='javascript:void(0)' class='fav-btn'>
                                    <i class='far fa-bookmark'></i>
                                </a>
                            </div>
                            <div class='pro-content'>
                                <h3 class='title'>
                                    <a href='#'>{1}</a>
                                    <i class='fas fa-check-circle verified'></i>
                                </h3>
                                <p class='speciality'>{2}</p>
                                <div class='rating'>
                                    <i class='fas fa-star filled'></i>
                                    <i class='fas fa-star filled'></i>
                                    <i class='fas fa-star filled'></i>
                                    <i class='fas fa-star filled'></i>
                                    <i class='fas fa-star filled'></i>
                                    <span class='d-inline-block average-rating'>(17)</span>
                                </div>
                                <ul class='available-info'>
                                    <li>
                                        <i class='fas fa-map-marker-alt'></i>{3}
                                    </li>
                                    <li>
                                        <i class='far fa-money-bill-alt'></i>{4}
											
                                        <i class='fas fa-info-circle' data-toggle='tooltip' title='Fee'></i>
                                    </li>
                                </ul>
                                <div class='row row-sm'>
                                    <div class='col-12'>
                                        <a href='Booking.aspx?book=Doctor&id={5}' class='btn book-btn'>Book Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>", Gender, Name, Description, Location, Fee, id);
            }
        }

        protected void submit_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("DoctorsList.aspx?Area=" + area.SelectedValue);
        }
    }
}