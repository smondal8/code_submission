<%@ page import="sun.misc.BASE64Encoder,java.util.regex.*" %>

<%
String s=null;
String auth = request.getHeader("Authorization");
out.println("the header got here is :"+auth);

if (auth == null) {
        response.setStatus(response.SC_UNAUTHORIZED);
        response.setHeader("WWW-Authenticate", "NTLM");
        return;
}
if (auth.startsWith("NTLM ")) { 
        byte[] msg = new sun.misc.BASE64Decoder().decodeBuffer(auth.substring(5));
        int off = 0, length, offset;
        
 
        if (msg[8] == 1) { 
            off = 18;
 
            byte z = 0;
            byte[] msg1 = {(byte)'N', (byte)'T', (byte)'L', (byte)'M', (byte)'S',
                            (byte)'S', (byte)'P', z,
                            (byte)2, z, z, z, z, z, z, z,
                            (byte)40, z, z, z, (byte)1, (byte)130, z, z,
                            z, (byte)2, (byte)2, (byte)2, z, z, z, z, // 
                            z, z, z, z, z, z, z, z};
            // 
            response.setStatus(response.SC_UNAUTHORIZED);
            response.setHeader("WWW-Authenticate", "NTLM " 
                  + new sun.misc.BASE64Encoder().encodeBuffer(msg1).trim());
            return;
        } 
        else if (msg[8] == 3) { 
                off = 30;
                length = msg[off+17]*256 + msg[off+16];
                offset = msg[off+19]*256 + msg[off+18];
                s = new String(msg, offset, length);
                //out.println(s + " ");
        } 
        else
                return;
 
        length = msg[off+1]*256 + msg[off];
        offset = msg[off+3]*256 + msg[off+2];
        s = new String(msg, offset, length);
        //out.println(s + " ");
        length = msg[off+9]*256 + msg[off+8];
        offset = msg[off+11]*256 + msg[off+10];
        s = new String(msg, offset, length);
		Pattern pat = Pattern.compile("[a-z,A-Z,0-9]+");
		Matcher mat = pat.matcher(s);
		String s1 = "";
		while(mat.find())
		{
					System.out.println("Got name: "+mat.group());
					s1 = s1+mat.group();
		}
		System.out.println("Got name: "+s1);
		if(s.indexOf('.')!=-1)
		{
			System.out.println("dots!!!");
		}
		s.replaceAll("[.]","");
		System.out.println("Got name again: "+s);
           out.println(s);
        //out.println("Hello  <span style='position:relative; width:190;" 
          //  + " height:10;filter:glow(Color=#009966,Strength=1)'>");
        //out.println(s + "</SPAN>");
         // out.println("<br><br><b>"+s+"</b>");
        }


%>
