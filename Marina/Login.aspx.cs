﻿using System;
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
            lblErrorMessage.Visible = false;
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            /*
             * To Do: 
             * When logged in redirects user to LeaseSlip.aspx
             * Add Validation
             */
          
            using(SqlConnection connection = new SqlConnection(@"Data Source=DADI-LAPTOP;Initial Catalog=Marina;Integrated Security=True"))
            {
                connection.Open();
                string query = "SELECT COUNT(1) FROM Customer WHERE FirstName=@FirstName AND Phone=@Phone";
                SqlCommand sqlCmd = new SqlCommand(query, connection);
                sqlCmd.Parameters.AddWithValue("@FirstName", txtUsername.Text);
                sqlCmd.Parameters.AddWithValue("@Phone", txtPassword.Text);

                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                if (count == 1)
                {   
                    Session["FirstName"] = txtUsername.Text;
                    Response.Redirect("LeaseSlip.aspx");
                }
                else
                {
                    lblErrorMessage.Visible = true;
                }
            }
        }
    }
}