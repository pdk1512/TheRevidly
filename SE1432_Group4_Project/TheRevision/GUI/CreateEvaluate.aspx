<%@ Page Title="" Language="C#" MasterPageFile="~/Skeleton.Master" AutoEventWireup="true" CodeBehind="CreateEvaluate.aspx.cs" Inherits="TheRevision.GUI.CreateEvaluate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 169px;
        }
        .auto-style3 {
            width: 300px;
        }
        .auto-style4 {
            width: 342px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="left">
        <h1>NEW EVALUATION</h1>
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="Product Name"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Name required!"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Price"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrice" ErrorMessage="Price Required!"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Address</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address Required!"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Type</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="listType" runat="server">
                    </asp:DropDownList>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style2">Vote</td>
                <td class="auto-style3">
                    <input type="range" min="0" max="10" value="5" class="slider" id="scoreRange" step="1" onchange="displayScore(this.value)">
                    <asp:Label ID="score" runat="server" Text=""></asp:Label>/10
                </td>
                <td><asp:HiddenField ID="hiddenScore" runat="server" /></td>
            </tr>
            <tr>
                <td class="auto-style2">Description</td>
                <td class="auto-style3">
                    <textarea id="txtAreaDes" name="S1" rows="2" runat="server" class="auto-style4"></textarea></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Description Required!" ControlToValidate="txtAreaDes"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Comment</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtComment" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtComment" ErrorMessage="Comment Required!"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">URL Link</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtUrl" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="URL required!" ControlToValidate="txtUrl"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Images</td>
                <td class="auto-style3">
                    <asp:FileUpload ID="ImageUpload" runat="server" multiple="true"/>
                </td>
                <td>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ImageUpload" ErrorMessage="Choose images"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
        </table>
        <script>
            displayScore(document.getElementById("scoreRange").value);
            function displayScore(valueScore) {
                document.getElementById('<%= score.ClientID %>').innerHTML = valueScore;
                document.getElementById('<%= hiddenScore.ClientID %>').value = valueScore;
            }
        </script>
    </div>
    <div class="right">
        <asp:Button ID="btnNext" runat="server" Text="Add" OnClick="btnNext_Click" />
    </div>
</asp:Content>
