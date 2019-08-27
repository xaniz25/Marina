<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SlipByDock.aspx.cs" Inherits="Marina.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <p><h5>Dock Information</h5>
            <!--shows all docks and the service each has-->
            <asp:GridView ID="gvDocks" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="DocksDataSource">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:CheckBoxField DataField="WaterService" HeaderText="WaterService" SortExpression="WaterService" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:CheckBoxField DataField="ElectricalService" HeaderText="ElectricalService" SortExpression="ElectricalService" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="DocksDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT [ID], [WaterService], [Name], [ElectricalService] FROM [Dock]"></asp:SqlDataSource>
        </p>
        <p><h5>Avaiable Slips</h5>
            <!--shows slips that haven't been leased yet according to which dock is selected-->
            <asp:GridView ID="gvSlips" runat="server" AutoGenerateColumns="False" DataKeyNames="SLIP ID" DataSourceID="SlipsDataSource">
                <Columns>
                    <asp:BoundField DataField="SLIP ID" HeaderText="SLIP ID" InsertVisible="False" ReadOnly="True" SortExpression="SLIP ID" />
                    <asp:BoundField DataField="SLIP WIDTH" HeaderText="SLIP WIDTH" SortExpression="SLIP WIDTH" />
                    <asp:BoundField DataField="SLIP LENGTH" HeaderText="SLIP LENGTH" SortExpression="SLIP LENGTH" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SlipsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString0 %>" InsertCommand="INSERT INTO Lease(ID, SlipID, CustomerID) VALUES (,,)" SelectCommand="SELECT Slip.ID AS [SLIP ID], Slip.Width AS [SLIP WIDTH], Slip.Length AS [SLIP LENGTH], Dock.Name FROM Slip INNER JOIN Dock ON Slip.DockID = Dock.ID WHERE (Slip.DockID IN (SELECT ID FROM Dock AS Dock_1 WHERE (ID = @ID))) AND (Slip.ID NOT IN (SELECT SlipID FROM Lease))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvDocks" Name="ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
