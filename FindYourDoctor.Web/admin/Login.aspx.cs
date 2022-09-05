using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FindYourDoctor.Web.admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.RemoveAll();
            }
        }

        protected void loginbtn_ServerClick(object sender, EventArgs e)
        {
            if ((username.Value == "admin" || username.Value == "Admin") && password.Value == "admin")
            {
                Session["Admin"] = "admin";
                Response.Redirect("Dashboard.aspx");
            }
        }
    }
}