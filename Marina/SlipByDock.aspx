<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SlipByDock.aspx.cs" Inherits="Marina.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3>Available Docks and Slips</h3>
    <div class="row align-content-center"><span class="m-4">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:CheckBoxField DataField="WaterService" HeaderText="WaterService" SortExpression="WaterService" />
        <asp:CheckBoxField DataField="ElectricalService" HeaderText="ElectricalService" SortExpression="ElectricalService" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT [ID], [Name], [WaterService], [ElectricalService] FROM [Dock]"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                <asp:BoundField DataField="DockID" HeaderText="DockID" SortExpression="DockID" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT [ID], [Length], [Width], [DockID] FROM [Slip] WHERE ([DockID] = @DockID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="DockID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        </div>
</asp:Content>
