using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthyTomatoes
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
 
        protected void btn_Login_Click(object sender, EventArgs e)
        {
            login_username.Text = "YAY!";
            login_password.Text = "It Worked!";
        }

        protected void btn_SignUp_Click(object sender, EventArgs e)
        {
            Console.WriteLine("Help");
        }

    }
}