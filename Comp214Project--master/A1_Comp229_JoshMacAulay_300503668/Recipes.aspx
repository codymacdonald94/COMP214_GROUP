<%@ Page Title="Recipes" Language="C#" MasterPageFile="~/MasterLayout.master" AutoEventWireup="true" CodeFile="Recipes.aspx.cs" Inherits="Recipes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" Runat="Server">
    <div class="allPage">
        <div class="banner">
            <img src="images/foodRecipeBanner.jpg" />
        </div>
    <h1>Recipes</h1>
        <p>
        <a href="addRecipe.aspx">Add a Recipe</a>
        </p>
       

        <asp:ListView ID="listRecipes" runat="server" OnItemCommand="listRecipes_ItemCommand">
            <ItemTemplate>
                  <span style="">Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("recipeName") %>' />
                <br />
                Submitted By:
                <asp:Label ID="SubmittedByLabel" runat="server" Text='<%# Eval("SubmittedBy") %>' />
                <br />
                PrepTime:
                <asp:Label ID="PrepTimeLabel" runat="server" Text='<%# Eval("cookTime") %>' />
                <br />
                <asp:LinkButton ID="btnDetails" runat="server" Text=<%#"Show full " + Eval("recipeName") + " recipe" %> 
                    CommandName="MoreDetails" 
                    CommandArgument=<%# Eval("recipeID") %> />
                <br />
                <br />
                      <hr />
                  </span>
                </ItemTemplate>
        </asp:ListView>

        <asp:Label ID="lblResult" runat="server" ></asp:Label>


        
    </div>
</asp:Content>

