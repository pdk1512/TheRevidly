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
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Product> listPro = ProductDAO.GetProductByAuthor(Session["account"].ToString());
                listPro = listPro.OrderByDescending(p => p.Point).ToList();
                lsPro.DataSource = listPro;
                lsPro.DataBind();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["account"] = "";
            Response.Redirect("Login.aspx");
        }

        protected void lsPro_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if(e.CommandName == "Edit")
            {
                Response.Redirect("EditEvaluate.aspx?id=" + e.CommandArgument.ToString());
            }
            else if(e.CommandName == "Delete")
            {
                EvaluateDAO.DeleteEvaluate(e.CommandArgument.ToString());
                ImageDAO.DeleteImage(e.CommandArgument.ToString());
                ProductDAO.DeleteProduct(e.CommandArgument.ToString());
                
                Response.Redirect("Review.aspx");
            }
        }
    }
}