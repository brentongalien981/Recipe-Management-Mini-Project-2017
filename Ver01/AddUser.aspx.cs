using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void userDetails_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        grid.DataBind();
    }

    protected void userDetails_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        grid.DataBind();
    }

    protected void userDetails_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        grid.DataBind();
    }

    protected void addUserButton_Click(object sender, EventArgs e)
    {
        userDetailsView.ChangeMode(DetailsViewMode.Insert);
    }
}