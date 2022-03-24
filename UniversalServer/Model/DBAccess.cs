using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

using MySql.Data.MySqlClient;

namespace UniversalServer.Model
{
    public delegate EventHandler ErrorEventHandler(string msg);
    public class DBAccess
    {
        MySqlConnection con = new MySqlConnection(@"SERVER = localhost;DATABASE=smarthome;UID=root;PASSWORD=;");

        public bool openConnection()
        {
            try
            {
                con.Open();
                return true;
            }
            catch (MySqlException ex)
            {
                //When handling errors, you can your application's response based 
                //on the error number.
                //The two most common error numbers when connecting are as follows:
                //0: Cannot connect to server.
                //1045: Invalid user name and/or password.
                switch (ex.Number)
                {
                    case 0:
                        Console.WriteLine("Cannot connect to server.  Contact administrator");
                        break;

                    case 1045:
                        Console.WriteLine("Invalid username/password, please try again");
                        break;
                }
                return false;
            }
        }

        public bool closeConnection()
        {
            try
            {
                con.Close();
                return true;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }
        }

        ///Diese Methode für den Datensatz in die Datenbank ein. Siehe Info-Pool      
        public void InsertData(TempValue t, HumidValue h, PressureValue p, DateTime dt, string ipa)
        {
            string query = "INSERT INTO wetterwerte " +
                "(temperatur, datetime, humidity, druck, sender_ip) " +
                "VALUES(@temperatur, @datetime, @humidity, @druck, @sender_ip)";    

            //open connection
            if (this.openConnection() == true)
            {
                //create command and assign the query and connection from the constructor
                MySqlCommand cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("@temperatur", t.Value);
                cmd.Parameters.AddWithValue("@datetime", dt.ToString("yyyy-MM-dd H:mm:ss"));
                cmd.Parameters.AddWithValue("@humidity", h.Value);
                cmd.Parameters.AddWithValue("@druck", p.Value);
                cmd.Parameters.AddWithValue("@sender_ip", ipa);

                //Execute command
                cmd.ExecuteNonQuery();

                //close connection
                this.closeConnection();
            }

        }


    }
}
