using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthyTomatoes
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.ExceptionHandled = true;
                Response.Write("<script>alert('An error has occurred with your update request.')</script>");
            }
            else if (e.AffectedRows == 0)
            {
                Response.Write("<script>alert('An admin may have updated your information.')</script>");
            }
        }
    }
}