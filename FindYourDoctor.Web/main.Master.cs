using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindYourDoctor.Web
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["PatientId"] == null)
            {
                PatientLi.Visible = false;
                LoginDiv.Visible = true;
            }
            else
            {
                PatientLi.Visible = true;
                LoginDiv.Visible = false;
            }
        }
    }
}