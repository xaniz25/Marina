using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Marina
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MarinaConnectionString1"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void btnAddLease_Click(object sender, EventArgs e)
        {
            GridViewRow row = gvSlips.SelectedRow;

            int SlipID = Convert.ToInt32(row.Cells[0].Text);

            //how to get CustomerID after the customer logs in

            //AddLease(slipid, customerid); //cannot call either class or method even though namespace is same?
            //have to do write the whole method here
            string query = "INSERT into Lease (SlipID, CustomerID) values (@SlipID, @CustomerID)";

            SqlCommand cmd = new SqlCommand(query, connection);

            // supply parameter value
            cmd.Parameters.AddWithValue("@SlipID", SlipID);
            cmd.Parameters.AddWithValue("@CustomerID", CustomerID); //replaced CustomerID with 1. insert works

            // run the SELECT query
            try
            {
                connection.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }

        }
    }
}