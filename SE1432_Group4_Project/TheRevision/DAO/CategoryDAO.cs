using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TheRevision.DAL;

namespace TheRevision.DAO
{
    public class CategoryDAO
    {

        public static List<Category> GetAllCategory()
        {
            var categories = new List<Category>();
            try
            {
                DataTable dt = DAO.GetDataTable("SELECT * FROM Category");
                foreach(DataRow row in dt.Rows)
                {
                    var cate = new Category
                    {
                        Id = int.Parse(row["Id"].ToString()),
                        CateName = row["Cate_Name"].ToString()
                    };
                    categories.Add(cate);
                }
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return categories;
        }

        public static Category GetCategoryById(int id)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Category WHERE Id = @i");
                cmd.Parameters.AddWithValue("@i", id);
                DataTable dt = DAO.GetDataTable(cmd);
                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    Category category = new Category
                    {
                        Id = int.Parse(row["Id"].ToString()),
                        CateName = row["Cate_Name"].ToString()
                    };
                    return category;
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
    }
}