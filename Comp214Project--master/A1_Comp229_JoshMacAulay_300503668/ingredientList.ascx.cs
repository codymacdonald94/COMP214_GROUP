using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ingreidentList : System.Web.UI.UserControl
{
    public string TxtIngredientName
    {
        get { return txtIngredientName.Text; }
    }

    public int TxtQuantity
    {
        get { return Convert.ToInt32(txtQuantity.Text); }
    }

    public string TxtUnitMeasure
    {
        get { return txtUnitMeasure.Text; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    

    }
}