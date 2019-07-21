<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Marina.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-4">
                <p id="welcome">
                    Welcome to Inland Marina <br /> <br /> 
                    Located on the south shore Inland Lake, just a small commute from major centers in the south west.
                </p>
            </div>
            <div class="col-8">
                <img id="home" alt="marina" class="auto-style2" src="images/marina_zadar.jpg" />
            </div>
        </div>
        <div class="row" id="descr">
            <h3> Our History </h3>
            <br /> <br />
            <p>
                Inland Marina was established in the 1967 shortly after Inland Lake was created as a result of the South West damn. From its humble beginnings, it has grown to be the largest marina on Inland Lake. Due to the warm climate that extends year-round, Inland Lake has become a popular tourist destination in the south west. Boat owners from California, Arizona, Nevada, and Utah are attracted to the area. Inland Marina has 90 slips ranging in size from 16 to 32 feet in length. Dock services include electrical and fresh water.
            </p>
        </div>
    </div>
</asp:Content>
