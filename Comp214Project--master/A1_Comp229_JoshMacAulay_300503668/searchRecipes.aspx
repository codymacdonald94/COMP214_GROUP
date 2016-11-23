<%@ Page Title="Search Recipes" Language="C#" MasterPageFile="~/MasterLayout.master" AutoEventWireup="true" CodeFile="searchRecipes.aspx.cs" Inherits="searchRecipes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" Runat="Server">
    <h1>Search Recipies</h1>
    <p>&nbsp;</p>
    <p>
       Submitted By: &nbsp;&nbsp; <asp:DropDownList ID="ddSubmittedBy" runat="server">
        </asp:DropDownList>
    </p>
    <p>
        Category: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:DropDownList ID="ddCategory" runat="server">
        </asp:DropDownList>
    </p>
    <p>
        Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:DropDownList ID="ddName" runat="server">
        </asp:DropDownList>
    </p>
    <p>
        <asp:Button ID="btnSubmit" runat="server" Text="Search Recipes" OnClick="btnSubmit_Click" />
    </p>
    <p>
        <asp:GridView ID="gvSearch" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </p>
    <p>
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </p>

</asp:Content>

