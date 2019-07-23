using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Marina
{
    [DataObject(true)]

    public static class CustomerDB
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static Customer GetCustomer(int ID)
        {
            Customer cust = null;

            // create connection
            SqlConnection connection = MarinaDB.GetConnection();

            // create SELECT command
            string query = "SELECT ID, FirstName, LastName, Phone, City " +
                           "FROM Customer " +
                           "WHERE @ID = ID";

            SqlCommand cmd = new SqlCommand(query, connection);

            // supply parameter value
            cmd.Parameters.AddWithValue("@ID", ID);

            // run the SELECT query
            try
            {
                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.SingleRow);

                // build customer object to return
                if (reader.Read()) // if there is a customer with this ID
                {
                    cust = new Customer();
                    cust.ID = (int)reader["ID"];
                    cust.FirstName = reader["FirstName"].ToString();
                    cust.LastName = reader["LastName"].ToString();
                    cust.Phone = reader["Phone"].ToString();
                    cust.City = reader["City"].ToString();
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

            return cust;
        }
    }
 
}