using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Marina
{
    [DataObject(true)]

    public static class SlipDB
    {
        //method that gets only slips that haven't been leased depending on which dock is selected
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Slip> GetSlipByDock(int DockID)
        {
            List<Slip> slips = new List<Slip>();
            Slip slip;

            // create connection
            SqlConnection connection = MarinaDB.GetConnection();

            // create SELECT command
            string query = "SELECT ID, Width, Length, DockID " +
                           "FROM Slip " +
                           "WHERE DockID in (Select ID from Dock Where DockID=@DockID) "+
                           "And ID NOT IN(SELECT SLIPID FROM LEASE)";

            SqlCommand cmd = new SqlCommand(query, connection);

            // supply parameter value
            cmd.Parameters.AddWithValue("@DockID", DockID);

            // run the SELECT query
            try
            {
                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                // build customer object to return
                while (reader.Read()) // if there is a customer with this ID
                {
                    slip = new Slip();
                    slip.ID = (int)reader["ID"];
                    slip.Width = (int)reader["Width"];
                    slip.Length = (int)reader["Length"];
                    slip.DockID = (int)reader["DockID"];
                    slips.Add(slip);
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

            return slips;
        }

        //gets slips that are leased by a customer
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Slip> GetSlipByCust(int CustomerID)
        {
            List<Slip> slips = new List<Slip>();
            Slip slip;

            // create connection
            SqlConnection connection = MarinaDB.GetConnection();

            //join command
            string query = "select SlipID, DockID, Width, Length from Customer c " +
                            "inner join Lease l " +
                            "on c.ID = CustomerID " +
                            "inner join Slip s " +
                            "on s.ID = SlipID " +
                            "inner join Dock d " +
                            "on d.ID = DockID " +
                            "where @CustomerID = Customer ID";

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
                    slip = new Slip();
                    slip.ID = (int)reader["SlipID"];
                    slip.Width = (int)reader["Width"];
                    slip.Length = (int)reader["Length"];
                    slip.DockID = (int)reader["DockID"];
                    slips.Add(slip);
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

            return slips;
        }
    }
}