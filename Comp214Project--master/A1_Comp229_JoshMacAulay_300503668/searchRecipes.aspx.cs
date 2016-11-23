using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;
using System.Data;

public partial class searchRecipes : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            BindList();
        }
    }

    private void BindList()
    {
        OracleDataReader reader;

        string connectionString = "DATA SOURCE=oracle1.centennialcollege.ca:1521/SQLD;PASSWORD=password;USER ID=COMP214F16_004_P_20";
        OracleConnection connection = new OracleConnection(connectionString);

       // OracleCommand getSubmittedByComm = new OracleCommand("select category from recipes");
        

        

        try
        {
            OracleCommand getSubmittedByComm = new OracleCommand("select submittedBy from recipes", connection);
            OracleCommand getCategoryComm = new OracleCommand("select category from recipes", connection);
            OracleCommand getIndNameComm = new OracleCommand("select ingredientName from ingredients", connection);

            connection.Open();
            //submitted By
            reader = getSubmittedByComm.ExecuteReader();
            ddSubmittedBy.DataSource = reader;
            ddSubmittedBy.DataValueField = "submittedBy";
            ddSubmittedBy.DataTextField = "submittedBy";
            ddSubmittedBy.DataBind();
            ddSubmittedBy.Items.Insert(0, "Any");

            //category
            reader = getCategoryComm.ExecuteReader();
            ddCategory.DataSource = reader;
            ddCategory.DataValueField = "category";
            ddCategory.DataTextField = "category";
            ddCategory.DataBind();
            ddCategory.Items.Insert(0, "Any");

            //ingredient name
            reader = getIndNameComm.ExecuteReader();
            ddName.DataSource = reader;
            ddName.DataValueField = "ingredientName";
            ddName.DataTextField = "ingredientName";
            ddName.DataBind();
            //lblError.Text = ddSubmittedBy.SelectedValue;
            ddName.Items.Insert(0, "Any");
        }
        catch (OracleException ex)
        {
            lblError.Text = ex.Message;
        }
        finally
        {

            connection.Close();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string connectionString = "DATA SOURCE=oracle1.centennialcollege.ca:1521/SQLD;PASSWORD=password;USER ID=COMP214F16_004_P_20";
        OracleConnection connection = new OracleConnection(connectionString);

        try
        {


            string sql = "select * from recipes where submittedBy = :SubmittedBY and category = :Category";
            OracleCommand aCommand = new OracleCommand(sql, connection);

            OracleParameter parameter;
            parameter = new OracleParameter(":SubmittedBY", OracleDbType.Varchar2, 20);
            parameter.Value = ddSubmittedBy.SelectedValue;
            aCommand.Parameters.Add(parameter);

            
            parameter = new OracleParameter(":Category", OracleDbType.Varchar2, 20);
            parameter.Value = ddCategory.SelectedValue;
            aCommand.Parameters.Add(parameter);

            
            //parameter3 = new OracleParameter(":IngredientName", OracleDbType.Varchar2, 20);
            //parameter3.Value = ddName.SelectedValue;
            //aCommand.Parameters.Add(parameter3);

            //if(ddSubmittedBy.SelectedValue == "Any")
            //{
            //    sql = "select * from recipes where category = :Category";
            //}
            //if (ddCategory.SelectedValue == "Any")
            //{
            //    sql = "select * from recipes where submittedBy = :SubmittedBY";
            //}
            //if (ddSubmittedBy.SelectedValue == "Any" && ddCategory.SelectedValue == "Any")
            //{
            //    sql = "select * from recipes";
            //}
            

            connection.Open();
            OracleDataReader reader = aCommand.ExecuteReader();
            gvSearch.DataSource = reader;
            gvSearch.DataBind();

            
            if(!reader.HasRows)
            {
                lblError.Text = "No matches found";
            }
        }
        catch (OracleException ex)
        {
            lblError.Text = ex.Message;
        }
        finally
        {

            connection.Close();
        }
    }
}