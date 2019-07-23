<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaseSlip.aspx.cs" Inherits="Marina.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 368px;
        }
        .auto-style2 {
            width: 475px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class ="container-fluid">
        <p>Welcome, Customer&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" Height="50px" Width="276px">
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString0 %>" SelectCommand="SELECT [ID], [FirstName], [LastName], [Phone], [City] FROM [Customer] WHERE (([FirstName] = @FirstName) AND ([Phone] = @Phone))">
                <SelectParameters>
                    <asp:SessionParameter Name="FirstName" SessionField="FirstName" Type="String" />
                    <asp:SessionParameter Name="Phone" SessionField="Phone" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>Lease Information</p>
        <p>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2">
            </asp:GridView>
        </p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString0 %>" SelectCommand="SELECT Lease.SlipID, Slip.Width, Slip.Length, Dock.Name
FROM Customer INNER JOIN Dock ON Customer.ID = Dock.ID INNER JOIN Lease ON Customer.ID = Lease.CustomerID INNER JOIN Slip ON Dock.ID = Slip.DockID AND Lease.SlipID = Slip.ID
where customerid in(select  id from customer where firstname=@FirstName and phone=@Phone)">
                <SelectParameters>
                    <asp:SessionParameter Name="FirstName" SessionField="FirstName" />
                    <asp:SessionParameter Name="Phone" SessionField="Phone" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            Deck Information</p>
        <p class="auto-style1">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:CheckBoxField DataField="WaterService" HeaderText="WaterService" SortExpression="WaterService" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:CheckBoxField DataField="ElectricalService" HeaderText="ElectricalService" SortExpression="ElectricalService" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString0 %>" SelectCommand="SELECT [ID], [WaterService], [Name], [ElectricalService] FROM [Dock]"></asp:SqlDataSource>
        </p>
        <p class="auto-style2">
            Avaiable Slips<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="SLIP ID" DataSourceID="SqlDataSource4" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="SLIP ID" HeaderText="SLIP ID" InsertVisible="False" ReadOnly="True" SortExpression="SLIP ID" />
                    <asp:BoundField DataField="SLIP WIDTH" HeaderText="SLIP WIDTH" SortExpression="SLIP WIDTH" />
                    <asp:BoundField DataField="SLIP LENGTH" HeaderText="SLIP LENGTH" SortExpression="SLIP LENGTH" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Lease" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString0 %>" InsertCommand="INSERT INTO Lease(ID, SlipID, CustomerID) VALUES (,,)" SelectCommand="SELECT Slip.ID AS [SLIP ID], Slip.Width AS [SLIP WIDTH], Slip.Length AS [SLIP LENGTH], Dock.Name FROM Slip INNER JOIN Dock ON Slip.DockID = Dock.ID WHERE (Slip.DockID IN (SELECT ID FROM Dock AS Dock_1 WHERE (ID = @ID))) AND (Slip.ID NOT IN (SELECT SlipID FROM Lease))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="ID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>&nbsp;</p> 
                <p>&nbsp;</p>
                <p>
                    &nbsp;</p>
                <p>
                    &nbsp;</p>
        </div>
</asp:Content>
