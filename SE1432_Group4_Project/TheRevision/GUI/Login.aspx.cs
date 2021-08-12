using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheRevision.DAL;
using TheRevision.DAO;

namespace TheRevision.GUI
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Account account = AccountDAO.LoginAccount(txtUser.Text, txtPass.Text);
            if(account == null)
            {
                lblError.Text = "Wrong username or password!";
                lblError.Visible = true;
            }
            else
            {
                Session["account"] = account.Username;
                Response.Redirect("Home.aspx");
            }
        }

       
    }
}