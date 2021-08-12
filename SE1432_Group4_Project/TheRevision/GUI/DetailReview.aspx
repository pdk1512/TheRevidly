<%@ Page Title="" Language="C#" MasterPageFile="~/Skeleton.Master" AutoEventWireup="true" CodeBehind="DetailReview.aspx.cs" Inherits="TheRevision.GUI.DetailReview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="left">
        <!-- HIỂN THỊ TÊN VÀ ĐIỂM ĐÁNH GIÁ -->
        <h1><asp:Literal ID="product_title" runat="server" /></h1>
        <!-- HIỂN THỊ AUTHOR -->
        Post by: <asp:Literal ID="author" runat="server" />
        <!-- HIỂN THỊ THÔNG TIN CƠ BẢN -->
        <ol runat="server" id="list_infor">

        </ol>
        <p>
            <!-- HIỂN THỊ MÔ TẢ -->
            <asp:Literal ID="description" runat="server" />
        </p>
        <!-- Slideshow container -->
        <div class="slideshow-container">
            <!-- HIỂN THỊ ẢNH -->
            <!-- Full-width images with number and caption text -->

            <asp:Repeater ID="lsImg" runat="server">
                <ItemTemplate>

                    <div class="mySlides fade">
                        <img src="<%#Eval("imageUrl") %>" style="width: 100%">
                    </div>

                </ItemTemplate>
            </asp:Repeater>

            <!-- Next and previous buttons -->
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
        </div>
        <br>

        <!-- The dots/circles -->
        <div style="text-align: center">

            <% for (int i = 1; i <= imgCount; i++)
               { %>

                <span class="dot" onclick="currentSlide(<%= i %>)"></span>

            <% } %>

        </div>
        <script>
            var slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlide(n) {
                showSlides(slideIndex = n);
            }

            function showSlides(n) {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("dot");
                if (n > slides.length) { slideIndex = 1 }
                if (n < 1) { slideIndex = slides.length }
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
            }
        </script>
        <!-- HIỂN THỊ MAP -->
        <iframe src="" width="100%" height="400px" style="border:0;" allowfullscreen="" loading="lazy" runat="server" id="MapIframe"></iframe>
    </div>
    <div class="right">
        <h1>EVALUATE</h1>
        <!-- NHẬP ĐÁNH GIÁ VÀ COMMENT -->
        <div class="slidecontainer">
            Score: <input type="range" min="0" max="10" value="5" class="slider" id="scoreRange" step="1" onchange="displayScore(this.value)">
            <asp:Label ID="score" runat="server" Text=""></asp:Label>/10
            <asp:HiddenField ID="hiddenScore" runat="server" />    
        </div>
        <textarea id="comment" placeholder="Write your comment here" runat="server"></textarea>
        <br>
        <asp:Button ID="BtnComment" runat="server" Text="Submit" OnClick="BtnComment_Click"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Comment required!" ControlToValidate="comment"></asp:RequiredFieldValidator>
        
        <fieldset>
            <legend>Another evaluations</legend>
            <!-- HIỂN THỊ ĐÁNH GIÁ CỦA MỌI NGƯỜI -->
            <asp:Repeater ID="lsCmt" runat="server">
                <ItemTemplate>

                    <div class="user-comment">
                        <label>&#128578; <%#Eval("account") %></label><br /><%#Eval("date") %><br />
                        <progress min='0' max='10' value='<%#Eval("vote") %>'></progress><%#Eval("vote") %>/10
                        <br>
                        <textarea id="userComment" disabled runat="server"><%#Eval("comment") %></textarea>
                    </div>

                </ItemTemplate>
            </asp:Repeater>

        </fieldset>
        <script>
            displayScore(document.getElementById("scoreRange").value);
            function displayScore(valueScore) {
                document.getElementById('<%= score.ClientID %>').innerHTML = valueScore;
                document.getElementById('<%= hiddenScore.ClientID %>').value = valueScore;
            }
        </script>
    </div>
</asp:Content>
