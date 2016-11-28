using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// PetSearchFactory 的摘要描述
/// </summary>
public class PetSearchFactory
{
    
    SqlDataSource sds;
   
    public PetSearchFactory()
    {


        sds = new SqlDataSource();
        sds.ConnectionString = WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"].ConnectionString;
      
    }

    //登記走失寵物
    public int InsertMissPetInfo(PetSearch petsearch)
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["iPetGoConnectionString"]
             .ConnectionString);
        con.Open();


        string strSQL = "Insert into tLosingPetCheckin(MemberAccount,fName"
                  + ",fPhone,fPetName,fPetType,fPetDescription,fPetPic,fLosingArea,fLosingAddress,fLosingPoint,fLongitude,fLatitude,fLosingDate,fStatus) "
                  + "values (@MemberAccount,@fName"
                  + ",@fPhone,@fPetName,@fPetType,@fPetDescription,@fPetPic,@fLosingArea,@fLosingAddress,@fLosingPoint,@fLongitude,@fLatitude,@fLosingDate,@fStatus)";


        SqlCommand cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.AddWithValue(@"MemberAccount", petsearch.MemberAccount);
        cmd.Parameters.AddWithValue(@"fName", petsearch.fName);
        cmd.Parameters.AddWithValue(@"fPhone", petsearch.fPhone);
        cmd.Parameters.AddWithValue(@"fPetName", petsearch.fPetName);
        cmd.Parameters.AddWithValue(@"fPetType", petsearch.fPetType);
        cmd.Parameters.AddWithValue(@"fPetDescription", petsearch.fPetDescription);
        cmd.Parameters.AddWithValue(@"fPetPic", petsearch.fPetPic);
        cmd.Parameters.AddWithValue(@"fLosingArea", petsearch.fLosingArea);
        cmd.Parameters.AddWithValue(@"fLosingAddress", petsearch.fLosingAddress);
        cmd.Parameters.AddWithValue(@"fLosingPoint", petsearch.fLosingPoint);
        cmd.Parameters.AddWithValue(@"fLongitude", petsearch.fLongitude);
        cmd.Parameters.AddWithValue(@"fLatitude", petsearch.fLatitude);
        cmd.Parameters.AddWithValue(@"fLosingDate", petsearch.fLosingDate);
        cmd.Parameters.AddWithValue(@"fStatus", petsearch.fStatus);


        int i=cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }


    //更新走失資訊

    public PetSearch UpdateLosingPetInfo(PetSearch p)
    {
        sds.UpdateCommand = "UPDATE tLosingPetCheckin SET " +
                            "MemberAccount=@MemberAccount,fName=@fName,fPhone=@fPhone,fPetName=@fPetName,fPetType=@fPetType,fPetDescription=@fPetDescription," +
                            "fPetPic=@fPetPic,fLosingArea=@fLosingArea,fLosingAddress=@fLosingAddress,fLosingPoint=@fLosingPoint,fLongitude=@fLongitude,fLatitude=@fLatitude," +
                            "fLosingDate=@fLosingDate,fStatus=@fStatus where fId=@fId";

        sds.UpdateParameters.Add("fid",p.fId.ToString());
        sds.UpdateParameters.Add("MemberAccount",p.MemberAccount);
        sds.UpdateParameters.Add("fName",p.fName);
        sds.UpdateParameters.Add("fPhone",p.fPhone);
        sds.UpdateParameters.Add("fPetName",p.fPetName);
        sds.UpdateParameters.Add("fPetType",p.fPetType);
        sds.UpdateParameters.Add("fPetDescription",p.fPetDescription);
        sds.UpdateParameters.Add("fPetPic", p.fPetPic);
        sds.UpdateParameters.Add("fLosingArea",p.fLosingArea);
        sds.UpdateParameters.Add("fLosingAddress",p.fLosingAddress);
        sds.UpdateParameters.Add("fLosingPoint",p.fLosingPoint);
        sds.UpdateParameters.Add("fLongitude",p.fLongitude);
        sds.UpdateParameters.Add("fLatitude",p.fLatitude);
        sds.UpdateParameters.Add("fLosingDate",p.fLosingDate);
        sds.UpdateParameters.Add("fStatus", p.fStatus);
        sds.Update();

        return p;
    }

    //更新走失寵物狀態
    public PetSearch UpdateStatus(PetSearch s)
    {
       
        sds.UpdateCommand = "UPDATE tLosingPetCheckin SET fStatus=@fStatus where fId=@fId";
        sds.UpdateParameters.Add("fid", s.fId.ToString());
        sds.UpdateParameters.Add("fStatus", s.fStatus);

        sds.Update();

        return s;
    }


    //show出寵物資料

    public PetSearch showLosingPetInfo(string id)
    {
        

        sds.SelectCommand = "select * from tLosingPetCheckin where fId = @pk";
        sds.SelectParameters.Add("pk", id);
        DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;

        PetSearch search = new PetSearch();

        search.fId = Convert.ToInt32(dv.Table.Rows[0]["fId"]);
        search.MemberAccount = dv.Table.Rows[0]["MemberAccount"].ToString();
        search.fName = dv.Table.Rows[0]["fName"].ToString();
        search.fPhone = dv.Table.Rows[0]["fPhone"].ToString();
        search.fPetName = dv.Table.Rows[0]["fPetName"].ToString();
        search.fPetType = dv.Table.Rows[0]["fPetType"].ToString();
        search.fPetDescription = dv.Table.Rows[0]["fPetDescription"].ToString();
        search.fPetPic = dv.Table.Rows[0]["fPetPic"].ToString();
        search.fLosingArea = dv.Table.Rows[0]["fLosingArea"].ToString();
        search.fLosingAddress = dv.Table.Rows[0]["fLosingAddress"].ToString();
        search.fLosingPoint = dv.Table.Rows[0]["fLosingPoint"].ToString();
        search.fLongitude = dv.Table.Rows[0]["fLongitude"].ToString();
        search.fLatitude = dv.Table.Rows[0]["fLatitude"].ToString();
      
        DateTime oDate = Convert.ToDateTime(dv.Table.Rows[0]["fLosingDate"].ToString());
        search.fLosingDate = String.Format("{0:yyyy-MM-dd}",oDate);

        search.fStatus = dv.Table.Rows[0]["fStatus"].ToString();

        return search;

    }





}

