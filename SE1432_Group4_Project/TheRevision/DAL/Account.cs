using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TheRevision.DAL
{
    public class Account
    {
        private string username;
        private string password;

        public Account(string username, string password)
        {
            this.username = username;
            this.password = password;
        }
        public Account()
        {

        }
        public string Username { get => username; set => username = value; }
        public string Password { get => password; set => password = value; }
    }
}