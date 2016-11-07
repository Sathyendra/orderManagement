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
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["valid"] == null)
                Response.Redirect("Login.aspx");
        }

        
        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            // Get the userid and password and check if it is available in database
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LP-SATHYENDRAM\\SQLEXPRESS; Initial Catalog = ORDERPROJECT;  Integrated Security=true";

            // Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "AddProduct";
            cmd.CommandType = CommandType.StoredProcedure;

            //Parameters
            SqlParameter prmPName = new SqlParameter("@ProductName", txtProductName.Text);
            SqlParameter prmDesc = new SqlParameter("@Desc", txtDesc.Text);
            SqlParameter prmUnitPrice = new SqlParameter("@UnitPrice", txtUnitPrice.Text);

            // Add connection and parameter for the command
            cmd.Connection = conn;
            cmd.Parameters.Add(prmPName);
            cmd.Parameters.Add(prmDesc);
            cmd.Parameters.Add(prmUnitPrice);

            // Open Connection
            conn.Open();

            // Execute the command
            cmd.ExecuteNonQuery();


            lblMessage.Text = "Details Saved Successfully, Add another Product";
            lblMessage.ForeColor = System.Drawing.Color.Green;


            // Clear the inputs after form submit

            txtProductName.Text = string.Empty;
            txtDesc.Text = string.Empty;
            txtUnitPrice.Text = string.Empty;
            // Close the connection
            conn.Close();
        }
    }
}