using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Marina
{
    [DataObject(true)]

    public static class DockDB
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Dock> GetDock()
        {
            List<Dock> docks = new List<Dock>();
            Dock dock;

            // create connection
            SqlConnection connection = MarinaDB.GetConnection();

            // create SELECT command
            string query = "SELECT ID, Name, WaterService, ElectricalService " +
                           "FROM Dock";

            SqlCommand cmd = new SqlCommand(query, connection);

            // run the SELECT query
            try
            {
                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    dock = new Dock();
                    dock.ID = (int)reader["ID"];
                    dock.Name = reader["Name"].ToString();
                    dock.WaterService = (int)reader["WaterService"];
                    dock.ElectricalService = (int)reader["ElectricalService"];
                    docks.Add(dock);
                }
                reader.Close();
            }
            catch (Exception exc)
            {
                throw exc;
            }
            finally
            {
                connection.Close();
            }

            return docks;
        }
    }
}