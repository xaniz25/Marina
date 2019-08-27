using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

//<!--An ASP.NET Webform that creates a website for a company called Inland Marina that allows potential customers
//    to register and view available docks and slips where they can park their boats.Each dock has
//    water and/or electrical service.Only slips that haven't been leased will show on the list.
//    Once customers are registered, they can lease slips, and view slips that they have leased.
//    Created by Kai Feng, Victor Lantion & Shanice Talan. July 24, 2019. CPRG 214 OOSD Spring 2019.-->

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