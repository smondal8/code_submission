<%@ page language="java" %>
<%@ page import ="java.sql.*" %>
<%@include file="string_operation.jsp"%>
<%
String sql1 = "select * from checklist_des where CR_ID=?";
pst = con.prepareStatement(sql1);
pst.setString(1,cr_id);
ResultSet r1= pst.executeQuery();
String own_str="";
String zd_str ="";
String det_str ="";
char own_arr[] = new char[17];
char zd_arr[] = new char[17];
String det_arr[] = new String[17];
////////////////populating data for own/////////
if(r1.next())
{
    own_str = r1.getString(2);
    out.println(own_str);
	own_arr = string_tochar(own_str);
	 //////////////populating data for zd///////////////
    zd_str = r1.getString(3);
    out.println(zd_str);
	zd_arr = string_tochar(zd_str);
	//////////////////populating data for details///////////////
	det_str = r1.getString(4);
	out.println(det_str);
	det_arr = string_toStringArray(det_str);
}
%>