<%@ Page Title="Add Recipe" Language="C#" MasterPageFile="~/MasterLayout.master" AutoEventWireup="true" CodeFile="addRecipe.aspx.cs" Inherits="addRecipe" %>

<%@Register Src="~/ingredientList.ascx" TagPrefix="uc" TagName="IngredientList"%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="App_Themes/addReceipeStyles.css" rel="stylesheet" />

    <style type="text/css">
        #btnReset {
            width: 57px;
            height: 34px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceHolder" Runat="Server">
    <div class="banner">
            <img src="images/recipeBanner.jpg" class="bannerPic" />
        </div>
    <div class="allPage">
        
        <h1>Add A Receipe</h1>
        
        <div class="labelDiv">
            <p>
            <asp:Label ID="lblRecipeName" runat="server" Text="Recipe Name:" Height="20px" ></asp:Label>
            </p>
            <p>
            <asp:Label ID="lblSubmittedBy" runat="server" Text="Submitted By:" Height="20px"></asp:Label>
            </p>
            <p>
            <asp:Label ID="lblCategory" runat="server" Text="Category:" Height="20px"></asp:Label>
            </p>
            <p>
             <asp:Label ID="lblCookTime" runat="server" Text="Prepare/Cooking Time:" Height="20px"></asp:Label>
            </p>
            <p>
             <asp:Label ID="lblNumServings" runat="server" Text="Number Of Servings:" Height="20px"></asp:Label>
            </p>
            <p>
             <asp:Label ID="lblRecipeDisc" runat="server" Text="Recipe Description:"></asp:Label>
            </p>
        </div>
             

        <div class="inputDiv">
            <p>
            <asp:TextBox ID="txtRecipeName" runat="server" Height="18px" CssClass="textBox"></asp:TextBox>
             &nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredName" runat="server" ControlToValidate="txtRecipeName" ErrorMessage="Recipe Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
             </p>
            <p>
            <asp:TextBox ID="txtSubmittedBy" runat="server" Height="18px" CssClass="textBox"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredSubmittedBy" runat="server" ErrorMessage="Submitted By Required" ForeColor="Red" ControlToValidate="txtSubmittedBy"></asp:RequiredFieldValidator>
            </p>
            <p>
            <asp:TextBox ID="txtCategory" runat="server" Height="18px" CssClass="numServings"></asp:TextBox>
            </p>
            <p>
             <asp:TextBox ID="txtCookTime" runat="server" Height="20px" CssClass="numServings"></asp:TextBox>
            </p>
            <p>
             <asp:TextBox ID="txtNumServings" runat="server" Height="20px" CssClass="numServings"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredServingNum" runat="server" ErrorMessage="Serving Number Required" ForeColor="Red" ControlToValidate="txtNumServings"></asp:RequiredFieldValidator>
            </p>
            <p>
             <asp:TextBox ID="txtReceipeDescription" runat="server" Rows="7" TextMode="MultiLine" CssClass="textBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredDescription" runat="server" ErrorMessage="Description Required" ForeColor="Red" ControlToValidate="txtReceipeDescription"></asp:RequiredFieldValidator>
            </p>
        </div>

        <div class="ingredientList">
            <h3>Ingredient List</h3>
            <uc:IngredientList runat="server" id="ingredientList1" />  
            <uc:IngredientList runat="server" id="ingredientList2" />
            <uc:IngredientList runat="server" ID="ingredientList3" />
            <uc:IngredientList runat="server" ID="ingredientList4" />
            <uc:IngredientList runat="server" ID="ingredientList5" />
            <uc:IngredientList runat="server" ID="ingredientList6" />
            <uc:IngredientList runat="server" ID="ingredientList7" />
            <uc:IngredientList runat="server" ID="ingredientList8" />
            <uc:IngredientList runat="server" ID="ingredientList9" />
            <uc:IngredientList runat="server" ID="ingredientList10" />
            <uc:IngredientList runat="server" ID="ingredientList11" />
            <uc:IngredientList runat="server" ID="ingredientList12" />
            <uc:IngredientList runat="server" ID="ingredientList13" />
            <uc:IngredientList runat="server" ID="ingredientList14" />
            <uc:IngredientList runat="server" ID="ingredientList15" />  
        </div>

        <div class="submit">
            
            <asp:Button ID="btnSubmit" runat="server" Text="Save Recipe" Height="34px" Width="98px" OnClick="btnSubmit_Click" /> &nbsp
            
            <input id="btnReset" type="reset" value="Clear" runat="server" class="btnClear"/>

        </div>
    
    </div>
    <!--theme is a public property accessible in code-->
  
</asp:Content>

