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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Account acc = AccountDAO.GetAccoutByUsername(txtUser.Text);
            if(acc != null)
            {
                lblError.Text = "Account has already existed!";
                lblError.Visible = true;
            }
            else
            {
                AccountDAO.Register(txtUser.Text, txtPass.Text);
                Response.Redirect("Login.aspx");
            }
        }
    }
}