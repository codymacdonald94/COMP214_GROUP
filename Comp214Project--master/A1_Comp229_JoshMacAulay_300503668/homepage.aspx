<%@ Page Title="" Language="C#" MasterPageFile="~/MasterLayout.master" AutoEventWireup="true" CodeFile="homepage.aspx.cs" Inherits="homepageTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="App_Themes/homePageStyles.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" Runat="Server">
    <div class="bannerDiv">
        <asp:Image ID="banner" runat="server" />
    </div>
    <div class="content">
    <h2>The Big Cookin Cookbook</h2>
    <br />
    <p>Hello</p>
    <br />
    <br />
    <asp:Label ID="welcomeMessage" runat="server"></asp:Label>
    </div>

</asp:Content>
