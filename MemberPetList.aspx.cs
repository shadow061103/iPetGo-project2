using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MemberPetList : System.Web.UI.Page
{
    MemberFactory factory = new MemberFactory();
    int id;
    string htmlcode = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session[Dictionary.SK_memberId]!=null)
         id = (int)Session[Dictionary.SK_memberId];

    htmlcode = factory.showPetList(Request, Response, id);
    webcontent.InnerHtml = htmlcode;
    }
}
