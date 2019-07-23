<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Marina.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 1751px;
        }
        .auto-style2 {
            width: 153px;
        }
        .auto-style3 {
            width: 153px;
            height: 80px;
        }
        .auto-style4 {
            height: 80px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Login
    <table class="w-100">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label1" runat="server" Text="Frist Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td aria-autocomplete="none" class="auto-style2">
                <asp:Label ID="Label2" runat="server" Text="Phone Number"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style4">
                <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="#CC0000" Text="Incorrect Username or Password"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
