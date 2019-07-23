using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Marina
{
    public class MarinaDB
    {
        public static SqlConnection GetConnection()  //method which needs a call and return   this will be called in the StateDB (when connection needs to be made)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MarinaConnectionString1"].ConnectionString;
            //regardless of special characters
            return new SqlConnection(connectionString);
        }
    }
}