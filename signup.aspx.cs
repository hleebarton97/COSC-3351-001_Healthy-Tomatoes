using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthyTomatoes
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_error.Visible = false;

            // Get Session username.
            string username = (String)Session["Username"];

            // If username does not exist, display log in option.
            if (username == "" || username == null)
            {
                lbl_Link.Text = "Log In";
                hl_login.NavigateUrl = "login.aspx";
            }
            else // If user has logged, show username and their option to account page.
            {
                lbl_Link.Text = "Welcome, " + username;
                hl_login.NavigateUrl = "";
            }
        }

        protected void btn_SignUp_Click(object sender, EventArgs e)
        {
            // Get user input.
            string fName = signup_fName.Text;
            string lName = signup_lName.Text;
            string email = signup_email.Text;
            string dob = signup_dob.Text;
            string username = signup_username.Text;
            string password = signup_rePassword.Text;

            // Was there an error with DB connection?
            Boolean error = false;

            // Store input into MovieDB.
            string checkUsername = "SELECT user_username FROM [USERS] WHERE user_username='" + username + "'";
            string storeCmd = "INSERT [USERS] (user_username, user_password, user_fname, user_lname, user_email, user_DOB) VALUES ('" + username + "', '" + password + "', '" + fName + "', '" + lName + "', '" + email + "', '" + dob + "')";
            SqlConnection db = new SqlConnection(SQLMovieDB.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;

            /**
             * Check if username already exists. 
             */
            cmd.CommandText = checkUsername; // Get command.
            db.Open();

            try
            {
                // Read database values based on command.
                SqlDataReader data = cmd.ExecuteReader();

                if (data.HasRows) // Username already exists.
                {
                    data.Close();

                    lbl_error.Text = "The username already exists!";
                    lbl_error.Visible = true;

                    error = true;
                }
                else
                    error = false;
            }
            catch
            {
                // Show label displaying error.
                lbl_error.Text = "There has been an error! We apologize for any inconvenience.";
                lbl_error.Visible = true;
            }
            finally
            {
                db.Close();
            }

            /**
             * Store data if username doesn't exist. 
             */
            if (!error)
            {
                cmd.CommandText = storeCmd;
                cmd.Connection = db; // Bind connection.
                db.Open(); // Open connection.

                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    lbl_error.Text = "There has been an error! We apologize for any inconvenience.";
                    lbl_error.Visible = true;
                    error = true;
                }
                finally
                {
                    db.Close(); // Close connection.
                }

                // If there is no error, then redirect to home page.
                if (!error)
                {
                    Session["Username"] = username;
                    Response.Redirect("index.aspx");
                }
            }
        }
    }
}