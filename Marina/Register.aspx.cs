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

        protected void ContinueButton_Click(object sender, EventArgs e)
        {

        }

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            //using (SqlConnection connection = MarinaDB.GetConnection())
            using(SqlConnection connection = new SqlConnection(@"Data Source=DADI-LAPTOP;Initial Catalog=Marina;Integrated Security=True"))
            {
                connection.Open();
                string query = "INSERT INTO Customer VALUES @FirstName,@LastName,@Phone AND @City";
                SqlCommand sqlCmd = new SqlCommand(query, connection);
                sqlCmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                sqlCmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                sqlCmd.Parameters.AddWithValue("@Phone", txtPassword.Text);
                sqlCmd.Parameters.AddWithValue("@City", txtConfirmPassword.Text);
                sqlCmd.ExecuteScalar();
            }
        }
    }
}