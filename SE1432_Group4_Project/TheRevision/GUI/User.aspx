<%@ Page Title="" Language="C#" MasterPageFile="~/Skeleton.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="TheRevision.GUI.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="left">
        <h1>YOUR REVIEWS</h1>
        <asp:Repeater ID="lsPro" runat="server" OnItemCommand="lsPro_ItemCommand">
            <ItemTemplate>
        <div class="review-item">
            <h3>
                <a href="DetailReview.aspx?id=<%#Eval("id") %>"><%#Eval("name") %></a>
                <progress min="0" max="10" value="<%#Eval("point") %>"></progress><%#Eval("point") %>/10
                <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%#Eval("id") %>'/>
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("id") %>'/>
            </h3>
            <p><%#Eval("description") %></p>
        </div>
       </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="right">
        <h1><%= (String)Session["account"] %></h1>
        <asp:Button ID="btnLogout" runat="server" Text="Log out" OnClick="btnLogout_Click" />
    </div>
</asp:Content>
