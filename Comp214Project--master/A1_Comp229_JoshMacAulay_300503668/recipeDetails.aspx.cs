using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using System.Data;

public partial class recipeDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["details"] != null || (string)Session["details"] != "")
        {
            BindRecipes();
            BindIngredients();
        }
        else
        {
            lblResult.Text = "Please Choose a recipe";
        }
        
    }

    private void BindRecipes()
    {
        string connectionString = "DATA SOURCE=oracle1.centennialcollege.ca:1521/SQLD;PASSWORD=password;USER ID=COMP214F16_004_P_20";
        OracleConnection connection = new OracleConnection(connectionString);

        try
        {
            string sql = "select recipeName, submittedBy, category, cookTime, servingNum, description from recipes where recipeid = " + Session["details"];
            OracleCommand aCommand = new OracleCommand(sql, connection);

            OracleDataReader reader;
            connection.Open();
            reader = aCommand.ExecuteReader();

            //recipeList.DataSource = reader;
            //recipeList.DataBind();
            recipeGrid.DataSource = reader;
            recipeGrid.DataBind();
        }
        catch (Exception)
        {

            throw;
        }
        finally
        {
            connection.Close();
        }
    }

    private void BindIngredients()
    {
        string connectionString = "DATA SOURCE=oracle1.centennialcollege.ca:1521/SQLD;PASSWORD=password;USER ID=COMP214F16_004_P_20";
        OracleConnection connection = new OracleConnection(connectionString);

        try
        {
            string sql = "select ingredientName, quantity, measure from ingredients where recipeid = " + Session["details"];
            OracleCommand aCommand = new OracleCommand(sql, connection);

            OracleDataReader reader;
            connection.Open();
            reader = aCommand.ExecuteReader();

            ingredientList.DataSource = reader;
            ingredientList.DataBind();
            
        }
        catch (Exception)
        {

            throw;
        }
        finally
        {
            connection.Close();
        }
    }


    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string connectionString = "DATA SOURCE=oracle1.centennialcollege.ca:1521/SQLD;PASSWORD=password;USER ID=COMP214F16_004_P_20";
        OracleConnection connection = new OracleConnection(connectionString);

        try
        {
            string ingredientDel = "Delete From ingredients where recipeId = " + Session["details"];
            string recipeDel = "Delete From recipes where recipeId = " + Session["details"];
            OracleCommand deleteRecComm = new OracleCommand(recipeDel, connection);
            OracleCommand deleteIndComm = new OracleCommand(ingredientDel, connection);
            //OracleDataReader reader;
            connection.Open();

            deleteIndComm.ExecuteNonQuery();
            deleteRecComm.ExecuteNonQuery();
            Response.Redirect("~/Recipes.aspx");
            //lblResult.Text = "Success";
        }
        catch (Exception ex)
        {

            lblResult.Text = "Could not Delete";
            lblResult.Text = "\n" + ex.Message;
        }
        finally
        {
            connection.Close();
        }
    }
}

