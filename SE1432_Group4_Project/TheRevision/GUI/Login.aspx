<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TheRevision.GUI.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel='stylesheet' type='text/css' href="../myStyle.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <style type="text/css">
        .auto-style1 {
            width: 87px;
        }

        .auto-style2 {
            width: 200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="login">
                <fieldset>
                    <legend>LOGIN</legend>
                    <table style="width: 100%;">
                        <asp:Label ID="lblError" runat="server" Text="Label" ForeColor="#CC0000" Visible="False"></asp:Label>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="Please input your username"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtPass" TextMode="Password" runat="server"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="Please input your password"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Button ID="btnLogin" runat="server" Text="Sign in" OnClick="btnLogin_Click" />
                            </td>
                            <td class="auto-style2"><a href="Register.aspx">Register</a></td>
                            <td></td>
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div class="footer">
                <div class="author">Author: SE1432_Group4</div>
                <div class="create">@All Rights Reversed. The Review Design By: khanhpd</div>
            </div>
        </div>
    </form>
</body>
</html>
