using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Receipe
/// </summary>
public class Recipe
{
    private string name;
    private string submittedBy;
    private string prepTime;

    public string Name
    {
        set { this.name = value; }
        get { return this.name; }
    }

    public string SubmittedBy
    {
        set { this.submittedBy = value; }
        get { return this.submittedBy; }
    }

    public string PrepTime
    {
        set { this.prepTime = value; }
        get { return this.prepTime; }
    }



    public Recipe()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}