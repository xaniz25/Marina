<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Marina.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 81px;
        }
    .auto-style4 {
            width: 437px;
            text-align: right;
        }
        .auto-style5 {
            width: 437px;
            text-align: right;
            height: 62px;
        }
        .auto-style6 {
            height: 62px;
        }
        .auto-style9 {
            margin-left: 10px;
        }
        .auto-style10 {
            width: 1424px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--register form that adds new customers to the database-->
    <div class="container-fluid">
        <div id="forms">
            <table class="w-100">
                <tr>
                    <td class="text-left" colspan="3">New Customer Registration:</td>
                </tr>
                <tr>
                    <td class="text-left" colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">Sign Up </td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">First Name</td>
                    <td colspan="2">
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="auto-style9"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="First Name is required" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="Incorrect Format e.g. John " ForeColor="#6600CC" ValidationExpression="(?!^.*[A-Z]{2,}.*$)^[A-Za-z]*$"></asp:RegularExpressionValidator>
                                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Last Name</td>
                    <td colspan="2">
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="auto-style9"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Last Name is required" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Incorrect Format e.g. Smith" ForeColor="#6600CC" ValidationExpression="(?!^.*[A-Z]{2,}.*$)^[A-Za-z]*$"></asp:RegularExpressionValidator>
                                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">City</td>
                    <td class="auto-style6" colspan="2">
                        <asp:TextBox ID="txtCity" runat="server" CssClass="auto-style9"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="City is required" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="Incorrect Format e.g. Calgary" ForeColor="#6600CC" ValidationExpression="(?!^.*[A-Z]{2,}.*$)^[A-Za-z]*$"></asp:RegularExpressionValidator>
                                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Phone</td>
                    <td class="auto-style6" colspan="2">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="auto-style9"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Phone is required" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Incorrect format e.g. 403-123-1234" ForeColor="#6600CC" ValidationExpression="^\(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$"></asp:RegularExpressionValidator>
                                    </td>
                </tr>
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style6" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style10">
                        <asp:Button ID="btnCreateUser" runat="server" OnClick="btnCreateUser_Click" Text="Create User" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" OnClick="Button1_Click" Text="Clear" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </div>
</asp:Content>



