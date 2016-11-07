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
    public partial class AddOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populateProductDetails();
                populateCustomerDetails();
            }
        }
        public void populateProductDetails() {

            
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LP-SATHYENDRAM\\SQLEXPRESS; Initial Catalog = ORDERPROJECT;  Integrated Security=true";

            // Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "GetAllProducts";
            cmd.CommandType = CommandType.StoredProcedure;

            // Add connection and parameter for the command
            cmd.Connection = conn;


            // Dataset
            DataSet dsProducts = new DataSet();

            // Data Adapter
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dsProducts);
            ddlProduct.Items.Add(new ListItem() { Text = "Select Product...", Value = "0", Selected = true });
            foreach (DataRow row in dsProducts.Tables[0].Rows)
            {
                ddlProduct.Items.Add(new ListItem() { Text=row["PNAME"].ToString(), Value=row["PID"].ToString() });
            };

        }
        public void populateCustomerDetails() {


            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LP-SATHYENDRAM\\SQLEXPRESS; Initial Catalog = ORDERPROJECT;  Integrated Security=true";

            // Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "GetAllCustomers";
            cmd.CommandType = CommandType.StoredProcedure;

            // Add connection and parameter for the command
            cmd.Connection = conn;


            // Dataset
            DataSet dsCustomers = new DataSet();

            // Data Adapter
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dsCustomers);
            ddlCustomer.Items.Add(new ListItem() { Text = "Select Customer...", Value = "0", Selected = true });
            foreach (DataRow row in dsCustomers.Tables[0].Rows)
            {
                ddlCustomer.Items.Add(new ListItem() { Text = row["FNAME"].ToString()+","+ row["LNAME"].ToString(), Value = row["CID"].ToString() });
            };

        }


        protected void btnSaveOrder_Click(object sender, EventArgs e)
        {

            // Get the userid and password and check if it is available in database
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LP-SATHYENDRAM\\SQLEXPRESS; Initial Catalog = ORDERPROJECT;  Integrated Security=true";

            // Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "AddOrder";
            cmd.CommandType = CommandType.StoredProcedure;

            //Parameters
            SqlParameter prmProduct = new SqlParameter("@PID", ddlProduct.SelectedItem.Value);
            SqlParameter prmCustomer = new SqlParameter("@CID", ddlCustomer.Text);
            SqlParameter prmQty = new SqlParameter("@Qty", txtQuantity.Text);
            SqlParameter prmStatus = new SqlParameter("@Status", txtStatus.Text);

            // Add connection and parameter for the command
            cmd.Connection = conn;
            cmd.Parameters.Add(prmProduct);
            cmd.Parameters.Add(prmCustomer);
            cmd.Parameters.Add(prmQty);
            cmd.Parameters.Add(prmStatus);

            // Open Connection
            conn.Open();

            // Execute the command
            cmd.ExecuteNonQuery();


            lblMessage.Text = "Details Saved Successfully";
            lblMessage.ForeColor = System.Drawing.Color.Green;


            // Clear the inputs after form submit

            txtQuantity.Text = string.Empty;
            txtStatus.Text = string.Empty;
            ddlProduct.SelectedIndex = 0;
            ddlCustomer.SelectedIndex = 0;
            // Close the connection
            conn.Close();
        }

        protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            

            // Get the userid and password and check if it is available in database
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=LP-SATHYENDRAM\\SQLEXPRESS; Initial Catalog = ORDERPROJECT;  Integrated Security=true";

            // Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "GetUnitPrice";
            cmd.CommandType = CommandType.StoredProcedure;

            //Parameters
            SqlParameter prmPID = new SqlParameter("@PID", ddlProduct.SelectedItem.Value);

            // Add connection and parameter for the command
            if (ddlProduct.SelectedItem.Value != "0")
            {
                cmd.Connection = conn;
                cmd.Parameters.Add(prmPID);

                // Open Connection
                conn.Open();

                // Execute the command
                var unitPrice = (int)cmd.ExecuteScalar();

                // Close the connection
                conn.Close();
                txtUnitPrice.Text = unitPrice.ToString();
            }
            else {
                txtUnitPrice.Text = string.Empty;
            }
            
        }
    }
}