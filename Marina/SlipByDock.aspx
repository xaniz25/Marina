<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SlipByDock.aspx.cs" Inherits="Marina.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <p>Select Dock:</p>
        <p>
            <asp:DropDownList ID="ddlDocks" runat="server" DataSourceID="DockDataSource" DataTextField="Name" DataValueField="ID" AutoPostBack="True">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="DockDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDock" TypeName="Marina.DockDB"></asp:ObjectDataSource>
        </p>
        <p>Available Slips:</p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SlipID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="SlipID" HeaderText="SlipID" InsertVisible="False" ReadOnly="True" SortExpression="SlipID" />
                    <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                    <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                    <asp:CheckBoxField DataField="WaterService" HeaderText="WaterService" SortExpression="WaterService" />
                    <asp:CheckBoxField DataField="ElectricalService" HeaderText="ElectricalService" SortExpression="ElectricalService" />
                </Columns>
            </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString1 %>" SelectCommand="SELECT s.ID as 'SlipID',Width, Length, WaterService, ElectricalService
FROM Slip s JOIN Dock d ON d.ID = DockID
WHERE DockID in (Select ID from Dock Where ID=@DockID)
And s.ID NOT IN (SELECT SLIPID FROM LEASE)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDocks" Name="DockID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        Please Login or Register to Lease a Slip.</div>
</asp:Content>
