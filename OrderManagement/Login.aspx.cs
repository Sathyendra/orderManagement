using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// for database access
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace OrderManagement
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Get the userid and password and check if it is available in database
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LP-SATHYENDRAM\\SQLEXPRESS; Initial Catalog = ORDERPROJECT;  Integrated Security=true";

            // Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "IsValidUser";
            cmd.CommandType = CommandType.StoredProcedure;

            //Parameters
            SqlParameter prmLoginName = new SqlParameter("@LoginName", txtUserId.Text);
            SqlParameter prmPassword = new SqlParameter("@Password", txtPassword.Text);

            // Add connection and parameter for the command
            cmd.Connection = conn;
            cmd.Parameters.Add(prmLoginName);
            cmd.Parameters.Add(prmPassword);

            // Open Connection
            conn.Open();

            // Execute the command
            var count = (int)cmd.ExecuteScalar();

            // Close the connection
            conn.Close();

            // Check if user is valid or not

            if (count > 0) {
                Session["valid"] = "yes";
                Response.Redirect("AddCustomer.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid Credentials. Pleasee try again";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}