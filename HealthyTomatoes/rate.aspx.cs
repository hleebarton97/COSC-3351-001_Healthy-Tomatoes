using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using AjaxControlToolkit;
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

            if (!this.IsPostBack)
            {
                DataTable dt = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) RatingCount FROM UserRatings");
                Rating1.CurrentRating = Convert.ToInt32(dt.Rows[0]["AverageRating"]);
                lblRatingStatus.Text = string.Format("{0} Users have rated. Average Rating {1}", dt.Rows[0]["RatingCount"], dt.Rows[0]["AverageRating"]);
            }
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

        private DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                    }
                }
                return dt;
            }
        }

        protected void OnRatingChanged(object sender, RatingEventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO UserRatings VALUES(@Rating)"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@Rating", e.Value);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}