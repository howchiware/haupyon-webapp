<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>쿠키 가져오기: 클라이언트 컴퓨터에 저장된 쿠키를 서버로 가져오기</h3>


	<%
		Cookie[] cc = request.getCookies();
	
		if(cc != null) {
			for(Cookie c : cc) {
				String name = c.getName();
				String value = c.getValue();
				
				if(name.equals("subject3")) {
					value = URLDecoder.decode(value, "utf-8");
				}
				
				out.print("<p>" + name + " : " + value + "</p>");
			}
		}
	%>
	
	<hr>
	
	<p>
		<a href="ex01.jsp">돌아가기</a>
	</p>

</body>
</html>