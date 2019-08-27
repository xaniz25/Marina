using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Marina
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //when clicked new lease is added depending on which customer is logged in
        //and what row they clicked on which contains the slipid
        protected void btnLease_OnClick(object sender, EventArgs e)
        {
            //get slipid from gridview
           int row = ((GridViewRow)((Button) sender).NamingContainer).RowIndex;
           string SlipID = gvSlips.Rows[row].Cells[0].Text;

           //get customerid from detailview
           string CustomerID = dvCustomer.Rows[0].Cells[1].Text;

            //connect to database and insert new lease
            using (SqlConnection connection = new SqlConnection(@"Data Source=localhost\SAIT;Initial Catalog=Marina;Integrated Security=True"))
            {
                connection.Open();
                string query = "INSERT into Lease (SlipID, CustomerID) values (@SlipID, @CustomerID)";
                SqlCommand sqlCmd = new SqlCommand(query, connection);

                //binding parameters
                sqlCmd.Parameters.AddWithValue("@SlipID", SlipID);
                sqlCmd.Parameters.AddWithValue("@CustomerID", CustomerID);

                sqlCmd.ExecuteNonQuery();
            }
        }

    }
}
