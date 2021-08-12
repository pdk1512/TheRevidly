using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TheRevision.DAL;
using TheRevision.DAO;
using Image = TheRevision.DAL.Image;

namespace TheRevision.GUI
{
    public partial class DetailReview : System.Web.UI.Page
    {
        protected int imgCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Product p = ProductDAO.GetProductById(int.Parse(Request.QueryString["id"]));
                //Hiển thị tên nhà hàng, điểm đánh giá
                product_title.Text = p.Name + " <progress min='0' max='10' value='" + p.Point + "'></progress> " + p.Point + "/10";
                //Hiển thị tác giả bài review
                author.Text = p.Author;
                //Nhúng map
                MapIframe.Attributes.Add("src", p.Link);
                
                HtmlGenericControl liPrice = new HtmlGenericControl("li");
                liPrice.InnerText = "Price: " + p.Price;
                list_infor.Controls.Add(liPrice);

                HtmlGenericControl liAddress = new HtmlGenericControl("li");
                liAddress.InnerText = "Address: " + p.Address;
                list_infor.Controls.Add(liAddress);

                description.Text =  p.Description;
                //Hiển thị hình ảnh
                List<Image> listImg = ImageDAO.GetImagesByProduct(int.Parse(Request.QueryString["id"]));
                lsImg.DataSource = listImg;
                lsImg.DataBind();

                imgCount = listImg.Count;
                //Hiển thị đánh giá
                List<Evaluate> listEvaluate = EvaluateDAO.getListComment(p.Id);
                lsCmt.DataSource = listEvaluate;
                lsCmt.DataBind();
            }
        }

        protected void BtnComment_Click(object sender, EventArgs e)
        {
           
            Evaluate evaluate = new Evaluate
            {
                ProductId = int.Parse(Request.QueryString["id"]),
                Account = Session["account"].ToString(),
                Vote = int.Parse(hiddenScore.Value),
                Comment = comment.Value
            };
            EvaluateDAO.updateNewEvaluate(evaluate);
            Response.Redirect("DetailReview.aspx?id=" + int.Parse(Request.QueryString["id"]));

        }
    }
}