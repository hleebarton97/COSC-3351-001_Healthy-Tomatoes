using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthyTomatoes
{
    public partial class rate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = (String)Session["Username"];

            string movie_title = (String)Session["MovieTitle"];
            string movie_rating = (String)Session["MovieRating"];
            string movie_img_src = (String)Session["MovieImgSrc"];


            Boolean loggedIn = false;

            if (username == "" || username == null) // Not logged in.
            {
                loggedIn = false;
                lbl_Link.Text = "Log In";
                hl_login.NavigateUrl = "login.aspx";
            }
            else
            {
                loggedIn = true;
                lbl_Link.Text = "Welcome, " + username;
                hl_login.NavigateUrl = "";
            }


            /**
             * Make sure user is logged in before rate is allowed.
             */
            if (loggedIn)
            {
                lbl_header.Text = "Rate Movie";

                lbl_movieTitle.Text = movie_title;
                lbl_movieRatings.Text = "Average User Rating: " + movie_rating + " / 4 stars";
                movie_Image.ImageUrl = movie_img_src;
            }
            else // Tell user to log in.
            {
                lbl_header.Text = "You must be logged in to rate a movie!";
                movie_Image.Visible = false;
                lbl_movieTitle.Visible = false;
                lbl_movieRatings.Visible = false;
                lbl_rate.Visible = false;
            }
        }
    }
}