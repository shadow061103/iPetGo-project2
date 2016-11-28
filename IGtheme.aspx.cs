using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {       

    }

    [System.Web.Services.WebMethod]
    public void DoMyOnClickCall(object sender, EventArgs e)
    {
        // sender is the li dom element you'll need to cast it though.
        int aa = 0;
        aa++;
    }


}