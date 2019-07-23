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
            using(SqlConnection connection = new SqlConnection(@"Data Source=DADI-LAPTOP;Initial Catalog=Marina;Integrated Security=True"))
            {
                connection.Open();

            }
        }
    }
}