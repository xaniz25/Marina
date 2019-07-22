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
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Slip> GetSlipByDock(int dockid)
        {
            List<Slip> slips = new List<Slip>();
            Slip slip = null;

            // create connection
            SqlConnection connection = MarinaDB.GetConnection();

            // create SELECT command
            string query = "SELECT ID, Width, Length, DockID " +
                           "FROM Slip " +
                           "WHERE @DockID = dockid";

            SqlCommand cmd = new SqlCommand(query, connection);
            // supply parameter value
            cmd.Parameters.AddWithValue("@DockID", dockid);

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
    }
}