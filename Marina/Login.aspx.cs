using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Marina
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            lblErrorMessage.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //login an existing customer and pass the FirstName and Phone (used as password)
            //as session variables and redirect customer to LeaseSlip.aspx
            using(SqlConnection connection = new SqlConnection(@"Data Source=localhost\SAIT;Initial Catalog=Marina;Integrated Security=True"))
            {
                connection.Open();
                string query = "SELECT COUNT(1) FROM Customer WHERE FirstName=@FirstName AND Phone=@Phone";
                SqlCommand sqlCmd = new SqlCommand(query, connection);
                sqlCmd.Parameters.AddWithValue("@FirstName", txtName.Text);
                sqlCmd.Parameters.AddWithValue("@Phone", txtPhone.Text);

                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                if (count == 1)
                {   
                    Session["FirstName"] = txtName.Text;
                    Session["Phone"] = txtPhone.Text;
                    Response.Redirect("LeaseSlip.aspx");
                }
                else
                {
                    lblErrorMessage.Visible = true;
                }
            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtPhone.Text = "";
        }

    }
}