using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TheRevision.DAL;

namespace TheRevision.DAO
{
    public class AccountDAO
    {

        public static Account LoginAccount(string username, string password)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Account " +
                    "WHERE [Username] = @user AND [Password] = @pass");
                cmd.Parameters.AddWithValue("@user", username);
                cmd.Parameters.AddWithValue("@pass", password);
                DataTable dt = DAO.GetDataTable(cmd);
                if(dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    Account acc = new Account()
                    {
                        Username = row["Username"].ToString(),
                        Password = row["Password"].ToString()
                    };
                    return acc;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static Account GetAccoutByUsername(string username)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Account " +
                    "WHERE [Username] = @user");
                cmd.Parameters.AddWithValue("@user", username);
                DataTable dt = DAO.GetDataTable(cmd);
                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    Account acc = new Account()
                    {
                        Username = row["Username"].ToString(),
                        Password = row["Password"].ToString()
                    };
                    return acc;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static bool Register(string username, string password)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Account " +
                "VALUES(@user, @pass)");
            cmd.Parameters.AddWithValue("@user", username);
            cmd.Parameters.AddWithValue("@pass", password);
            return DAO.UpdateTable(cmd);
        }
    }
}