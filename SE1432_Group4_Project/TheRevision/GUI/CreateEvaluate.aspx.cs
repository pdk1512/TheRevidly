using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using TheRevision.DAL;
using TheRevision.DAO;

namespace TheRevision.GUI
{
    public partial class CreateEvaluate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                listType.DataSource = DAO.DAO.GetDataTable("SELECT * FROM Category");
                listType.DataValueField = "Id";
                listType.DataTextField = "Cate_Name";
                listType.DataBind();
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            //UPLOAD EVALUATE PRODUCT
            Product product = new Product
            {
                Name = txtName.Text,
                Author = Session["account"].ToString(),
                Cate_id = int.Parse(listType.SelectedValue),
                Description = txtAreaDes.Value,
                Price = txtPrice.Text,
                Address = txtAddress.Text,
                Link = txtUrl.Text
            };
            ProductDAO.AddNewProduct(product);

            //UPLOAD AUTHOR EVALUATE
            Evaluate evaluate = new Evaluate
            {
                ProductId = ProductDAO.selectNewestId(),
                Account = Session["account"].ToString(),
                Vote = int.Parse(hiddenScore.Value),
                Comment = txtComment.Text
            };
            EvaluateDAO.updateNewEvaluate(evaluate);
            
            //UPLOAD IMAGE
            if (ImageUpload.HasFile)
            {
                HttpFileCollection hfc = Request.Files;
                for(int i = 0; i < hfc.Count; i++)
                {
                    HttpPostedFile hpf = hfc[i];
                    //string fileName = Path.GetFileName(hpf.FileName);
                    //hfc[i].SaveAs(Server.MapPath("images//" + fileName));
                    Image image = new Image
                    {
                        PId = ProductDAO.selectNewestId(),
                        ImageUrl = "../images/" + hpf.FileName
                    };
                    ImageDAO.AddNewImage(image);
                }
            }
            Response.Redirect("Review.aspx");
        }

        
    }
}