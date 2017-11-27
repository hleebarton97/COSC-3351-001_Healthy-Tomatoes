using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediaForum
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblDataSource.Visible = false;
        }

        protected void customValEmail_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // Check if the email is already in the database
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["MediaForumConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "SELECT User_ID FROM[User] WHERE User_Email = '" + txtNewEmail.Text + "'";
            cmd.Connection = db;
            db.Open();
            try
            {
                // Get the data reader
                SqlDataReader reader = cmd.ExecuteReader();

                // Test if we have any records
                if (reader.HasRows)
                {
                    // Email already exists
                    args.IsValid = false;
                }
                else
                {
                    // Email does not exist
                    args.IsValid = true;
                }
            }
            catch
            {
                // Error reading from the datasource
                lblDataSource.Text = "Error connecting to datasource";
                lblDataSource.Visible = true;
            }
            finally
            {
                // close up the database connection
                db.Close();
            }
        }

        protected void customValDisplayName_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // Check if the display name is already in the database
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["MediaForumConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "SELECT User_ID FROM[User] WHERE User_DisplayName = '" + txtDisplayName.Text + "'";
            cmd.Connection = db;
            db.Open();
            try
            {
                // Get the data reader
                SqlDataReader reader = cmd.ExecuteReader();

                // Test if we have any records
                if (reader.HasRows)
                {
                    // Email already exists
                    args.IsValid = false;
                }
                else
                {
                    // Email does not exist
                    args.IsValid = true;
                }
            }
            catch
            {
                // Error reading from the datasource
                lblDataSource.Text = "Error connecting to datasource";
                lblDataSource.Visible = true;
            }
            finally
            {
                // close up the database connection
                db.Close();
            }
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            // Check if the user is in the database
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["MediaForumConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "SELECT * FROM  [User] WHERE (User_Email = '" + txtEmail.Text + "')";
            cmd.Connection = db;
            db.Open();
            try
            {
                // Get the data reader
                SqlDataReader reader = cmd.ExecuteReader();

                // Test if we have any records
                if (reader.HasRows)
                {
                    // Email is there, we have a record
                    reader.Read();
                    if(reader.GetValue(2).ToString() == txtPassword.Text)
                    {
                        // Passwords match, check if the user is blocked
                        if(reader.GetValue(4).ToString() == "0")
                        {
                            // User is marked as inactive for some reason
                            lblDataSource.Text = "There is a problem with your account, please contact the site administrator";
                            lblDataSource.Visible = true;
                        }
                        else
                        {
                            // All good
                            Session["DisplayName"] = reader.GetValue(3).ToString();
                            Response.Redirect("default.aspx", false);
                        }
                    }
                    else
                    {
                        // Password does not match
                        lblDataSource.Text = "Invalid password, please try again";
                        lblDataSource.Visible = true;
                    }
                }
                else
                {
                    // Email does not exist, alert the user
                    lblDataSource.Text = "Email not found";
                    lblDataSource.Visible = true;
                }
            }
            catch
            {
                // Error reading from the datasource
                lblDataSource.Text = "Error reading from datasource";
                lblDataSource.Visible = true;
            }
            finally
            {
                // close up the database connection
                db.Close();
            }
        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            // Insert the new user
            SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["MediaForumConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "INSERT INTO [User] (User_Email, User_Password, User_DisplayName, User_Type) VALUES ('" + txtNewEmail.Text + "', '" + txtNewPassword.Text + "', '" + txtDisplayName.Text + "', 1)";
            cmd.Connection = db;
            db.Open();
            try
            {
                // Try the insert
                cmd.ExecuteNonQuery();

                // Insert succeeds
                Session["DisplayName"] = txtDisplayName.Text;
                Response.Redirect("default.aspx", false);
            }
            catch
            {
                // Error inserting to the datasource
                lblDataSource.Text = "Error inserting to datasource";
                lblDataSource.Visible = true;
            }
            finally
            {
                // Close up the database connection
                db.Close();
            }
        }
    }
}
