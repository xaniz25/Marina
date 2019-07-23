<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Marina.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 81px;
        }
    .auto-style4 {
        width: 80px;
        text-align: right;
    }
    .auto-style5 {
        width: 80px;
        text-align: left;
    }
        .auto-style6 {
            width: 80px;
            text-align: right;
            height: 122px;
        }
        .auto-style7 {
            height: 122px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table class="w-100">
            <tr>
                <td class="text-left" colspan="2">New Customer Registration:</td>
            </tr>
            <tr>
                <td class="auto-style5">Sign Up </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">First Name</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="FirstNameRequired0" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required." ToolTip="First Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
            </tr>
            <tr>
                <td class="auto-style4">Last Name</td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="LastNameRequired0" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
            </tr>
            <tr>
                <td class="auto-style4">City</td>
                <td>
                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CityRequired0" runat="server" ControlToValidate="TxtCity" ErrorMessage="City is required." ToolTip="City is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
            </tr>
            <tr>
                <td class="auto-style4">Password</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="TxtPassword" ErrorMessage="Password is required" ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
            </tr>
            <tr>
                <td class="auto-style4">Confirm Password</td>
                <td>
                    <asp:TextBox ID="txtConfirmPassword" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="TxtConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="ConfirmPassword is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Button ID="btnCreateUser" runat="server" OnClick="btnCreateUser_Click" Text="Create User" />
                </td>
            </tr>
        </table>
    </div>

  <%--  </asp:Content>--%>
</asp:Content>

