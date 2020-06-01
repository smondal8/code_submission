<html>
    <head>
        <script src="java_script/enable.js"></script>
        <script src="java_script/watermark.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Checklist Entry Page:</title></head>
    <body>
<%@ include file="check_time.jsp" %>
<%@include file="get_checklist.jsp"%>
    <form action="insert.jsp" method="post" id="frm" onSubmit="enableAll(frm)">
    <input name="user" type="hidden" value="">
<table align="center" border="1" width="100 %" bgcolor="#99CC33">
            <tr><td width="50%"><b>Designer Name:</b></td><td width="50%"><input type="text" id="fullname" name="fullname" value="<%
String Stat ="";
if(firsttime == "false")
{
   out.print(r.getString(1));
   out.print("\" readonly = \"true\"");
}

%>
"></td></tr>
            <tr><td width="20%"><b>Activity/CR ID:</b></td><td width="80%"><input type="text" id="CRID" name="CRID" readonly value="Q<%=request.getParameter("CR")%>"><input name="CR" type="hidden" value="<%=request.getParameter("CR")%>"></td></tr>
            <tr><td width="20%"><b>Update ID:</b></td><td width="80%"><input type="text" id="activity" name="activity" value="
<%
if(firsttime == "false")
{
   out.print(r.getString(3));
   out.print("\" readonly = \"true\"");
}
%>
"></td></tr>
            <tr><td width="20%"><b>Check list reviewer(ZD):</b></td><td width="80%"><input type="text" id="zd" name="zd" value="
<%
if(firsttime == "false")
{
   out.print(r.getString(4));
   out.print("\" readonly = \"true\"");
}
%>
"></td></tr>
            <tr><td width="20%"><b>LOC Changed:</b></td><td width="80%"><input type="text" id="loc" name="loc" value="
<%
if(firsttime == "false")
{
   out.print(r.getString(5));
   out.print("\" readonly = \"true\"");
}
%>
"></td></tr>
	      <tr><td width="20%"><b>Check list status:</b></td><td width="80%"><select name="status">
            <%
            if(firsttime == "false")
            {
			 Stat = r.getString(6);
			 //out.print(Stat);
            if(Stat.equals("default"))
			{
   		    out.print("<option value=\"default\" selected>Please Select</option>");
            out.print("<option value=\"owner\">Owner's update</option>");
            out.print("<option value=\"zd\">ZD's update</option>");
            out.print("<option value=\"closed\">Close Checklist</option>");
			}
			else if(Stat.equals("owner"))
			{
			out.print("<option value=\"default\">Please Select</option>");
            out.print("<option value=\"owner\"  selected>Owner's update</option>");
            out.print("<option value=\"zd\">ZD's update</option>");
            out.print("<option value=\"closed\">Close Checklist</option>");
			}
			else if(Stat.equals("zd"))
			{
			out.print("<option value=\"default\">Please Select</option>");
            out.print("<option value=\"owner\">Owner's update</option>");
            out.print("<option value=\"zd\" selected>ZD's update</option>");
            out.print("<option value=\"closed\">Close Checklist</option>");
			}
			else if(Stat.equals("closed"))
			{
			out.print("<option value=\"default\">Please Select</option>");
            out.print("<option value=\"owner\">Owner's update</option>");
            out.print("<option value=\"zd\">ZD's update</option>");
            out.print("<option value=\"closed\"  selected>Close Checklist</option>");	
			}
            }
			else
			{
			out.print("<option value=\"default\" selected>Please Select</option>");
            out.print("<option value=\"owner\">Owner's update</option>");
            out.print("<option value=\"zd\">ZD's update</option>");
            out.print("<option value=\"closed\">Close Checklist</option>");
			}
			%>
          </select></td>
    </tr>
    </table>
    <table align="center" border="0" cellpadding="10" width="100 %" bgcolor="#66CCFF">
    <th><b>Environment</b></th>
    <th><b>Category</b></th>
    <th><b>Check</b></th>
    <th><b>Who will Check?</b></th>
    <th><b>Self</b></th>
    <th><b>ZD</b></th>
    <th><b>Details</b></th>
    <tr>
    <td align="center"><b>Common</b></td>
    
    <td align="center">
    <b>Pre Submission</b>    </td>
    <td width="80 %">
    <label id="Chk"><b>CR status in CLARIFY: Work In Progress?</b></label>    </td>
    <td align="center">Self</td>
    <td align="center">
    <select name="self1"<%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>
    >
     <%
	 if(own_arr[0]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[0]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[0]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center"><select name="zd1" <%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
      <%
	 if(zd_arr[0]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[0]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[0]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select></td>
    <td align="center" valign="middle" width="100 %"><textarea name="det1"<%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[0]);
	%></textarea></td>
    </tr>
    <tr>
    <td align="center"><b>Common</b></td>
    
    <td align="center">
    <b>Pre Submission</b>    </td>
    <td width="80 %">
    <label id="Lnk"><b>Is the CR linked with Update ID?</b></label>    </td>
    <td align="center">Self</td>
    <td align="center">
    <select name="self2"<%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(own_arr[1]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[1]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[1]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center">
    <select name="zd2"<%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(zd_arr[1]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[1]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[1]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center" valign="middle" width="100 %"><textarea name="det2" <%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[1]);
	%></textarea></td>
    </tr>
    <tr>
    <td align="center"><b>Common</b></td>
    
    <td align="center">
    <b>Pre Submission</b>    </td>
    <td width="80 %">
    <label id="updttxt"><b>Is the Update text of the Update ID according to recommended template?</b></label>    </td>
    <td align="center">Self &amp; ZD</td>
    <td align="center"><select name="self3" id="self3" <%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
      <%
	 if(own_arr[2]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[2]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[2]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select></td>
    <td align="center">
    <select name="zd3" id="zd3"<%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(zd_arr[2]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"2\"> N.A. </option>");
	 }
	 else if(zd_arr[2]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"2\"> N.A. </option>");
	 }
	 else if(zd_arr[2]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"2\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"2\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center" valign="middle" width="100 %"><textarea name="det3" id="det3" <%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[2]);
	%></textarea></td>
    </tr>
    <tr>
    <td align="center"><b>Common</b></td>
    
    <td align="center">
    <b>Pre Submission</b>    </td>
    <td width="80 %">
    <label id="idce"><b>Are all internal and external review defects (IDCE) closed/addressed?</b></label>    </td>
    <td align="center">Self &amp; ZD</td>
    <td align="center">
    <select name="self4" id="self4" <%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(own_arr[3]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[3]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[3]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center">
    <select name="zd4" id="zd4"<%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(zd_arr[3]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[3]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[3]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center" valign="middle" width="100 %"><textarea name="det4" id="det4" <%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[3]);
	%></textarea></td>
    </tr>
    <tr>
    <td align="center"><b>Common</b></td>
    
    <td align="center">
    <b>Pre Submission</b>    </td>
    <td width="80 %">
    <label id="delta"><b>Has the final code deltas been uploaded in IDCE?</b></label>    </td>
    <td align="center">Self &amp; ZD</td>
    <td align="center">
    <select name="self5" id="self5" <%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(own_arr[4]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[4]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[4]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center">
    <select name="zd5" id="zd5"<%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(zd_arr[4]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[4]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[4]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center" valign="middle" width="100 %"><textarea name="det5" id="det5" <%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[4]);
	%></textarea></td>
    </tr>
    <tr>
    <td align="center"><b>Common</b></td>
    
    <td align="center">
    <b>Pre Submission</b>    </td>
    <td width="80 %">
    <label id="statidce"><b>Status of IDCE record: Inspection Completed?</b></label>    </td>
    <td align="center">Self &amp; ZD</td>
    <td align="center">
    <select name="self6" id="self6" <%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
        <%
	 if(own_arr[5]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[5]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[5]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center"><select name="zd6" id="zd6"<%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(zd_arr[5]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[5]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[5]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select></td>
    <td align="center" valign="middle" width="100 %"><textarea name="det6" id="det6" <%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[5]);
	%></textarea></td>
    </tr>
    <tr>
   <td align="center"><b>Common</b></td>
    
    <td align="center">
    <b>Pre Submission</b>    </td>
    <td width="80 %">
    <label id="flxlint"><b>Has flexlint report shared with GHs / ZD post comment closure show zero warnings?</b></label>    </td>
    <td align="center">Self &amp; ZD</td>
    <td align="center">
    <select name="self7" id="self7" <%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
        <%
	 if(own_arr[6]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[6]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[6]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center">
    <select name="zd7" id="zd7"<%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(zd_arr[6]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[6]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[6]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center" valign="middle" width="100 %"><textarea name="det7" id="det7" <%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[6]);
	%></textarea></td>
    </tr>
    <tr>
   <td align="center"><b>Common</b></td>
    
    <td align="center">
    <b>Pre Submission</b>    </td>
    <td width="80 %">
    <label id="submitted"><b>Is the code being submitted same as the approved code in IDCE?</b></label>    </td>
    <td align="center">Self &amp; ZD</td>
    <td align="center"><select name="self8" id="self8" <%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
      <%
	 if(own_arr[7]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[7]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[7]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select></td>
    <td align="center">
    <select name="zd8" id="zd8"<%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(zd_arr[7]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[7]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[7]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center" valign="middle" width="100 %"><textarea name="det8" id="det8" <%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[7]);
	%></textarea></td>
    </tr>
    <tr>
   <td align="center"><b>Common</b></td>
    
    <td align="center">
    <b>Pre Submission</b>    </td>
    <td width="80 %">
    <label id="cntrlchar"><b>Have you checked for control characters in your file?</b></label>    </td>
    <td align="center">Self</td>
    <td align="center">
    <select name="self9" id="self9" <%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
        <%
	 if(own_arr[8]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[8]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[8]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center">
    <select name="zd9" id="zd9"<%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(zd_arr[8]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[8]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[8]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center" valign="middle" width="100 %"><textarea name="det9" id="det9" <%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[8]);
	%></textarea></td>
    </tr>
    <tr>
    <td align="center"><strong>Clearcase</strong></td>
    
    <td align="center">
    <b>Pre Submission</b>    </td>
    <td width="80 %">
    <label id="rebase"><b>Is the Code rebasing done ?</b></label>    </td>
    <td align="center">Self</td>
    <td align="center">
    <select name="self10" id="self10" <%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
        <%
	 if(own_arr[9]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[9]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[9]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center">
    <select name="zd10" id="zd10"<%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(zd_arr[9]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[9]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[9]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center" valign="middle" width="100 %"><textarea name="det10" id="det10" <%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[9]);
	%></textarea></td>
    </tr>
    <tr>
    <td align="center"><b>Clearcase</b></td>
    
    <td align="center">
    <b>Pre Submission</b>    </td>
    <td width="80 %">
    <label id="clnmake"><b>Is a clean loadbuild (clean make) done on local server with rebased code on all affected nodes?</b></label>    </td>
    <td align="center">Self</td>
    <td align="center"><select name="self11" id="self11" <%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
      <%
	 if(own_arr[10]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[10]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[10]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select></td>
    <td align="center">
    <select name="zd11" id="zd11"<%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(zd_arr[10]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[10]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[10]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center" valign="middle" width="100 %"><textarea name="det11" id="det11" <%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[10]);
	%></textarea></td>
    </tr>
    <tr>
    <td align="center"><b>Clearcase</b></td>
    
    <td align="center">
    <b>Pre Submission</b>    </td>
    <td width="80 %">
    <label id="sbuild"><b>Is Cloberall and Sbuild done for all architecture (PPC970mp, i686, x86_64s)?</b></label>    </td>
    <td align="center">Self</td>
    <td align="center">
    <select name="self12" id="self12" <%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
        <%
	 if(own_arr[11]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[11]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[11]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center">
    <select name="zd12" id="zd12"<%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(zd_arr[11]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[11]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[11]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center" valign="middle" width="100 %"><textarea name="det12" id="det12" <%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[11]);
	%></textarea></td>
    </tr>
    <tr>
    <td align="center"><b>Clearcase</b></td>
    
    <td align="center">
    <b>During Submission</b>    </td>
    <td width="80 %">
    <label id="umask"><b>Are the permissions correct for newly created file/dir elements (ct protect, umask 2 etc.)?</b></label>    </td>
    <td align="center">Self</td>
    <td align="center">
    <select name="self13" id="self13" <%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(own_arr[12]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[12]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[12]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center"><select name="zd13" id="zd13"<%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(zd_arr[12]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[12]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[12]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select></td>
    <td align="center" valign="middle" width="100 %"><textarea name="det13" id="det13" <%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[12]);
	%></textarea></td>
    </tr>
    <tr>
   <td align="center"><strong>PLS</strong></td>
    
    <td align="center">
    <b>Post Submission</b>    </td>
    <td width="80 %">
    <label id="cmpltloadbuild"><b>Have you done a complete loadbuild with savesourced code?</b></label>    </td>
    <td align="center">Self</td>
    <td align="center">
    <select name="self14" id="self14" <%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
        <%
	 if(own_arr[13]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[13]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[13]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center"><select name="zd14" id="zd14"<%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
      <%
	 if(zd_arr[13]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[13]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[13]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select></td>
    <td align="center" valign="middle" width="100 %"><textarea name="det14" id="det14" <%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[13]);
	%></textarea></td>
    </tr>
    <tr>
    <td align="center"><b>Clearcase</b></td>
    
    <td align="center">
    <b>Post Submission</b>    </td>
    <td width="80 %">
    <label id="merge"><b>Has the element got automerged and all merge conflicts resolved?</b></label>    </td>
    <td align="center">Self</td>
    <td align="center">
    <select name="self15" id="self15" <%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
        <%
	 if(own_arr[14]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[14]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[14]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center">
    <select name="zd15" id="zd15"<%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(zd_arr[14]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[14]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[14]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center" valign="middle" width="100 %"><textarea name="det15" id="det15" <%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[14]);
	%></textarea></td>
    </tr>
    <tr>
    <td align="center"><b>Common</b></td>
    
    <td align="center">
    <b>Pre Submission</b>    </td>
    <td width="80 %">
    <label id="sanity"><b>Have you verified for the sanity of the deltas after submission?</b></label>    </td>
    <td align="center">Self</td>
    <td align="center"><select name="self16" id="self16" <%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
        <%
	 if(own_arr[15]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[15]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[15]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select></td>
    <td align="center">
    <select name="zd16" id="zd16"<%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(zd_arr[15]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[15]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[15]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select>    </td>
    <td align="center" valign="middle" width="100 %"><textarea name="det16" id="det16" <%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[15]);
	%></textarea></td>
    </tr>
    <tr>
    
   <td align="center"><b>Common</b></td>
    
    <td align="center">
    <b>Pre Submission</b>    </td>
    <td width="80 %">
    <label id="Chk"><b>Have you ensured that designer load build is successfully with latest files by creating another view (Do an incremental build first then do a clean build. You can try compiling modified directories first)?</b></label>    </td>
    <td align="center">Self</td>
    <td align="center"><select name="self17" id="self17" <%
	if(firsttime == "false" && (Stat.equals("zd") || Stat.equals("closed")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
       <%
	 if(own_arr[16]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[16]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(own_arr[16]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select></td>
    <td align="center"><select name="zd17" id="zd17"<%
	if(firsttime == "false" && (Stat.equals("closed")||Stat.equals("owner")))
	{
		out.print("Disabled = \"true\"");
	}
	%>>
      <%
	 if(zd_arr[16]=='1')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\" selected>Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[16]=='2')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\" selected>No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 else if(zd_arr[16]=='3')
	 {
	 out.println("<option value=\"0\">Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\" selected> N.A. </option>");
	 }
	 else
	 {
	 out.println("<option value=\"0\" selected>Please select</option>");
	 out.println("<option value=\"1\">Yes</option>");
	 out.println("<option value=\"2\">No</option>");
	 out.println("<option value=\"3\"> N.A. </option>");
	 }
	 %>
    </select></td>
    <td align="center" valign="middle" width="100 %"><textarea name="det17" id="det17" <%
	if(firsttime == "false" && Stat.equals("closed"))
	{
		out.print("Disabled = \"true\"");
	}
	%>><%
	if(firsttime == "false")
	out.print(det_arr[16]);
	%></textarea></td>
    </tr>
    <tr><td colspan="3"> 
    </td><td align="center"><input type="submit" value="Submit" align="middle" width="100 %">
    <input type="reset" value="Reset" width="100 %">
    </td><td colspan="3"></td></tr>
    </table>
<%
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
    </form>
    </body>
</html>
