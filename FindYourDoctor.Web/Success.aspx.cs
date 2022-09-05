using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindYourDoctor.Web
{
    public partial class Success : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Id = Request.QueryString["Id"];
            if (!string.IsNullOrEmpty(Id))
            {
                string na = "";
                SqlConnection con = dbConnection.getCon();
                string command = "select * from tblAppointment where Id = " + Id;
                con.Open();
                SqlCommand cmd = new SqlCommand(command, con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    if (Convert.ToInt32(rd["DoctorId"]) == 0)
                    {
                        command = "select * from tblAppointment inner join tblLab on LabId = tblLab.Id where tblAppointment.Id = " + Id;
                        na = "LabName";

                    }
                    else
                    {
                        command = "select * from tblAppointment inner join tblDoctor on DoctorId = tblDoctor.Id  where tblAppointment.Id = " + Id;
                        na = "Name";
                    }
                }
                con.Close();

                string Name = "";
                string Date = "";
                string Time = "";

                cmd = new SqlCommand (command, con);
                con.Open();
                rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    Name = rd[na].ToString();
                    Date = string.Format("{0:dd MMM yyyy}", rd["Date"]);
                    Time = string.Format("{0:t}", rd["Time"]);
                }
                con.Close();
                appointmentDetails.InnerHtml = String.Format(@"
											<p>Appointment booked with 
                                        <strong>{0}</strong><br> on <strong>{1}, {2}</strong>
                                        </p>", Name, Date, Time);
            }
        }
    }
}