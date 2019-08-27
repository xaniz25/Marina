using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Marina.App_Code
{
    public static class LeaseDB
    {
        public static List<Lease> GetLeasesByCust(int CustomerID)
        {
            List<Lease> leases = new List<Lease>();
            Lease ls;

            // create connection
            SqlConnection connection = MarinaDB.GetConnection();

            // create SELECT command
            string query = "SELECT ID, SlipID, CustomerID " +
                           "FROM Customer " +
                           "WHERE @CustomerID = CustomerID";

            SqlCommand cmd = new SqlCommand(query, connection);

            // supply parameter value
            cmd.Parameters.AddWithValue("@CustomerID", CustomerID);

            // run the SELECT query
            try
            {
                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                // build customer object to return
                while (reader.Read()) // if there is a customer with this ID
                {
                    ls = new Lease();
                    ls.ID = (int)reader["ID"];
                    ls.SlipID = (int)reader["SlipID"];
                    ls.CustomerID = (int)reader["CustomerID"];
                    leases.Add(ls);
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }

            return leases;
        }
    }
}