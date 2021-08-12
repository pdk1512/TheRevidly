using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TheRevision.DAO;

namespace TheRevision.DAL
{
    public class Product
    {
        private int id;
        private string name;
        private string author;
        private int cate_id;
        private string description;
        private string price;
        private string address;
        private string link;
        private string point;

        public Product(int id, string name, string author, int cate_id, string description, string price, string address, string link, string point)
        {
            this.id = id;
            this.name = name;
            this.author = author;
            this.cate_id = cate_id;
            this.description = description;
            this.price = price;
            this.address = address;
            this.link = link;
            this.point = EvaluateDAO.getAverageVote(Id);
        }

        public Product()
        {

        }

        public int Id { get => id; set => id = value; }
        public string Name { get => name; set => name = value; }
        public string Author { get => author; set => author = value; }
        public int Cate_id { get => cate_id; set => cate_id = value; }
        public string Description { get => description; set => description = value; }
        public string Price { get => price; set => price = value; }
        public string Address { get => address; set => address = value; }
        public string Link { get => link; set => link = value; }
        public string Point { get => EvaluateDAO.getAverageVote(Id); set => point = value; }
    }
}