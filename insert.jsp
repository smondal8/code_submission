<%@ page language="java" %>
<%@ page import ="java.sql.*" %>
<html>
  <head>
    <title>Processing data...</title>
    <META HTTP-EQUIV="refresh" CONTENT="6;URL=success.html">
</head>
<body bgcolor="#66CCCC">
<%@ include file="check_time.jsp" %> 

<%
///////////////////fetching data for processing ///////////////
//general details//
String designer = request.getParameter("fullname");
cr_id = request.getParameter("CRID");
String update_id = request.getParameter("activity");
String ZD = request.getParameter("zd");
String LOC = request.getParameter("loc");
String status = request.getParameter("status");
//checklist details//
String own_str="";
String zd_str="";
String det_str="";
String name;
for(int i=1;i<=17;i++)
    {
        name = "self"+i;
        own_str += request.getParameter(name);
        own_str += "|";
    }
out.println("own:"+own_str);
for(int j=1;j<=17;j++)
    {
        name = "zd"+j;
        zd_str += request.getParameter(name);
        zd_str += "|";
    }
out.println("zd:"+zd_str);
for(int k=1;k<=17;k++)
    {
        name = "det"+k;
        det_str += request.getParameter(name);
        det_str += "|";
    }
out.println("det:"+det_str);
/////////////////for the first insert//////////////////////
if(firsttime == "true")
{
out.print("first time er modhe ");
///////////for the general details////
sql = "insert into checklist_general(Designer_Name,CR_ID,Update_Id,ZD,LOC,Status) values (?,?,?,?,?,?)";
pst = con.prepareStatement(sql);
pst.setString(1,designer);
pst.setString(2,cr_id);
pst.setString(3,update_id);
pst.setString(4,ZD);
pst.setString(5,LOC);
pst.setString(6,status);
pst.executeUpdate();
////////for the check list////
sql = "insert into checklist_des(CR_ID,own_str,zd_str,det_str) values(?,?,?,?)";
pst = con.prepareStatement(sql);
pst.setString(1,cr_id);
pst.setString(2,own_str);
pst.setString(3,zd_str);
pst.setString(4,det_str);
pst.executeUpdate();
}
////////////////for the later time updation//////////////////////
else
{
//////update general information////////////
sql = "UPDATE checklist_general SET checklist_general.Status =? WHERE checklist_general.CR_ID=?";
//String sql1 = "UPDATE checklist_general SET checklist_general.Status = 'closed' WHERE checklist_general.CR_ID='Q2001233'";
//out.print(sql1);
pst = con.prepareStatement(sql);
pst.setString(1,status);
pst.setString(2,cr_id);
pst.executeUpdate();
///////////update checklist information////
sql = "UPDATE checklist_des SET checklist_des.own_str = ?, checklist_des.zd_str = ?, checklist_des.det_str = ? WHERE checklist_des.CR_ID=?";
pst = con.prepareStatement(sql);
pst.setString(1,own_str);
pst.setString(2,zd_str);
pst.setString(3,det_str);
pst.setString(4,cr_id);
pst.executeUpdate();
}
pst.close();
con.close();
}
catch(SQLException e)
{
out.println(e);
}
catch (Exception e)
{
out.println(e);
}
%>
<table align="center" bgcolor="#33CC99">
        <tr><td><label><h3>Processing your data...please wait...</h3></label>
        <br/></td>
        </tr>
        <tr><td align="center"><img height="50 px" width="50px" src="system_image/ajax-loader (2).gif"/>
        </td></tr>
      
</table>
</body>
</html>
