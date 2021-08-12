using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TheRevision.DAL;

namespace TheRevision.DAO
{
    public class ImageDAO
    {
        public static List<Image> GetImagesByProduct(int pId)
        {
            var images = new List<Image>();
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Image WHERE Product_Id = @id");
                cmd.Parameters.AddWithValue("@id", pId);
                DataTable dt = DAO.GetDataTable(cmd);
                foreach (DataRow row in dt.Rows)
                {
                    var img = new Image
                    {
                        PId = int.Parse(row["Product_Id"].ToString()),
                        ImageUrl = row["Image_url"].ToString()
                    };
                    images.Add(img);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return images;
        }

        public static void AddNewImage(Image image)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Image VALUES(@p, @u)");
            cmd.Parameters.AddWithValue("@p", image.PId);
            cmd.Parameters.AddWithValue("@u", image.ImageUrl);
            DAO.UpdateTable(cmd);
        }

        public static void DeleteImage(string id)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Image WHERE Product_Id = @i");
            cmd.Parameters.AddWithValue("@i", id);
            DAO.UpdateTable(cmd);
        }
    }
}