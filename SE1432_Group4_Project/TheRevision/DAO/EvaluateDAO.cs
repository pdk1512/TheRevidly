using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TheRevision.DAL;

namespace TheRevision.DAO
{
    public class EvaluateDAO
    {
        public static List<Evaluate> getListComment(int pId)
        {
            var evaluate = new List<Evaluate>();
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Evaluate WHERE Product_Id = @id");
                cmd.Parameters.AddWithValue("@id", pId);
                DataTable dt = DAO.GetDataTable(cmd);
                foreach (DataRow row in dt.Rows)
                {
                    var e = new Evaluate
                    {
                        Account = row["Account"].ToString(),
                        ProductId = int.Parse(row["Product_Id"].ToString()),
                        Vote = int.Parse(row["Vote"].ToString()),
                        Comment = row["Comment"].ToString(),
                        Date = row["Date"].ToString()
                    };
                    evaluate.Add(e);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return evaluate;
        }

        public static Evaluate GetEvaluateByUser(string user, int pId)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Evaluate WHERE Product_Id = @id AND Account = @a");
                cmd.Parameters.AddWithValue("@id", pId);
                cmd.Parameters.AddWithValue("@a", user);
                DataTable dt = DAO.GetDataTable(cmd);
                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    var evaluate = new Evaluate
                    {
                        Account = row["Account"].ToString(),
                        ProductId = int.Parse(row["Product_Id"].ToString()),
                        Comment = row["Comment"].ToString(),
                        Vote = int.Parse(row["Vote"].ToString()),
                        Date = row["Date"].ToString()
                    };
                    return evaluate;
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

        public static string getAverageVote(int pId)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Evaluate WHERE Product_Id = @id");
                cmd.Parameters.AddWithValue("@id", pId);
                DataTable dt = DAO.GetDataTable(cmd);
                int count = 0;
                double averageVote = 0;
                foreach (DataRow row in dt.Rows)
                {
                    count++;
                    averageVote += double.Parse(row["Vote"].ToString());
                }
                
                return string.Format("{0:0.0}", averageVote / (double)count);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static void updateNewEvaluate(Evaluate evaluate)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Evaluate WHERE Account = @a AND Product_Id = @p");
            cmd.Parameters.AddWithValue("@a", evaluate.Account);
            cmd.Parameters.AddWithValue("@p", evaluate.ProductId);
            DataTable dt = DAO.GetDataTable(cmd);
            if (dt.Rows.Count == 0)
            {
                cmd = new SqlCommand("INSERT INTO Evaluate(Account, Product_Id, Vote, Comment, Date) " +
                    "VALUES(@a, @p, @v, @c, @d)");
                cmd.Parameters.AddWithValue("@a", evaluate.Account);
                cmd.Parameters.AddWithValue("@p", evaluate.ProductId);
                cmd.Parameters.AddWithValue("@v", evaluate.Vote);
                cmd.Parameters.AddWithValue("@c", evaluate.Comment);
                cmd.Parameters.AddWithValue("@d", DateTime.Now);
                DAO.UpdateTable(cmd);
            }
            else
            {
                cmd = new SqlCommand("UPDATE Evaluate SET Vote = @v, Comment = @c, Date = @d " +
                    "WHERE Product_Id = @p AND Account = @a");
                cmd.Parameters.AddWithValue("@a", evaluate.Account);
                cmd.Parameters.AddWithValue("@p", evaluate.ProductId);
                cmd.Parameters.AddWithValue("@v", evaluate.Vote);
                cmd.Parameters.AddWithValue("@c", evaluate.Comment);
                cmd.Parameters.AddWithValue("@d", DateTime.Now);
                DAO.UpdateTable(cmd);
            }
        }

        public static void DeleteEvaluate(string id)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Evaluate WHERE Product_Id = @i");
            cmd.Parameters.AddWithValue("@i", id);
            DAO.UpdateTable(cmd);
        }
    }
}