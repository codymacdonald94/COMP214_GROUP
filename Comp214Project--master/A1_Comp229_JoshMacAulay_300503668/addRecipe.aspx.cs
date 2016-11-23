using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;
using System.Data;

public partial class addRecipe : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        HttpCookie themeCookie;
        themeCookie = Request.Cookies["theme"];

        if (themeCookie == null && Session["SessionTheme"] == null)
        {
            Response.Redirect("~/Setup.aspx");
        }
        //will provide a theme for page if cookies are not allowed 
        else if (Session["SessionTheme"] != null)
        {
            Page.Theme = (string)Session["sessionTheme"];
        }
        else
        {
            Session["theme"] = themeCookie.Value;
            Page.Theme = (string)Session["theme"];
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {

            string connectionString = "DATA SOURCE=oracle1.centennialcollege.ca:1521/SQLD;PASSWORD=password;USER ID=COMP214F16_004_P_20";
          

            OracleConnection connection = new OracleConnection(connectionString);
            //string recipeName = (addRecipe.FindControl("txtRecipeName") as TextBox).Text;

            string recipeName = txtRecipeName.Text;
            string submittedBy = txtSubmittedBy.Text;
            string category = txtCategory.Text;
            string cookTime = txtCookTime.Text;
            int servingNum = Convert.ToInt32(txtNumServings.Text);
            string description = txtReceipeDescription.Text; 

            //string recipeInsert = "insert into RECIPES2 (recipeId, recipeName, submittedBy, category, cooktime, servingNum, description) values(5, @recipeName, @submittedBy, @category, @cookTime, @servingNum, @description)";
            OracleCommand addRecipeComm = new OracleCommand("insertRecipe" ,connection);
            addRecipeComm.CommandType = System.Data.CommandType.StoredProcedure;
            addRecipeComm.CommandText = "insertRecipe";

            addRecipeComm.Parameters.Add("r_recipe_Name", OracleDbType.Varchar2, ParameterDirection.Input).Value = recipeName;
            addRecipeComm.Parameters.Add("r_submitted_By", OracleDbType.Varchar2, ParameterDirection.Input).Value = submittedBy;
            addRecipeComm.Parameters.Add("r_category", OracleDbType.Varchar2, ParameterDirection.Input).Value = category;
            addRecipeComm.Parameters.Add("r_cook_time", OracleDbType.Varchar2, ParameterDirection.Input).Value = cookTime;
            addRecipeComm.Parameters.Add("r_serving_num", OracleDbType.Int32, ParameterDirection.Input).Value = servingNum;
            addRecipeComm.Parameters.Add("r_description", OracleDbType.Varchar2, ParameterDirection.Input).Value = description;


            try
            {
                connection.Open();

                addRecipeComm.ExecuteNonQuery();
                Response.Redirect("Recipes.aspx");
            }
           catch(OracleException ex)
            {
                Response.Redirect("error.aspx");
            }
            finally
            {
                connection.Close();
            }
            

            
                /*((List<Recipe>)Application["recipes"]).Add(
                    new Recipe
                    {
                        Name = txtRecipeName.Text,
                        SubmittedBy = txtSubmittedBy.Text,
                        PrepTime = txtCookTime.Text
                    });
                Response.Redirect("Recipes.aspx");*/
            }
    }

    
    
}