using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TheRevision.DAL
{
    public class Category
    {
        private int id;
        private string cateName;
        public Category()
        {

        }
        public Category(int id, string cateName)
        {
            this.id = id;
            this.cateName = cateName;
        }

        public int Id { get => id; set => id = value; }
        public string CateName { get => cateName; set => cateName = value; }
    }
}