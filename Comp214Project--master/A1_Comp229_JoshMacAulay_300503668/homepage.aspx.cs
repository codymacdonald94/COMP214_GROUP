using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class homepageTest : System.Web.UI.Page
{
    private bool themeSet = false;

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

        // welcomeMessage.Text = string.Format("Welcome to The Big Cookin Cookbook, Here you can view recipes, add a new recipe, and search for recipes");
        welcomeMessage.Text = string.Format("Welcome to The Big Cookin Cookbook" + "<br/>" +
            "Here you can:" + "<br/>" + "View Recipes of all sorts" + "<br/>" + "Add a new recipe to the data base" + "<br/>" + "Search for various recipes");
        banner.ImageUrl = "images/cookingBanner1edit2.jpg";
    }
}