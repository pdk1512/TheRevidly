using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TheRevision.DAL
{
    public class Image
    {
        private int pId;
        private string imageUrl;
        public Image()
        {

        }

        public Image(int pId, string imageUrl)
        {
            this.pId = pId;
            this.imageUrl = imageUrl;
        }

        public int PId { get => pId; set => pId = value; }
        public string ImageUrl { get => imageUrl; set => imageUrl = value; }
    }
}