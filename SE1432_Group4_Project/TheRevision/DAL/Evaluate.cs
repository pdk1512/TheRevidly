using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TheRevision.DAL
{
    public class Evaluate
    {
        private string account;
        private int productId;
        private int vote;
        private string comment;
        private string date;
        public Evaluate()
        {

        }

        public Evaluate(string account, int productId, int vote, string comment, string date)
        {
            this.account = account;
            this.productId = productId;
            this.vote = vote;
            this.comment = comment;
            this.date = date;
        }

        public string Account { get => account; set => account = value; }
        public int ProductId { get => productId; set => productId = value; }
        public int Vote { get => vote; set => vote = value; }
        public string Comment { get => comment; set => comment = value; }
        public string Date { get => date; set => date = value; }
    }
}