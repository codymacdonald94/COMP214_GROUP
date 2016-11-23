<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ingredientList.ascx.cs" Inherits="ingreidentList" %>


<p>
    <asp:Label ID="lblIngredientName" runat="server" Text="Ingredient Name:"></asp:Label>
&nbsp;<asp:TextBox ID="txtIngredientName" runat="server" CssClass="textBox" ></asp:TextBox>
&nbsp;&nbsp;
    <asp:Label ID="lblQuantity" runat="server" Text="Quantity:"></asp:Label>
&nbsp;&nbsp;<asp:TextBox ID="txtQuantity" runat="server" Width="36px"></asp:TextBox>
&nbsp;&nbsp;<asp:Label ID="lblUnitMeasure" runat="server" Text="Unit Of Measure: "></asp:Label>
    <asp:TextBox ID="txtUnitMeasure" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp; </p>
<p>
    <asp:RequiredFieldValidator ID="RequiredName" runat="server" ControlToValidate="txtIngredientName" ErrorMessage="Ingredient Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
    <asp:RegularExpressionValidator ID="NumberValidation" runat="server" ControlToValidate="txtQuantity" ErrorMessage="Quantity Must Be a Number" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
</p>


