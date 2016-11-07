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
    public partial class AddCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["valid"] == null)
                Response.Redirect("Login.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Get the userid and password and check if it is available in database
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LP-SATHYENDRAM\\SQLEXPRESS; Initial Catalog = ORDERPROJECT;  Integrated Security=true";

            // Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "AddCustomer";
            cmd.CommandType = CommandType.StoredProcedure;

            //Parameters
            SqlParameter prmFName = new SqlParameter("@FirstName", txtFirstName.Text);
            SqlParameter prmLName = new SqlParameter("@LastName", txtLastName.Text);
            SqlParameter prmAddress1 = new SqlParameter("@Address1", txtAddressLine1.Text);
            SqlParameter prmAddress2 = new SqlParameter("@Address2", txtAddressLine2.Text);
            SqlParameter prmCity = new SqlParameter("@City", txtCity.Text);
            SqlParameter prmState = new SqlParameter("@State", txtState.Text);
            SqlParameter prmZipCode = new SqlParameter("@ZipCode", txtZip.Text);
            SqlParameter prmMobile = new SqlParameter("@Mobile", txtMobile.Text);

            // Add connection and parameter for the command
            cmd.Connection = conn;
            cmd.Parameters.Add(prmFName);
            cmd.Parameters.Add(prmLName);
            cmd.Parameters.Add(prmAddress1);
            cmd.Parameters.Add(prmAddress2);
            cmd.Parameters.Add(prmCity);
            cmd.Parameters.Add(prmState);
            cmd.Parameters.Add(prmZipCode);
            cmd.Parameters.Add(prmMobile);

            // Open Connection
            conn.Open();

            // Execute the command
            cmd.ExecuteNonQuery();


            lblMessage.Text = "Saved Successfully, Add another Customer";
            lblMessage.ForeColor = System.Drawing.Color.Green;


            // Clear the inputs after form submit

            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtAddressLine1.Text = string.Empty;
            txtAddressLine2.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtState.Text = string.Empty;
            txtZip.Text = string.Empty;
            txtMobile.Text = string.Empty;
            // Close the connection
            conn.Close();

        }
    }
}