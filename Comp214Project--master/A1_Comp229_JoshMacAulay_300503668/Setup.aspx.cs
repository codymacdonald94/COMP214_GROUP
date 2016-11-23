using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

public partial class Setup : System.Web.UI.Page
{
    HttpCookie themeCookie;

    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        if (radioLight.Checked)
        {
            string light = "Light";


            //creating a cookie 
            themeCookie = new HttpCookie("theme", light);
            themeCookie.Expires = DateTime.Now.AddMinutes(3);
            Response.Cookies.Add(themeCookie);

            //setting the theme in the webConfig 
            //var configuration = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
            //var pagesSection = (PagesSection)configuration.GetSection("system.web/pages");
            //pagesSection.Theme = light;
            //configuration.Save();

            //save to Session Variable as well incase cookies are blocked by user 
            Session["sessionTheme"] = light;
            Response.Redirect("~/homepage.aspx");
        }
        else if (radioDark.Checked)
        {
            string dark = "Dark";

            //creating a cookie 
            themeCookie = new HttpCookie("theme", dark);
            themeCookie.Expires = DateTime.Now.AddMinutes(30);
            Response.Cookies.Add(themeCookie);

            //var configuration = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
            //var pagesSection = (PagesSection)configuration.GetSection("system.web/pages");
            //pagesSection.Theme = dark;
            //configuration.Save();

            Session["sessionTheme"] = dark;

            Response.Redirect("~/homepage.aspx");
        }
    }
}