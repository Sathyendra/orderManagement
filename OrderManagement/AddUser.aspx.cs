using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace OrderManagement
{
    public partial class AddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["valid"] == null)
                Response.Redirect("Login.aspx");
        }

        protected void btnSaveUser_Click(object sender, EventArgs e)
        {
            // Get the userid and password and check if it is available in database
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LP-SATHYENDRAM\\SQLEXPRESS; Initial Catalog = ORDERPROJECT;  Integrated Security=true";

            // Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "AddUser";
            cmd.CommandType = CommandType.StoredProcedure;

            //Parameters
            SqlParameter prmLName = new SqlParameter("@LoginName", txtLoginName.Text);
            SqlParameter prmPass= new SqlParameter("@Password", txtPassword.Text);
            SqlParameter prmUserType = new SqlParameter("@UserType", ddlUserType.SelectedItem.Value);

            // Add connection and parameter for the command
            cmd.Connection = conn;
            cmd.Parameters.Add(prmLName);
            cmd.Parameters.Add(prmPass);
            cmd.Parameters.Add(prmUserType);

            // Open Connection
            conn.Open();

            // Execute the command
            cmd.ExecuteNonQuery();


            lblMessage.Text = "Details Saved Successfully, Add another User";
            lblMessage.ForeColor = System.Drawing.Color.Green;


            // Clear the inputs after form submit

            txtLoginName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            ddlUserType.SelectedIndex = 0;
            // Close the connection
            conn.Close();
        }
    }
}