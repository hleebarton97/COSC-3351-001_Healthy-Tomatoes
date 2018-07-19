using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthyTomatoes
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Hide the error message.
            lbl_error.Visible = false;
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            // Get user's input of username and password.
            string username = login_username.Text;
            string password = login_password.Text;
            string fName;

            // Was the username found?
            Boolean found = false;

            // Check database if username exists.
            string checkUsername = "SELECT user_fname FROM [USERS] WHERE user_username='" + username + "'";
            string checkPassword = "SELECT user_password FROM [USERS] WHERE user_password='" + password + "'";

            // Create connection to MovieDB
            SqlConnection db = new SqlConnection(SQLMovieDB.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = checkUsername; // Get command created earlier.
            cmd.Connection = db;             // Bind Connection.
            db.Open();                       // Open Connection.

            try
            {
                // Read database values based on command.
                SqlDataReader data = cmd.ExecuteReader();

                // If we get anything back, then the value exists.
                if (data.HasRows)
                {
                    // Username exists now check password.
                    data.Close();
                    cmd.CommandText = checkPassword;
                    data = cmd.ExecuteReader();

                    if (data.HasRows) // Password has been found.
                        found = true;
                    else
                    {
                        // Password is not correct.
                        lbl_error.Text = "The password is not correct!";
                        lbl_error.Visible = true;
                    }
                }
                else // Username does not exist.
                {
                    lbl_error.Text = "The username does not exist!";
                    lbl_error.Visible = true;
                }
                data.Close();

                if (found) // Login successful!
                {
                    lbl_error.Text = "Login Successful!";
                    lbl_error.Visible = true;

                    // Create username Session State.
                    Session["Username"] = username;

                    // Redirect to home page.
                    Response.Redirect("index.aspx");
                }
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

            
        }
    }
}