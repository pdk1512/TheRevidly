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
    public partial class CategoryReview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Category> listCate = CategoryDAO.GetAllCategory();
                lsCate.DataSource = listCate;
                lsCate.DataBind();
                List<Product> listPro = ProductDAO.GetProductByCategory(int.Parse(Request.QueryString["cateId"]));
                listPro = listPro.OrderByDescending(p => p.Point).ToList();
                lsPro.DataSource = listPro;
                lsPro.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("SearchReview.aspx?txtSearch=" + txtSearch.Text);
        }
    }
}