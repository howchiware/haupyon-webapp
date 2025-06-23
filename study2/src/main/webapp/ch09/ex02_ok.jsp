<%@page import="java.io.InputStream"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%
	request.setCharacterEncoding("utf-8");
	
	// enctype="multipart/form-data" 로 넘어온 데이터는
	//   request.getParameter("이름")으로 받을 수 없다
	String subject = request.getParameter("subject");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<p> subject: <%= subject %> </p> <!-- null -->
	
	<%
		String contentType = request.getContentType();
		out.print("<p> contentType: " + contentType + "</p>");
		out.print("<hr>");
		
		out.print("<h3>[헤더정보]</h3>");
		Enumeration<String> e = request.getHeaderNames();
		while(e.hasMoreElements()) {
			String name = e.nextElement();
			String value = request.getHeader(name);
			
			out.print("<p>" + name + " : " + value +  "</p>");
		}
		out.print("<hr>");
		
		out.print("<h3>[request body로 넘어온 데이터]</h3>");
		
		InputStream is = request.getInputStream();
		byte[] buf = new byte[4096];
		
		int size;
		String str;
		
		while( (size = is.read(buf)) != -1 ) {
			str = new String(buf, 0, size, "utf-8");
			
			out.print("<p>" + str + "</p>");
		}
		out.print("<hr>");
	%>
	

</body>
</html>