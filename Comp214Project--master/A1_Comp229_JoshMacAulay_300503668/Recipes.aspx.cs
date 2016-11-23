using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;

public partial class Recipes : System.Web.UI.Page
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
        if (!Page.IsPostBack)
        {
            BindList();
        }
    }

    private void BindList()

    {
        string connectionString = "DATA SOURCE=oracle1.centennialcollege.ca:1521/SQLD;PASSWORD=password;USER ID=COMP214F16_004_P_20";

        OracleConnection connection = new OracleConnection(connectionString);
        try
        {
            string sql = "select recipeid, recipename, submittedby, cooktime from recipes";
            OracleCommand aCommand = new OracleCommand(sql, connection);

            connection.Open();

            OracleDataReader reader = aCommand.ExecuteReader();
            listRecipes.DataKeyNames = new string[] { "recipeid" };
            listRecipes.DataSource = reader;
            listRecipes.DataBind();
        }
        catch (OracleException ex)
        {
            lblResult.Text = ex.Message;
        }
        catch (Exception ex)
        {

            lblResult.Text = ex.Message;
        }
        finally
        {

            connection.Close();
        }
    }

    //if someone selects item in the list 
    protected void listRecipes_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "MoreDetails")
        {
            //Session["details"] = (string)listRecipes.DataKeys[listRecipes.SelectedIndex].Value;
            Session["details"] = e.CommandArgument ;
            //Session["details"] = "select * from recipes where recipeName = " + "'" + e.CommandArgument + "';";
            Response.Redirect("recipeDetails.aspx");
        }
            
    }
}