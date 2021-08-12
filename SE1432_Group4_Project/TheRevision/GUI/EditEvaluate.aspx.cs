using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheRevision.DAL;
using TheRevision.DAO;
using Image = TheRevision.DAL.Image;

namespace TheRevision.GUI
{
    public partial class EditEvaluate : System.Web.UI.Page
    {
        protected string vote;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Product p = ProductDAO.GetProductById(int.Parse(Request.QueryString["id"]));
                Evaluate eval = EvaluateDAO.GetEvaluateByUser(Session["account"].ToString(), int.Parse(Request.QueryString["id"]));

                txtName.Text = p.Name;
                txtPrice.Text = p.Price;
                txtAddress.Text = p.Address;
                txtAreaDes.Value = p.Description;
                txtComment.Text = eval.Comment;
                txtUrl.Text = p.Link;

                listType.DataSource = DAO.DAO.GetDataTable("SELECT * FROM Category");
                listType.DataValueField = "Id";
                listType.DataTextField = "Cate_Name";
                listType.SelectedValue = p.Cate_id.ToString();
                listType.DataBind();

                vote = eval.Vote.ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Product product = new Product
            {
                Id = int.Parse(Request.QueryString["id"]),
                Name = txtName.Text,
                Price = txtPrice.Text,
                Address = txtAddress.Text,
                Cate_id = int.Parse(listType.SelectedValue),
                Description = txtAreaDes.Value,
                Link = txtUrl.Text
            };

            ProductDAO.UpdateProduct(product);

            Evaluate evaluate = new Evaluate
            {
                ProductId = int.Parse(Request.QueryString["id"]),
                Account = Session["account"].ToString(),
                Vote = int.Parse(hiddenScore.Value),
                Comment = txtComment.Text
            };

            EvaluateDAO.updateNewEvaluate(evaluate);

            if (ImageUpload.HasFile)
            {
                HttpFileCollection hfc = Request.Files;
                ImageDAO.DeleteImage(Request.QueryString["id"]);
                for (int i = 0; i < hfc.Count; i++)
                {
                    HttpPostedFile hpf = hfc[i];
                    Image image = new Image
                    {
                        PId = ProductDAO.selectNewestId(),
                        ImageUrl = "../images/" + hpf.FileName
                    };
                    ImageDAO.AddNewImage(image);
                }
            }
            Response.Redirect("User.aspx");
        }
    }
}