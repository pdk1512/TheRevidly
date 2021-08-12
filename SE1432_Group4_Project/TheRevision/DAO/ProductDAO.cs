using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TheRevision.DAL;

namespace TheRevision.DAO
{
    public class ProductDAO
    {
        public static List<Product> GetAllProduct()
        {
            var product = new List<Product>();
            try
            {
                DataTable dt = DAO.GetDataTable("SELECT * FROM Post ORDER BY Id DESC");
                foreach (DataRow row in dt.Rows)
                {
                    var pro = new Product
                    {
                        Id = int.Parse(row["Id"].ToString()),
                        Name = row["Name"].ToString(),
                        Author = row["Author"].ToString(),
                        Cate_id = int.Parse(row["Category"].ToString()),
                        Description = row["Description"].ToString(),
                        Price = row["Price"].ToString(),
                        Address = row["Address"].ToString(),
                        Link = row["Link"].ToString()
                    };
                    product.Add(pro);
                }
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return product;
        }

        public static Product GetProductById(int id)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Post WHERE Id = @id");
                cmd.Parameters.AddWithValue("@id", id);
                DataTable dt = DAO.GetDataTable(cmd);
                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    Product p = new Product
                    {
                        Id = int.Parse(row["Id"].ToString()),
                        Name = row["Name"].ToString(),
                        Author = row["Author"].ToString(),
                        Cate_id = int.Parse(row["Category"].ToString()),
                        Description = row["Description"].ToString(),
                        Price = row["Price"].ToString(),
                        Address = row["Address"].ToString(),
                        Link = row["Link"].ToString()
                    };
                    return p;
                }
                else
                {
                    return null;
                }
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static List<Product> GetProductByAuthor(string author)
        {
            var product = new List<Product>();
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Post WHERE Author = @a");
                cmd.Parameters.AddWithValue("@a", author);
                DataTable dt = DAO.GetDataTable(cmd);
                foreach (DataRow row in dt.Rows)
                {
                    var pro = new Product
                    {
                        Id = int.Parse(row["Id"].ToString()),
                        Name = row["Name"].ToString(),
                        Author = row["Author"].ToString(),
                        Cate_id = int.Parse(row["Category"].ToString()),
                        Description = row["Description"].ToString(),
                        Price = row["Price"].ToString(),
                        Address = row["Address"].ToString(),
                        Link = row["Link"].ToString()
                    };
                    product.Add(pro);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return product;
        }

        public static List<Product> GetProductByCategory(int category)
        {
            var product = new List<Product>();
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Post WHERE Category = @c");
                cmd.Parameters.AddWithValue("@c", category);
                DataTable dt = DAO.GetDataTable(cmd);
                foreach (DataRow row in dt.Rows)
                {
                    var pro = new Product
                    {
                        Id = int.Parse(row["Id"].ToString()),
                        Name = row["Name"].ToString(),
                        Author = row["Author"].ToString(),
                        Cate_id = int.Parse(row["Category"].ToString()),
                        Description = row["Description"].ToString(),
                        Price = row["Price"].ToString(),
                        Address = row["Address"].ToString(),
                        Link = row["Link"].ToString()
                    };
                    product.Add(pro);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return product;
        }

        public static List<Product> GetSearchProduct(string txtSearch)
        {
            var product = new List<Product>();
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Post WHERE [Name] LIKE '%" + txtSearch + "%'");
                DataTable dt = DAO.GetDataTable(cmd);
                foreach (DataRow row in dt.Rows)
                {
                    var pro = new Product
                    {
                        Id = int.Parse(row["Id"].ToString()),
                        Name = row["Name"].ToString(),
                        Author = row["Author"].ToString(),
                        Cate_id = int.Parse(row["Category"].ToString()),
                        Description = row["Description"].ToString(),
                        Price = row["Price"].ToString(),
                        Address = row["Address"].ToString(),
                        Link = row["Link"].ToString()
                    };
                    product.Add(pro);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return product;
        }

        public static void AddNewProduct(Product product)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Post VALUES" +
                "(@n, @a, @c, @d, @p, @ad, @l)");
            cmd.Parameters.AddWithValue("@n", product.Name);
            cmd.Parameters.AddWithValue("@a", product.Author);
            cmd.Parameters.AddWithValue("@c", product.Cate_id);
            cmd.Parameters.AddWithValue("@d", product.Description);
            cmd.Parameters.AddWithValue("@p", product.Price);
            cmd.Parameters.AddWithValue("@ad", product.Address);
            cmd.Parameters.AddWithValue("@l", product.Link);
            DAO.UpdateTable(cmd);
        }

        public static void UpdateProduct(Product product)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Post SET Name = @n, Category = @c, Description = @d, " +
                "Price = @p, Address = @a, Link = @l WHERE Id = @i");
            cmd.Parameters.AddWithValue("@n", product.Name);
            cmd.Parameters.AddWithValue("@i", product.Id);
            cmd.Parameters.AddWithValue("@c", product.Cate_id);
            cmd.Parameters.AddWithValue("@d", product.Description);
            cmd.Parameters.AddWithValue("@p", product.Price);
            cmd.Parameters.AddWithValue("@a", product.Address);
            cmd.Parameters.AddWithValue("@l", product.Link);
            DAO.UpdateTable(cmd);
        }

        public static int selectNewestId()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT MAX(Id) AS Id FROM Post");
                DataTable dt = DAO.GetDataTable(cmd);
                DataRow row = dt.Rows[0];
                return int.Parse(row["Id"].ToString());
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static void DeleteProduct(string id)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Post WHERE Id = @i");
            cmd.Parameters.AddWithValue("@i", id);
            DAO.UpdateTable(cmd);
        }

    }
}