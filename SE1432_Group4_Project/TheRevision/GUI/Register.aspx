<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TheRevision.GUI.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel='stylesheet' type='text/css' href="../myStyle.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <style type="text/css">
        .auto-style1 {
            width: 104px;
        }
        .auto-style2 {
            width: 104px;
            height: 20px;
        }
        .auto-style3 {
            height: 20px;
        }
        .auto-style4 {
            width: 199px;
        }
        .auto-style5 {
            height: 20px;
            width: 199px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="login">
                <fieldset>
                    <legend>REGISTRATION</legend>
                    
                    <table style="width:100%;">
                        <asp:Label ID="lblError" runat="server" Text="Label" ForeColor="#CC0000" Visible="False"></asp:Label>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                            </td>
                            <td class="auto-style4">
                                <asp:TextBox ID="txtUser" runat="server"></asp:TextBox><br />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUser" ErrorMessage="Your username is empty"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                            </td>
                            <td class="auto-style4">
                                <asp:TextBox ID="txtPass" TextMode="Password" runat="server"></asp:TextBox><br />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="Your password is empty"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="Label3" runat="server" Text="Re-Password"></asp:Label>
                            </td>
                            <td class="auto-style4">
                                <asp:TextBox ID="txtRepass" TextMode="Password" runat="server"></asp:TextBox><br />
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRepass" ErrorMessage="Please confirm your password"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2"></td>
                            <td class="auto-style5">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtRepass" ControlToValidate="txtPass" ErrorMessage="Re-password wrong!"></asp:CompareValidator>
                            </td>
                            <td class="auto-style3"></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                            </td>
                            <td class="auto-style4"></td>
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

