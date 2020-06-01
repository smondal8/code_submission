<%-- 
    Document   : index.jsp
    Created on : Mar 10, 2012, 10:18:01 AM
    Author     : Soumya
--%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Code submission Checklist</title>
<SCRIPT>
function validate()
{
//document.writeln(document.getElementById("CR").value);
if(document.getElementById("CR").value=="")
{
alert("Please enter the CR number:");
return false;
}
else
return true;
}
function eval()
{
var val;
val = document.getElementById().value;
if(val>='a' && val<= 'z')
document.writeln("soumya");
else
{
document.writeln("coder");
}
}
</SCRIPT>
</head>
    <body bgcolor="#99FF99">
        <form action="Main.jsp" method="post" id="f">
        <table width="100%"><tr><td width="100%" align="center">
        <label style="color:#0000CC"><strong>GWC CODE SUBMISSION CHECKLIST</strong></label>
        </td>
        <tr></tr></table>
        <h3 class="style1 style1" align="center">Please enter the CR number:</h3>
        <table bgcolor="#66CCFF" align="center"><tr><td><label>Q</label></td><td><input type="text" id="CR" name="CR" align="middle" maxlength="15" border="2" onKeyDown="eval()"></td></tr><tr><td colspan="2" align="center"><input type="submit" value="Submit" onClick="return validate()"></td></tr></table>
        </form>
    </body>
</html>
