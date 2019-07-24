using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Marina
{
    [DataObject(true)]

    public static class LeaseDB
    {
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void AddLease(int SlipID, int CustomerID)
        {
            // create connection
            SqlConnection connection = MarinaDB.GetConnection();

            // create SELECT command
            string query = "INSERT into Lease (SlipID, CustomerID) values (@SlipID, @CustomerID)";

            SqlCommand cmd = new SqlCommand(query, connection);

            // supply parameter value
            cmd.Parameters.AddWithValue("@SlipID", SlipID);
            cmd.Parameters.AddWithValue("@CustomerID", CustomerID);

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