<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SlipByDock.aspx.cs" Inherits="Marina.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <p>Select Dock:</p>
        <p>
            <asp:DropDownList ID="ddlDocks" runat="server" DataSourceID="DockDataSource" DataTextField="Name" DataValueField="ID">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="DockDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDock" TypeName="Marina.DockDB"></asp:ObjectDataSource>
        </p>
        <p>&nbsp;</p>
        <p>Slip by Dock:</p>
        <asp:GridView ID="gvSlips" runat="server" AutoGenerateColumns="False" DataSourceID="SlipDataSource">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                <asp:BoundField DataField="DockID" HeaderText="DockID" SortExpression="DockID" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="SlipDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetSlipByDock" TypeName="Marina.SlipDB">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDocks" Name="dockid" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <p>&nbsp;</p>
    </div>
</asp:Content>
