<%@ Page Title="" Language="C#" MasterPageFile="~/MasterLayout.master" AutoEventWireup="true" CodeFile="recipeDetails.aspx.cs" Inherits="recipeDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" Runat="Server">
    <h1>Recipe Details</h1>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="lblResult" runat="server"></asp:Label>
    </p>
    <p>
        <asp:ListView ID="recipeList" runat="server">
            <ItemTemplate>
                  <span style="">Name:
                <asp:Label ID="lblRecipeName" runat="server" Text='<%# Eval("recipeName") %>' />
                      <br />
                      <span style="">Submitted By:
                <asp:Label ID="lblSubmittedBy" runat="server" Text='<%# Eval("submittedBy") %>' />
                          <br />
                          <span style="">Category:
                <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("category") %>' />
                              <br />
                              <span style="">Cook Time:
                <asp:Label ID="lblCookTime" runat="server" Text='<%# Eval("cookTime") %>' />
                                  <br />
                                  <span style="">Serving Amount:
                <asp:Label ID="lblServingNum" runat="server" Text='<%# Eval("servingNum") %>' />
                                      <br />
                                      <span style="">Description:
                <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("description") %>' />
                <br />
                      </ItemTemplate>
        </asp:ListView>
    </p>

    <asp:DetailsView ID="recipeGrid" runat="server" Height="50px" Width="277px" AutoGenerateRows="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <Fields>
            <asp:BoundField DataField="recipeName" HeaderText="Name" />
            <asp:BoundField DataField="submittedBy" HeaderText="Submitted By" />
            <asp:BoundField DataField="category" HeaderText="Category" />
            <asp:BoundField DataField="cookTime" HeaderText="Cook Time" />
            <asp:BoundField DataField="servingNUm" HeaderText="Serving Amount" />
            <asp:BoundField DataField="description" HeaderText="Description" />
        </Fields>
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
    </asp:DetailsView>
    <br />
    <br />
        <h3>Ingredients</h3>

    <asp:ListView ID="ingredientList" runat="server">
        <ItemTemplate>
            <span style="">Ingredient Name: 
        <asp:Label ID="lblIngredientName" runat="server" Text='<%# Eval("ingredientName") %>' />
                      <br />
                      <span style="">Quantity:
                <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("quantity") %>' />
                          <br />
                          <span style="">Measure:
                <asp:Label ID="lblMeasure" runat="server" Text='<%# Eval("measure") %>' />
                              <br />
                              <hr />
         </ItemTemplate>
    </asp:ListView>
    <br />
    <br />
    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
</asp:Content>

