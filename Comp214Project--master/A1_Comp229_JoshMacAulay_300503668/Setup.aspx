<%@ Page Title="" Language="C#" MasterPageFile="~/MasterLayout.master" AutoEventWireup="true" CodeFile="Setup.aspx.cs" Inherits="Setup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" Runat="Server">
    <h1>Choose Your Website Theme: </h1>
    <p>Light:
        <asp:RadioButton ID="radioLight" runat="server" GroupName="themeChoice" />
&nbsp;&nbsp;&nbsp;&nbsp; Dark:
        <asp:RadioButton ID="radioDark" runat="server" GroupName="themeChoice" />
    </p>
<p>
    <asp:Button ID="btnSetup" runat="server" OnClick="Button1_Click" Text="Save" Width="73px" />
    </p>
    
</asp:Content>

