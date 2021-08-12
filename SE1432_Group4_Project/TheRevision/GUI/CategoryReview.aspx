<%@ Page Title="" Language="C#" MasterPageFile="~/Skeleton.Master" AutoEventWireup="true" CodeBehind="CategoryReview.aspx.cs" Inherits="TheRevision.GUI.CategoryReview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="left">
        <h1>LIST OF REVIEWS</h1>

        <asp:Repeater ID="lsPro" runat="server">
            <ItemTemplate>
                <div class="review-item">
                    <h3>
                        <a href="DetailReview.aspx?id=<%#Eval("id") %>"><%#Eval("name") %></a>
                        <progress min="0" max="10" value="<%#Eval("point") %>"></progress><%#Eval("point") %>/10
                    </h3>
                    <p><%#Eval("description") %></p>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
    <div class="right">
        <h1>CATEGORY</h1>

        <asp:Repeater ID="lsCate" runat="server">
            <ItemTemplate>
                <div class="cate-item">
                    <a href="CategoryReview.aspx?cateId=<%#Eval("id") %>"><%#Eval("cateName") %></a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <br />
        <h1>SEARCH</h1>
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSearch" ErrorMessage="Please input before searching"></asp:RequiredFieldValidator>
    </div>
</asp:Content>
