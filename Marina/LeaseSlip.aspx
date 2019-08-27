<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaseSlip.aspx.cs" Inherits="Marina.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class ="container-fluid">
        <br />
        <p><h2>Welcome!</h2></p>
        <p><h5>Your Information</h5>
            <!--detailview that gets customer info-->
            <asp:DetailsView ID="dvCustomer" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="CustomerDataSource" Height="50px" Width="276px">
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="CustomerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString1 %>" SelectCommand="SELECT [ID], [FirstName], [LastName], [Phone], [City] FROM [Customer] WHERE (([FirstName] = @FirstName) AND ([Phone] = @Phone))">
                <SelectParameters>
                    <asp:SessionParameter Name="FirstName" SessionField="FirstName" Type="String" />
                    <asp:SessionParameter Name="Phone" SessionField="Phone" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p><h5>Your Slips</h5>
            <!--gridview that shows slips leased by current logged in customer, parameter is from session-->
            <asp:GridView ID="gvCurrentSlips" runat="server" DataSourceID="CurrentSlipsDataSource" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="SlipID" HeaderText="SlipID" SortExpression="SlipID" />
                    <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                    <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                </Columns>
            </asp:GridView>
        </p>
        <p>
            <asp:SqlDataSource ID="CurrentSlipsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString1 %>" SelectCommand="SELECT Lease.SlipID, Slip.Width, Slip.Length, Dock.Name
from Lease inner join Slip on lease.SlipID=slip.ID
inner join Customer on Customer.id=Lease.CustomerID
inner join dock on dock.ID=slip.DockID
where customerid in(select  id from customer where firstname=@FirstName and phone=@Phone)">
                <SelectParameters>
                    <asp:SessionParameter Name="FirstName" SessionField="FirstName" />
                    <asp:SessionParameter Name="Phone" SessionField="Phone" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p><h4>Lease New Slip</h4></p>
        <p><h5>Dock Information</h5>
            <!--gridview that shows all docks and the service each has-->
            <asp:GridView ID="gvDocks" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="DocksDataSource">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:CheckBoxField DataField="WaterService" HeaderText="WaterService" SortExpression="WaterService" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:CheckBoxField DataField="ElectricalService" HeaderText="ElectricalService" SortExpression="ElectricalService" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="DocksDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString1 %>" SelectCommand="SELECT [ID], [WaterService], [Name], [ElectricalService] FROM [Dock]"></asp:SqlDataSource>
        </p>
        <p><h5>Available Slips</h5>
            <!--all slips for each dock-->
            <asp:GridView ID="gvSlips" runat="server" AutoGenerateColumns="False" DataKeyNames="SLIP ID" DataSourceID="SlipsDataSource" OnSelectedIndexChanged="gvSlips_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="SLIP ID" HeaderText="SLIP ID" InsertVisible="False" ReadOnly="True" SortExpression="SLIP ID" />
                    <asp:BoundField DataField="SLIP WIDTH" HeaderText="SLIP WIDTH" SortExpression="SLIP WIDTH" />
                    <asp:BoundField DataField="SLIP LENGTH" HeaderText="SLIP LENGTH" SortExpression="SLIP LENGTH" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnLease" runat="server" CausesValidation="false" OnClick="btnLease_OnClick" CommandName="Lease" Text="Lease" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SlipsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString1 %>" InsertCommand="INSERT INTO Lease(ID, SlipID, CustomerID) VALUES (,,)" SelectCommand="SELECT Slip.ID AS [SLIP ID], Slip.Width AS [SLIP WIDTH], Slip.Length AS [SLIP LENGTH], Dock.Name FROM Slip INNER JOIN Dock ON Slip.DockID = Dock.ID WHERE (Slip.DockID IN (SELECT ID FROM Dock AS Dock_1 WHERE (ID = @ID))) AND (Slip.ID NOT IN (SELECT SlipID FROM Lease))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvDocks" Name="ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
