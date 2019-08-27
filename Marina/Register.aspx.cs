using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Marina
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
       
        //adds a new customer to the database
        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            using(SqlConnection connection = new SqlConnection(@"Data Source=localhost\SQLEXPRESS;Initial Catalog=Marina;Integrated Security=True"))
            {
                connection.Open();
                string query = "INSERT INTO Customer VALUES (@FirstName,@LastName,@Phone , @City)";
                SqlCommand sqlCmd = new SqlCommand(query, connection);
                sqlCmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                sqlCmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                sqlCmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                sqlCmd.Parameters.AddWithValue("@City", txtCity.Text);
                sqlCmd.ExecuteScalar();
                Response.Redirect("Login.aspx");

            }
        }

        //clear button
        protected void Button1_Click(object sender, EventArgs e)
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtCity.Text = "";
            txtPhone.Text = "";
        }
    }
}