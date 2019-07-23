﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaseSlip.aspx.cs" Inherits="Marina.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class ="container-fluid">
        <p>Welcome, Customer First Name</p> <br />
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
                </p>
                <p>Available Slips:</p>
        <p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SlipsDataSource">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                    <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                    <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                    <asp:BoundField DataField="DockID" HeaderText="DockID" SortExpression="DockID" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="SlipsDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetSlipByDock" TypeName="Marina.SlipDB">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlDocks" Name="DockID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </p>
                <p>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
                            <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="SlipID" HeaderText="SlipID" SortExpression="SlipID" />
                            <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
                            <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                            <asp:CheckBoxField DataField="WaterService" HeaderText="WaterService" SortExpression="WaterService" />
                            <asp:CheckBoxField DataField="ElectricalService" HeaderText="ElectricalService" SortExpression="ElectricalService" />
                        </Columns>
                    </asp:GridView>
                </p>
                <p>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString1 %>" SelectCommand="SELECT lease.[ID]
	                                    ,lastname
	                                    ,firstname      
	                                    ,[Name]	  
	                                    ,[SlipID]
	                                    ,[Width]
	                                    ,[Length] 
                                        ,[WaterService]
                                        ,[ElectricalService]
                                        FROM [Marina].[dbo].[Lease]
                                        join   customer on customer.ID=lease.CustomerID
                                        join slip on slip.ID= lease.SlipID
                                        join Dock on dock.ID=slip.DockID "></asp:SqlDataSource>
                </p>
        </div>
</asp:Content>
