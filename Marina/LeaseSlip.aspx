<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaseSlip.aspx.cs" Inherits="Marina.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class ="container-fluid">
        <p>Welcome, Customer First Name</p>
        <p>Your current and past slips:</p>
        <p>
            <asp:GridView ID="gvLeasedSlips" runat="server" AutoGenerateColumns="False" DataSourceID="LeaseSlipsDataSource">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                    <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                    <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                    <asp:BoundField DataField="DockID" HeaderText="DockID" SortExpression="DockID" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="LeaseSlipsDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetSlipByCust" TypeName="Marina.SlipDB">
                <SelectParameters>
                    <asp:Parameter Name="CustomerID" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </p>
        <p>
            Lease new slip:</p>
        <p>Select Dock:
            <asp:DropDownList ID="ddlDocks" runat="server" DataSourceID="DocksDataSource" DataTextField="Name" DataValueField="ID" AutoPostBack="True">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="DocksDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDock" TypeName="Marina.DockDB"></asp:ObjectDataSource>
        </p>
        <p>Available Slips:</p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SlipID" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="SlipID" HeaderText="SlipID" InsertVisible="False" ReadOnly="True" SortExpression="SlipID" />
                    <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                    <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                    <asp:CheckBoxField DataField="WaterService" HeaderText="WaterService" SortExpression="WaterService" />
                    <asp:CheckBoxField DataField="ElectricalService" HeaderText="ElectricalService" SortExpression="ElectricalService" />
                    <asp:CommandField CausesValidation="False" SelectText="Lease" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString1 %>" SelectCommand="SELECT s.ID as 'SlipID',Width, Length, WaterService, ElectricalService
FROM Slip s JOIN Dock d ON d.ID = DockID
WHERE DockID in (Select ID from Dock Where ID=@DockID)
And s.ID NOT IN (SELECT SLIPID FROM LEASE)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlDocks" Name="DockID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
