<%
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
String database="C://Program Files (x86)/apache-tomcat-6.0.35-windows-x86/apache-tomcat-6.0.35/webapps/code_submission/database/checklist.mdb;";
String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ=";
url += database.trim() + ";DriverID=22;READONLY=true}"; // add on to the end
Connection con=DriverManager.getConnection(url, "", "");
%>