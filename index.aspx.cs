using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthyTomatoes
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Movie id and title used later.
            int movie_id = 0;
            int movie_rating = 0;
            string movie_title = "";
            string movie_img_src = "";

            /**
             * Check if user has logged in or not.
             */
            string username = (String)Session["Username"];

            if (username == "" || username == null)
            {
                lbl_Link.Text = "Log In";
                hl_login.NavigateUrl = "login.aspx";
            }
            else
            {
                lbl_Link.Text = "Welcome, " + username;
                hl_login.NavigateUrl = "";
            }

            /**
             *  Get information of top rated movie to display on home page.
             */

            // Get movie ratings.
            string selectAvgRating = "SELECT m_id, AVG(rating) AS avg_rating FROM RATINGS GROUP BY m_id";

            DataTable dt = new DataTable();
            SqlConnection db = new SqlConnection(SQLMovieDB_ratings.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter sda = new SqlDataAdapter();

            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = selectAvgRating;
                cmd.Connection = db;
                sda.SelectCommand = cmd;
                sda.Fill(dt); // Fill datatable with results.
            }
            catch(Exception exception)
            {
                lbl_movieRatings.Text = "ERROR";
            }

            // Set ratings label.
            movie_rating = (int)dt.Rows[0]["avg_rating"];
            lbl_movieRatings.Text = movie_rating.ToString();

            // Get movie title and image associated with movie.
            string selectMovie = "SELECT movie_id, movie_title FROM MOVIE";

            dt = new DataTable();
            db = new SqlConnection(SQLMovieDB_movie.ConnectionString);
            cmd = new SqlCommand();
            sda = new SqlDataAdapter();

            try
            {
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = selectMovie;
                cmd.Connection = db;
                sda.SelectCommand = cmd;
                sda.Fill(dt);
            }
            catch
            {
                lbl_movieTitle.Text = "ERROR";
            }

            movie_id = (int)dt.Rows[0]["movie_id"];
            movie_title = (String)dt.Rows[0]["movie_title"];

            movie_img_src = movie_title.ToLower();
            StringBuilder sb = new StringBuilder(movie_img_src); // Use string builder to change character.

            // Convert movie_title to the appropriate image file.
            for (int i = 0; i < movie_title.Length; i++)
            {
                if (sb[i] == ' ') // If character is space, convert to '_'
                    sb[i] = '_';
            }

            movie_img_src = sb.ToString(); // Save what we have changed in to string.

            // Set movie title and set movie image.
            lbl_movieTitle.Text = movie_title;
            img_movie.ImageUrl = "~/images/" + movie_img_src + ".jpg";

            // Hidden but needed value.
            lbl_movieID.Text = movie_id.ToString();
        }

        protected void img_movie_Click(object sender, ImageClickEventArgs e)
        {
            string movie_title = lbl_movieTitle.Text;
            string movie_rating = lbl_movieRatings.Text;
            string movie_img_src = img_movie.ImageUrl;
            string movie_id = lbl_movieID.Text;

            // Create session states to pass information to rate movie page.
            Session["MovieTitle"] = movie_title;
            Session["MovieRating"] = movie_rating;
            Session["MovieImgSrc"] = movie_img_src;
            Session["MovieId"] = movie_id;

            // Redirect to movie rate page.
            Response.Redirect("rate.aspx");
        }
    }
}