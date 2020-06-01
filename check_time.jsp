<%@ page language="java" %>
<%@ page import ="java.sql.*" %>
<%@ include file="con_driver.jsp" %> 
<%
///////////////////fetching data for processing ///////////////
String cr_id = "Q"+request.getParameter("CR");
/////////////////query//////////////////////
String sql = "select * from checklist_general where CR_ID=?";
PreparedStatement pst = con.prepareStatement(sql);
//pst.setString(1,designer);
pst.setString(1,cr_id);
ResultSet r= pst.executeQuery();
String firsttime ;
if(r.next()) 
{
firsttime = "false";
out.println("not first time!");
}
else
{
firsttime = "true";
out.println("first time!");
}
%>